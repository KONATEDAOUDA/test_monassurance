<?php
namespace App\Http\Controllers\Notifications;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\CallMe;
use Illuminate\Support\Facades\Session;

class CallMeController extends Controller
{
    public function requestCall(Request $req)
    {
    	//if(Session::has('is_callable')){
            Session::put('is_callable', true);
            $callMe = new callMe();
            $callMe->call_name = $req->get('call_name');
            $callMe->call_phone = $req->get('call_phone');
            $callMe->call_motif = $req->get('call_motif');
            $callMe->reason = "";
            $callMe->advisor_user_id = 0;
            $callMe->advisor_conclusion = 0;
            $callMe->save();
    		event(new \App\Events\CallMePusherEvent($req->get('call_name'),$req->get('call_phone'),$callMe));
    		return json_encode($callMe);
       // }
       // else{
        //	return 0;
        //}


    	
    }

    public function showSingleCallNotifPage($id_call)
    {
        return CallMe::where('id',$id_call)->first();
    }
}
