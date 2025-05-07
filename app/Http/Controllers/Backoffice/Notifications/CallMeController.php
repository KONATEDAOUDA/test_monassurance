<?php

namespace App\Http\Controllers\Backoffice\Notifications;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CallMe;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Carbon;
use Snowfire\Beautymail\Beautymail;
use Symfony\Component\Mime\Part\TextPart;
use Illuminate\Support\Facades\Mail;

class CallMeController extends Controller
{


    public function showCallNotifPage()
    {  	
    	$active_call_me = CallMe::where('advisor_user_id','=',0)->get();
        $my_finish_call_me = CallMe::where('advisor_user_id','=',Auth::user()->id)->get();

    	$all_finish_call_me = CallMe::join("users", "users.id","advisor_user_id")->select("callme_log.*", "users.id", "users.firstname", "users.lastname")->where('advisor_user_id','!=',0)->get();

    	return view('Backoffice.backend.notification.callme-notification')->with(['isActive'=>'','active_call_me'=>$active_call_me,'my_finish_call_me'=>$my_finish_call_me,'all_finish_call_me'=>$all_finish_call_me]);
    }


    public function showSingleCallNotifPage($id_call)
    {
    	$call = CallMe::where('call_id',$id_call)->first();
        return view('Backoffice.backend.notification.callme-one-notification')->with(['call'=>$call,'isActive'=>'dashboard']);
    }


    public function postCallNotif(Request $req)
    {
        if($req->relance_date!="") $relance = Carbon::createFromFormat("d/m/Y", $req->relance_date)->toDateString(); else $relance = null;

       
        CallMe::where("call_id",$req->call_id)
          ->update([
            'call_name' => $req->call_name,
            'call_phone' => $req->call_phone,
            'advisor_conclusion' => $req->conclusion,
            'reason' => $req->call_reason,
            'date_relance' => $relance,
            'advisor_user_id' => Auth::user()->id,
            ]);

         return redirect()->route('notiication.call');
    }


    public function getCallNotif($id_call)
    {
    	return json_encode(CallMe::where('call_id',$id_call)->first());
    }

    public function chat(Request $req)
    {
        $exitCode = Artisan::call('chat:message', [
               'message' => $req->message
           ]);
    }
    public function sendEmail(Request $request)
    {
        $request->validate([
            'emails' => 'required|array',
            'emails.*' => 'email',
            'objet' => 'required|string|max:255',
            'mail_note' => 'required|string',
            'attachments.*' => 'file|max:10240',
        ]);
    
        $emails = $request->input('emails');
        $subject = $request->input('objet');
        $messageBody = $request->input('mail_note');
        $attachments = $request->file('attachments');
    
        foreach ($emails as $email) {
            Mail::send([], [], function ($message) use ($email, $subject, $messageBody, $attachments) {
                $message->to($email)
                        ->subject($subject)
                        ->setBody(new TextPart($messageBody, 'utf-8', 'html')); // Définit le corps de l'email
    
                if ($attachments) {
                    foreach ($attachments as $attachment) {
                        $message->attach($attachment->getRealPath(), [
                            'as' => $attachment->getClientOriginalName(),
                            'mime' => $attachment->getMimeType(),
                        ]);
                    }
                }
            });
        }
    
        return redirect()->back()->with('success', 'Emails envoyés avec fichiers joints.');
    }

    public function sendEmailSimple(Request $request)
    {
        $mail_brute = strip_tags($request->mail_note);
        $objet = $request->objet;

        $this->mailCallAPI($request->emails,$objet,$mail_brute);

        $this->storeNotification("EMAIL",0,$objet,"#$request->emails#<br/>".$mail_brute);
        
        Session::flash('success','Email envoyé avec succès!');
        return redirect()->back();

        
    }

    public function mailCallAPI($email, $objet, $mail_content)
    {
        $beautymail = app()->make(Beautymail::class);
    
        $beautymail->send('emails.client_notif', ["mail_content" => $mail_content], function($message) use ($email, $objet) {
            $message
                ->from('no-reply@monassurance.ci')
                ->to(strtolower($email))
                ->subject($objet);
        });
    }
    


    protected function storeNotification($type_notif,$to_user,$head,$body)
    {
        DB::table('sending_notification')->insert([
            'type_notif' => $type_notif,
            'from_user' => Auth::user()->id,
            'to_user' => $to_user,
            'head_notif' => $head,
            'body_notif' => $body,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);
    }

    public function sendSMS(Request $request)
    {
        $sms_brute = strip_tags($request->sms_note);
        $sender_id = $request->sender_id;
        $orders = getActiveAutoOrders();

        foreach ($request->contacts as $key => $contact) {
            foreach ($orders as $key => $o) {
                if( (strtotime($o->expired_date. "-15 days")) <= (strtotime(date("Y-m-d")))){
                    if($contact==$o->contact){
                        if (strpos($sms_brute, '@nom_prenom@') !== false) $sms_brute = str_replace('@nom_prenom@', $o->firstname.' '.$o->lastname, $sms_brute);
                        if (strpos($sms_brute, '@num_commande@') !== false) $sms_brute = str_replace('@num_commande@', $o->number_n, $sms_brute);
                        if (strpos($sms_brute, '@date_expire@') !== false) $sms_brute = str_replace('@date_expire@', date("d/m/Y", strtotime($o->expired_date." -1 days"))." à 23:59:59", $sms_brute);
                        if (strpos($sms_brute, '@duree_expire@') !== false) $sms_brute = str_replace('@duree_expire@', dateDiff(time(), strtotime($o->expired_date))["day"]." jours", $sms_brute);

                        $this->smsCallGatewayAPI($sms_brute, $sender_id, $contact);
                        $this->storeNotification("SMS",$o->user_id,$sender_id,$sms_brute);
                    }
                }
            }
            
        }
        Session::flash('success','Campagne de sms envoyé avec succès!');
        return redirect()->back();

        
    }

    public function sendSMSSimple(Request $request)
    {
        $sms_brute = strip_tags($request->sms_note);
        $sender_id = $request->sender_id;


        $this->smsCallGatewayAPI($sms_brute, $sender_id, $request->contacts);
        $this->storeNotification("SMS",0,$sender_id,"#$request->contacts#<br/>".$sms_brute);
           
        Session::flash('success','Campagne de sms envoyé avec succès!');
        return redirect()->back();

        
    }

    private function replacePlaceholders($content, $order)
    {
        $content = str_replace('@nom_prenom@', $order->firstname . ' ' . $order->lastname, $content);
        $content = str_replace('@num_commande@', $order->number_n, $content);
        $content = str_replace('@date_expire@', date("d/m/Y", strtotime($order->expired_date . " -1 days")) . " à 23:59:59", $content);
        $content = str_replace('@duree_expire@', dateDiff(time(), strtotime($order->expired_date))["day"] . " jours", $content);
        
        return $content;
    }
}
