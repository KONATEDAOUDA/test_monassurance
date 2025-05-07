<?php

namespace App\Http\Controllers\MySpace;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\EspacePersoAccount;
use App\Models\Quotation;
use App\Models\AssuranceAutoInfos;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Carbon\Carbon;


class MySpaceController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth.persoaccount');
    }

    public function showSpacePage()
    {
        $contrats_auto = DB::table('quotation')
            ->join('assurance_auto_infos', 'assurance_auto_infos.id', 'quotation.assurance_infos_id')
            ->join('auto_company', 'auto_company.id', 'quotation.company_id')
            ->join('periode', 'periode.id', 'assurance_auto_infos.periode')
            ->join('users', 'users.id', 'quotation.user_id')
            ->join('made_quote', 'made_quote.quote_id', 'quotation.id')
            ->select(
                'quotation.id as qid',
                'number_n',
                'auto_company.compname',
                'auto_company.id as comp_id',
                'guarante',
                'inbox_amount',
                'quotation.id',
                'quotation.product_type',
                'nbmois',
                'periode.periode',
                'assurance_auto_infos.releasedate',
                'firstname',
                'lastname',
                'quotation.created_at',
                'quotation.is_payed' , // Inclure la colonne is_payed
                'quotation.inbox_amount', // Inclure inbox_amount
            )
            ->where(['quotation.status' => 5, 'made_quote.account_id' => Auth::guard('space_perso')->user()->id])
            ->get();

        $devis_auto = DB::table('quotation')
            ->join('assurance_auto_infos', 'assurance_auto_infos.id', 'quotation.assurance_infos_id')
            ->join('periode', 'periode.id', 'assurance_auto_infos.periode')
            ->join('users', 'users.id', 'quotation.user_id')
            ->join('made_quote', 'made_quote.quote_id', 'quotation.id')
            ->select(
                'quotation.id as qid',
                'number_n',
                'guarante',
                'nbmois',
                'quotation.product_type',
                'periode.periode',
                'assurance_auto_infos.releasedate',
                'firstname',
                'lastname',
                'quotation.created_at',
                'quotation.company_id',
                'quotation.is_payed', // Inclure la colonne is_payed
                'quotation.inbox_amount', // Inclure inbox_amount
            )
            ->where('product_type', '=', 1) // Automobile
            ->where('made_quote.account_id', '=', Auth::guard('space_perso')->user()->id)
            ->where('quotation.status', '<', 5) // Devis non confirmé
            ->orderBy('quotation.id', 'desc')
            ->get();

        $contrats_moto = DB::table('quotation')
            ->join('assurance_auto_infos', 'assurance_auto_infos.id', 'quotation.assurance_infos_id')
            ->join('auto_company', 'auto_company.id', 'quotation.company_id')
            ->join('periode', 'periode.id', 'assurance_auto_infos.periode')
            ->join('users', 'users.id', 'quotation.user_id')
            ->join('made_quote', 'made_quote.quote_id', 'quotation.id')
            ->select(
                'quotation.id as qid',
                'number_n',
                'auto_company.compname',
                'auto_company.id as comp_id',
                'guarante',
                'inbox_amount',
                'quotation.product_type',
                'quotation.id',
                'nbmois',
                'periode.periode',
                'assurance_auto_infos.releasedate',
                'firstname',
                'lastname',
                'quotation.created_at',
                'quotation.is_payed', // Inclure la colonne is_payed
                'quotation.inbox_amount', // Inclure inbox_amount
            )
            ->where(['quotation.status' => 5, 'made_quote.account_id' => Auth::guard('space_perso')->user()->id])
            ->where('product_type', '=', 2) // Moto
            ->get();

        $devis_moto = DB::table('quotation')
            ->join('assurance_auto_infos', 'assurance_auto_infos.id', 'quotation.assurance_infos_id')
            ->join('periode', 'periode.id', 'assurance_auto_infos.periode')
            ->join('users', 'users.id', 'quotation.user_id')
            ->join('made_quote', 'made_quote.quote_id', 'quotation.id')
            ->select(
                'quotation.id as qid',
                'number_n',
                'guarante',
                'nbmois',
                'quotation.product_type',
                'periode.periode',
                'assurance_auto_infos.releasedate',
                'firstname',
                'lastname',
                'quotation.created_at',
                'quotation.company_id',
                'quotation.is_payed', // Inclure la colonne is_payed
                'quotation.inbox_amount', // Inclure inbox_amount
            )
            ->where('product_type', '=', 2) // Moto
            ->where('made_quote.account_id', '=', Auth::guard('space_perso')->user()->id)
            ->where('quotation.status', '<', 5)
            ->orderBy('quotation.id', 'desc')
            ->get();

        $contrats_voyage = DB::table('quotation')
            ->join('users', 'users.id', 'quotation.user_id')
            ->join('made_quote', 'made_quote.quote_id', 'quotation.id')
            ->join('assurance_voyage_infos', 'assurance_voyage_infos.id', 'quotation.assurance_infos_id')
            ->join('auto_company', 'auto_company.id', 'quotation.company_id')
            ->select(
                'quotation.*',
                'assurance_voyage_infos.*',
                'quotation.id as qid',
                'quotation.product_type',
                'assurance_infos_id',
                'firstname',
                'lastname',
                'contact',
                'email',
                'compname',
                'complogo',
                'quotation.is_payed', // Inclure la colonne is_payed
                'quotation.inbox_amount', // Inclure inbox_amount
            )
            ->where([['quotation.status', '=', 5], ['product_type', '=', 3], ['made_quote.account_id', '=', Auth::guard('space_perso')->user()->id]])
            ->orderBy('quotation.id', 'desc')
            ->get();

        $devis_voyage = DB::table('quotation')
            ->join('users', 'users.id', 'quotation.user_id')
            ->join('made_quote', 'made_quote.quote_id', 'quotation.id')
            ->join('assurance_voyage_infos', 'assurance_voyage_infos.id', 'quotation.assurance_infos_id')
            ->select(
                'quotation.*',
                'assurance_voyage_infos.*',
                'quotation.id as qid',
                'quotation.product_type',
                'assurance_infos_id',
                'firstname',
                'lastname',
                'contact',
                'email',
                'quotation.is_payed', // Inclure la colonne is_payed
                'quotation.inbox_amount', // Inclure inbox_amount
            )
            ->where('quotation.status', '<', 5)
            ->where('product_type', '=', 3)
            ->where('made_quote.account_id', '=', Auth::guard('space_perso')->user()->id)
            ->orderBy('quotation.id', 'desc')
            ->get();

        $periodes = DB::table('periode')->get();

        return view('app.frontend.myspace')->with([
            'contrats_auto' => $contrats_auto,
            'devis_auto' => $devis_auto,
            'contrats_moto' => $contrats_moto,
            'devis_moto' => $devis_moto,
            'contrats_voyage' => $contrats_voyage,
            'devis_voyage' => $devis_voyage,
            'active' => 'myspace',
            'periodes' => $periodes,
        ]);
    }

    public function UpdateProfile(Request $request)
    {
        EspacePersoAccount::where("id", Auth::guard('space_perso')->user()->id)->update([
            "name"=>$request->name
        ]);
        Session::flash("success","Votre profile a correctement été mis à jour!");
        return redirect()->back();
    }

    public function updateAccountPassword(Request $request)
    {
        $current_password = Auth::guard('space_perso')->user()->password;
        if(Hash::check($request->currentpassword, $current_password)){
            if($request->newpassword == $request->newpasswordrepeat){
                $user_id = Auth::guard('space_perso')->user()->id;
                $obj_user = EspacePersoAccount::find($user_id);
                $obj_user->password = Hash::make($request->newpassword);
                $obj_user->save();
                Session::flash("success","Votre mot de passe a correctement été mis à jour!");
            }else{
                Session::flash("error","Les deux mots de passe saisis ne correstpondent pas.");
            }
        }else{
            Session::flash("error","Votre mot de passe est incorrect!");
        }
        return redirect()->back();
    }

    public function renewContract(Request $request)
    {
        $old_q = Quotation::where('id',$request->id_cont)->first();
        $old_assur_info = AssuranceAutoInfos::where('id',$old_q->assurance_infos_id)->first();

        $assuranceAutoInfos =  new AssuranceAutoInfos();
        $assuranceAutoInfos->guarante =  $old_assur_info->guarante;
        $assuranceAutoInfos->releasedate = Carbon::createFromFormat("d/m/Y", $request->get('newreleasedate'))->toDateString();
        $assuranceAutoInfos->periode = $request->get('periode');
        $assuranceAutoInfos->reduction_commerciale =0;
        $assuranceAutoInfos->save();

        $quotation = new Quotation();
        $quotation->product_id= $old_q->product_id;
        $quotation->assurance_infos_id = $assuranceAutoInfos->id;
        $quotation->user_id = $old_q->user_id;
        $quotation->status =0;
        $quotation->product_type=$old_q->product_type;
        $quotation->number_n = Quotation::get_unique_number();
        $quotation->company_id = $old_q->company_id;
        $quotation->service_opt = $old_q->service_opt;
        $quotation->delivery_location = $old_q->delivery_location;
        $quotation->phone_client = $old_q->phone_client;
        $quotation->renew_order = 1;
        $quotation->save();

        $this->saveOrderStatusActor($quotation);
        $this->storeWhoMadeQuote($quotation->id, Auth::guard('space_perso')->user()->id);

        return Redirect::route('details.quote.auto', ['id_quote' => $quotation->id,'id_comp'=>$quotation->company_id]);
    }

    private function saveOrderStatusActor($quotation)
    {
        DB::table('order_status_actor')->insert([
            'order_id'=>$quotation->id,
            'order_status'=>$quotation->status,
            'actor_id'=>$quotation->user_id,
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()
        ]);
    }

}
