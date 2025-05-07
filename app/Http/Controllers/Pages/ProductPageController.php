<?php

namespace App\Http\Controllers\Pages;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Hash;
use PDF;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Models\Make;
use App\Models\AutoCategories;
use App\Models\City;
use App\Models\Job;
use App\Models\Periode;
use App\Models\AutoGuarantee;
use App\Models\AutoInfos;
use App\Models\AutoCompany;
use App\Models\OptionnalService;
use App\Models\User;
use App\Models\Role;
use App\Models\Permission;
use App\Models\AssuranceAutoInfos;
use App\Models\AssuranceVoyageInfos;
use App\Models\Quotation;
use App\Mail\AccountDetailsMail;
use App\Models\EspacePersoAccount;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;
use Entrust;

class ProductPageController extends Controller
{
    public function showAutoPage()
    {
        return view('app.frontend.page-automobile')->with(['active'=>'auto']);
    }

    public function showMotoPage()
    {
        return view('app.frontend.page-moto')->with(['active'=>'moto']);
    }

    public function showVoyagePage()
    {
        return view('app.frontend.page-voyage')->with(['active'=>'voyage']);
    }

    public function showHabitationPage()
    {
        return view('app.frontend.page-habitation')->with(['active'=>'habitation']);
    }

    public function showAutoQuotationPage()
    {
        $categories = DB::table('auto_categories')->where('enabled',1)->get();
        $companies = DB::table('auto_company')->where('enabled',1)->get();
        $makes = DB::table('make')
            ->where('isMoto',0)
            ->get();
        $zones = DB::table('city')->get();
        $car_types = DB::table('car_type')->where('car_type_status',1)->get();
        $guarantee = DB::table('auto_guarantee')->where('isdeprecated',0)->get();
        $periode = DB::table('periode')->get();
        $optional_service = DB::table('optional_service')->where(['product_type'=>1])->get();

        return view('app.frontend.page-quotation-automobile')->with([
            'active'=>'auto',
            'user_car'=>null,
            'categories'=>$categories,
            'makes'=> $makes,
            'zones'=> $zones,
            'car_types'=> $car_types,
            'guarantee'=> $guarantee,
            'periode'=> $periode,
            'companies'=>$companies,
            'optional_service'=> $optional_service
        ]);
    }

    public function showMotoQuotationPage()
    {
        $categories = DB::table('auto_categories')->where('enabled',1)->get();
        $companies = DB::table('auto_company')->where('enabled',1)->get();
        $makes = DB::table('make')
            ->join('model','make.id','=','model.make_id')
            ->select('make.*','model.id as modid','model.title as modtitle')
            ->get();
        $zones = DB::table('city')->get();
        $car_types = DB::table('car_type')->where('car_type_status',0)->get();
        $guarantee = DB::table('auto_guarantee')->where('isdeprecated',0)->get();
        $periode = DB::table('periode')->get();
        $optional_service = DB::table('optional_service')->where(['product_type'=>1])->get();



        return view('app.frontend.page-quotation-moto')->with([
            'active'=>'moto',
            'user_car'=>null,
            'categories'=>$categories,
            'makes'=> $makes,
            'zones'=> $zones,
            'car_types'=> $car_types,
            'guarantee'=> $guarantee,
            'periode'=> $periode,
            'companies'=>$companies,
            'optional_service'=> $optional_service
        ]);
    }

    public function showVoyageQuotationPage()
    {
        $companies = DB::table('auto_company')->where(['has_travel'=>1])->get();
        $pays = DB::table('pays')->get();
        $optional_service = DB::table('optional_service')->where(['product_type'=>3])->get();



        return view('app.frontend.page-quotation-voyage')->with([
            'active'=>'voyage',
            'pays'=> $pays,
            'companies'=>$companies,
            'optional_service'=> $optional_service
        ]);
    }

    public function showQuoteDetails($quote_id,$comp_id)
    {
        $prospect = DB::select('SELECT
            number_n,
            policy_number,
            firstname,
            lastname,
            email,
            contact,
            usertype,
            product_type,
            matriculation,
            power,
            energy,
            firstrelease,
            placesnumber,
            parkingzone,
            vneuve,
            vvenale,
            city,
            charge_utile,
            color,
            reduction_commerciale,
            assurance_auto_infos.releasedate as assurance_release_date,
            assurance_auto_infos.id as assurance_auto_info_id,
            periode.periode,
            periode.nbmois,
            periode.id as pid,
            subscription_type,
            city.id as cid,
            quotation.status,
            quotation.collect_data,
            quotation.company_id as id_comp,
            quotation.id as qid,
            quotation.created_at as created_at,
            make.id as makid,
            quotation.id as qid,
            auto_categories.id as autid,
            make.title,
            auto_categories.categorie,
            auto_categories.shortdesc,
            auto_infos.id as auto_info_id,
            users.id as uid,
            guarante,
            job.id as jid,
            jobtitle,
            discount as job_discount,
            date_pc,
            city.zone,
            proprio_veh,
            company_name
            from
            quotation,
            assurance_auto_infos,
            auto_infos,
            users,
            make,
            auto_categories,
            city,
            periode,
            job
        where users.id=user_id and auto_infos.id=product_id and quotation.id="'.$quote_id.'" and  assurance_auto_infos.id=assurance_infos_id and make.id=auto_infos.make_id and auto_categories.id=auto_infos.category and city.id=auto_infos.parkingzone and periode.id=assurance_auto_infos.periode');

        if(sizeof($prospect)>0){
            $prospect = $prospect[0];

            if($prospect->collect_data==null){
                $quotations = json_decode(app('App\Http\Controllers\Quotation\AutoQuotationController')->caculAutoQuotationFromDb($prospect->auto_info_id, $prospect->uid, $prospect->assurance_auto_info_id));
                DB::table("quotation")->where("id",$quote_id)->update([
                    "collect_data"=> app('App\Http\Controllers\Quotation\AutoQuotationController')->caculAutoQuotationFromDb($prospect->auto_info_id, $prospect->uid, $prospect->assurance_auto_info_id)
                ]);
            }
            else{
                $quotations = json_decode($prospect->collect_data);
            }

            if($quotations){
            foreach ($quotations as $q) {
                if($q->idcomp==$comp_id){
                $data = $q;
                }
            }
            }


            $company_quotation = DB::table('auto_companyquotation')->where(['companyid'=>$data->idcomp,'type_assurance'=>1])->orderBy('id','desc')->first();
            if($company_quotation)
            $comp_gar = json_decode($company_quotation->formules, true);
            else
            return redirect()->back();

            $garantees = DB::table('auto_guarantee')->get();



            return view('app.frontend.details-auto-quote', compact('data','prospect','garantees','comp_gar'))->with('active','auto');
        }
    }

    public function showDevisAllResult($quote_id)
    {
        $prospect = DB::select('SELECT
        number_n,
        policy_number,
        firstname,
        lastname,
        email,
        contact,
        usertype,
        product_type,
        matriculation,
        power,
        energy,
        firstrelease,
        placesnumber,
        parkingzone,
        vneuve,
        vvenale,
        city,
        charge_utile,
        color,
        reduction_commerciale,
        assurance_auto_infos.releasedate as assurance_release_date,
        assurance_auto_infos.id as assurance_auto_info_id,
        periode.periode,
        periode.nbmois,
        periode.id as pid,
        subscription_type,
        city.id as cid,
        quotation.status,
        quotation.collect_data,
        quotation.company_id as id_comp,
        quotation.id as qid,
        quotation.created_at as created_at,
        make.id as makid,
        quotation.id as qid,
        auto_categories.id as autid,
        make.title,
        auto_categories.categorie,
        auto_categories.shortdesc,
        auto_infos.id as auto_info_id,
        users.id as uid,
        guarante,
        job.id as jid,
        jobtitle,
        discount as job_discount,
        date_pc,
        city.zone,
        proprio_veh,
        company_name
        from
        quotation,
        assurance_auto_infos,
        auto_infos,
        users,
        make,
        auto_categories,
        city,
        periode,
        job
        where users.id=user_id and auto_infos.id=product_id and quotation.id="'.$quote_id.'" and  assurance_auto_infos.id=assurance_infos_id and   make.id=auto_infos.make_id and auto_categories.id=auto_infos.category and city.id=auto_infos.parkingzone and periode.id=assurance_auto_infos.periode');

        if(sizeof($prospect)>0){
            $prospect = $prospect[0];

            if($prospect->collect_data==null){
                $quotations = json_decode(app('App\Http\Controllers\Quotation\AutoQuotationController')->caculAutoQuotationFromDb($prospect->auto_info_id, $prospect->uid, $prospect->assurance_auto_info_id));
                DB::table("quotation")->where("id",$quote_id)->update([
                    "collect_data"=> app('App\Http\Controllers\Quotation\AutoQuotationController')->caculAutoQuotationFromDb($prospect->auto_info_id, $prospect->uid, $prospect->assurance_auto_info_id)
                ]);
            }
            else{
                $quotations = json_decode($prospect->collect_data);
            }

        }
        else{
            return redirect()->back();
        }
        $periodes = Periode::all();
        return view('app.frontend.all-auto-quote', compact("prospect","quotations","periodes"))->with('active','auto');
    }

    public function updateAutoFormule(Request $req)
    {
        Session::flash('success','Assurance modifiée avec succès');
        return redirect()->back();
    }

    public function showTravelQuoteDetails($quote_id, $comp_id)
    {
        $prospect = DB::table("quotation")
            ->join("users", "users.id", "quotation.user_id")
            ->join("assurance_voyage_infos", "assurance_voyage_infos.id", "quotation.assurance_infos_id")
            ->join("pays", "pays.pays_id", "assurance_voyage_infos.destination_country")
            ->select(
                "users.*",
                "quotation.id as quote_id",
                "quotation.assurance_infos_id",
                "quotation.number_n",
                "quotation.user_id",
                "quotation.product_type",
                "quotation.company_id",
                "quotation.created_at as date_devis",
                "quotation.status as status_devis",
                "collect_data",
                "assurance_voyage_infos.id as assur_voy_id",
                "destination_country",
                "current_addr",
                "destination_addr",
                "departure_date",
                "arrival_date",
                "nationality_id",
                "passport_num",
                "date_expire_passport",
                "pays.pays_name",
                "pays.pays_code",
                "pays.pays_zone"
            )
            ->where("quotation.id", $quote_id)
            ->first();

        if (!$prospect) {
            Session::flash('error', "Prospect introuvable pour le devis.");
        }

        $quotations = $prospect->collect_data ? json_decode($prospect->collect_data) : [];

        Log::info('Données collectées :', ['quotations' => $quotations, 'comp_id' => $comp_id]);

        $data = null;
        if ($quotations) {
            foreach ($quotations as $q) {
                if (isset($q->idcomp) && (int) $q->idcomp === (int) $comp_id) {
                    $data = $q;
                    break;
                }
            }
        }
        Log::debug('Contenu complet quotations', ['quotations' => $quotations]);

        if (!$data) {
            Log::error("Aucune correspondance trouvée pour comp_id : $comp_id");
            Session::flash('error', "Devis introuvable pour cette compagnie.");
        }

        $company_quotation = DB::table('auto_companyquotation')
            ->where(['companyid' => $data->idcomp, 'type_assurance' => 3])
            ->orderBy('id', 'desc')
            ->first();

        if (!$company_quotation) {
            Session::flash('error', "Informations sur la compagnie introuvables.");
        }

        $comp_gar = json_decode($company_quotation->formules, true);

        return view('app.frontend.details-voyage-quote', compact('data', 'prospect', 'comp_gar'))
            ->with('active', 'voyage');
    }
    public function traitVoyageQuotation(Request $request)
    {
        $user = $this->saveUserIfNotExist2($request);
        $name = Session::get('_name_sousc');
        $phone = Session::get('_phone_sousc');
        $assurance_infos = $this->saveInfoVoyageInsurance($request);
        $service = ($request->get('opt_serv') != null) ? $this->format_service($request->get('opt_serv')) : "[]";

        $quotation = $this->saveProductQuotation(
            0,
            $assurance_infos->id,
            $user->id,
            3,
            $request->pref_comp,
            $service
        );

        $this->saveOrderStatusActor($quotation);
        $space_account_id = $this->saveSpacePersoAccountInfo($name, $phone);
        $this->storeWhoMadeQuote($quotation->id, $space_account_id);

        return $this->VoyageQuoteDetail($quotation->id, $assurance_infos->id);
    }


    public function loadDevisPDF($comp_id,$quote_id)
    {
        $prospect = DB::select('SELECT
        number_n,
        policy_number,
        firstname,
        lastname,
        email,
        contact,
        usertype,
        product_type,
        matriculation,
        power,
        energy,
        firstrelease,
        placesnumber,
        parkingzone,
        vneuve,
        vvenale,
        city,
        charge_utile,
        color,
        reduction_commerciale,
        assurance_auto_infos.releasedate as assurance_release_date,
        assurance_auto_infos.id as assurance_auto_info_id,
        periode.periode,
        periode.nbmois,
        periode.id as pid,
        subscription_type,
        city.id as cid,
        quotation.status,
        quotation.collect_data,
        quotation.company_id as id_comp,
        quotation.id as qid,
        quotation.created_at as created_at,
        make.id as makid,
        quotation.id as qid,
        auto_categories.id as autid,
        make.title,
        auto_categories.categorie,
        auto_categories.shortdesc,
        auto_infos.id as auto_info_id,
        users.id as uid,
        guarante,
        job.id as jid,
        jobtitle,
        discount as job_discount,

        date_pc,
        city.zone,
        proprio_veh,
        company_name
        from
        quotation,
        assurance_auto_infos,
        auto_infos,
        users,
        make,
        auto_categories,
        city,
        periode,
        job
        where users.id=user_id and auto_infos.id=product_id and quotation.id="'.$quote_id.'" and  assurance_auto_infos.id=assurance_infos_id and   make.id=auto_infos.make_id and auto_categories.id=auto_infos.category and city.id=auto_infos.parkingzone and periode.id=assurance_auto_infos.periode');

        if(sizeof($prospect)>0){
        $prospect = $prospect[0];

        if($prospect->collect_data==null){
                $quotations = json_decode(app('App\Http\Controllers\Quotation\AutoQuotationController')->caculAutoQuotationFromDb($prospect->auto_info_id, $prospect->uid, $prospect->assurance_auto_info_id));
                DB::table("quotation")->where("id",$quote_id)->update([
                    "collect_data"=> app('App\Http\Controllers\Quotation\AutoQuotationController')->caculAutoQuotationFromDb($prospect->auto_info_id, $prospect->uid, $prospect->assurance_auto_info_id)
                ]);
            }
            else{
                $quotations = json_decode($prospect->collect_data);
            }

        if($quotations){
            foreach ($quotations as $q) {
            if($q->idcomp==$comp_id){
                $data = $q;
            }
            }
        }

        $company_quotation = DB::table('auto_companyquotation')->where(['companyid'=>$data->idcomp,'type_assurance'=>1])->orderBy('id','desc')->first();
        if($company_quotation)
            $comp_gar = json_decode($company_quotation->formules, true);
        else
            return redirect()->back();

        $garantees = DB::table('auto_guarantee')->get();


        $pdf1 = PDF::loadView('app.pdf.auto.invoice', compact('data','prospect','garantees','comp_gar'));

        return $pdf1->stream();
        }

        else{
        Session::flash('error','Oups! Une erreur s\'est produite');
        return redirect()->back();
        }
    }

    public function loadContratPDF($comp_id,$quote_id)
    {
        $prospect = DB::select('SELECT
        number_n,
        policy_number,
        firstname,
        lastname,
        email,
        contact,
        usertype,
        product_type,
        matriculation,
        power,
        energy,
        firstrelease,
        placesnumber,
        parkingzone,
        vneuve,
        vvenale,
        city,
        charge_utile,
        color,
        reduction_commerciale,
        assurance_auto_infos.releasedate as assurance_release_date,
        assurance_auto_infos.id as assurance_auto_info_id,
        periode.periode,
        periode.nbmois,
        periode.id as pid,
        subscription_type,
        city.id as cid,
        quotation.status,
        quotation.collect_data,
        quotation.company_id as id_comp,
        quotation.id as qid,
        quotation.created_at as created_at,
        make.id as makid,
        quotation.id as qid,
        auto_categories.id as autid,
        make.title,
        auto_categories.categorie,
        auto_categories.shortdesc,
        auto_infos.id as auto_info_id,
        users.id as uid,
        guarante,
        job.id as jid,
        jobtitle,
        discount as job_discount,
        date_pc,
        city.zone,
        proprio_veh,
        company_name
        from
        quotation,
        assurance_auto_infos,
        auto_infos,
        users,
        make,
        auto_categories,
        city,
        periode,
        job
        where users.id=user_id and auto_infos.id=product_id and quotation.id="'.$quote_id.'" and  assurance_auto_infos.id=assurance_infos_id and   make.id=auto_infos.make_id and auto_categories.id=auto_infos.category and city.id=auto_infos.parkingzone and periode.id=assurance_auto_infos.periode');

        if(sizeof($prospect)>0){
        $prospect = $prospect[0];

        if($prospect->collect_data==null){
            $quotations = json_decode(app('App\Http\Controllers\Quotation\AutoQuotationController')->caculAutoQuotationFromDb($prospect->auto_info_id, $prospect->uid, $prospect->assurance_auto_info_id));
            DB::table("quotation")->where("id",$quote_id)->update([
                "collect_data"=> app('App\Http\Controllers\Quotation\AutoQuotationController')->caculAutoQuotationFromDb($prospect->auto_info_id, $prospect->uid, $prospect->assurance_auto_info_id)
            ]);
        }
        else{
            $quotations = json_decode($prospect->collect_data);
        }

        if($quotations){
            foreach ($quotations as $q) {
            if($q->idcomp==$comp_id){
                $data = $q;
            }
            }
        }

        $company_quotation = DB::table('auto_companyquotation')->where(['companyid'=>$data->idcomp,'type_assurance'=>1])->orderBy('id','desc')->first();
        if($company_quotation)
            $comp_gar = json_decode($company_quotation->formules, true);
        else
            return redirect()->back();

        $garantees = DB::table('auto_guarantee')->get();


        $pdf1 = PDF::loadView('app.pdf.auto.contrat-service', compact('data','prospect','garantees','comp_gar'));
        $pdf1->output();
        $dom_pdf = $pdf1->getDomPDF();

        $canvas = $dom_pdf ->get_canvas();

        $canvas->page_text($canvas->get_width()-45, $canvas->get_height()-35, "{PAGE_NUM}/{PAGE_COUNT}", null, 10, array(0, 0, 0));
        return $pdf1->stream();
        }

        else{
        Session::flash('error','Oups! Une erreur s\'est produite');
        return redirect()->back();
        }
    }

    public function loadDevisVoyagePDF($comp_id,$quote_id)
    {
        $prospect =  DB::table("quotation")
                ->join("users","users.id","quotation.user_id")
                ->join("assurance_voyage_infos","assurance_voyage_infos.id","quotation.assurance_infos_id")
                ->join("pays","pays.pays_id","assurance_voyage_infos.destination_country")
                ->select("users.*","quotation.id as quote_id","quotation.assurance_infos_id","quotation.number_n","quotation.user_id","quotation.product_type","quotation.company_id","quotation.created_at as date_devis","collect_data", "quotation.status as status_devis","assurance_voyage_infos.id as assur_voy_id","destination_country","current_addr","destination_addr","departure_date","arrival_date","nationality_id","passport_num","date_expire_passport","pays.pays_name","pays.pays_code","pays.pays_zone")
                ->where("quotation.id",$quote_id)->get();

        if(sizeof($prospect)>0){

        $prospect = $prospect[0];

        if($prospect->collect_data==null){
                $quotations = json_decode(app('App\Http\Controllers\Quotation\VoyageQuotationController')->caculVoyageQuotationFromDb($prospect));
                DB::table("quotation")->where("id",$quote_id)->update([
                    "collect_data"=> app('App\Http\Controllers\Quotation\VoyageQuotationController')->caculVoyageQuotationFromDb($prospect)
                ]);
            }
            else{
                $quotations = json_decode($prospect->collect_data);
            }

        if($quotations){
            foreach ($quotations as $q) {
            if($q->idcomp==$comp_id){
                $data = $q;
            }
            }
        }

        $company_quotation = DB::table('auto_companyquotation')->where(['companyid'=>$data->idcomp,'type_assurance'=>3])->orderBy('id','desc')->first();
        if($company_quotation)
            $comp_gar = json_decode($company_quotation->formules, true);
        else
            return redirect()->back();

        $pdf1 = PDF::loadView('app.pdf.voyage.invoice', compact('data','prospect','comp_gar'));

        return $pdf1->stream();
        }

        else{
        Session::flash('error','Oups! Une erreur s\'est produite');
        return redirect()->back();
        }
    }

    public function traitAutoQuotation(Request $request)
    {
        $auto = $this->saveCarIfNotExist2($request);

        $user = $this->saveUserIfNotExist2($request);

        $name = Session::get('_name_sousc');
        $phone = Session::get('_phone_sousc');

        $type = $request->get('souscription');
        $my_guaranties = $request->get('guarantee');
        $formule = $request->get('formule');
        $pref_comp = 0;
        $garantie= $this->format_garantie($type,$my_guaranties,$formule);
        $service= $this->format_service($request->get('opt_serv'));
        $priseeffet = Carbon::createFromFormat("d/m/Y", $request->get('priseeffet'))->toDateString();

        $assurance_infos = $this->saveInfoAutoInsurance($garantie, $priseeffet, $request->get('periode'), $request->get('souscription'));

        $quotation = $this->saveProductQuotation($auto->id,$assurance_infos->id,$user->id,1,$pref_comp,$service);

        $this->saveOrderStatusActor($quotation);
        $space_account_id = $this->saveSpacePersoAccountInfo($name,$phone);
        $this->storeWhoMadeQuote($quotation->id,$space_account_id);

        return $this->AutoQuoteDetail($quotation->id,$assurance_infos->id);
    }

    public function traitMotoQuotation(Request $request)
    {
        try {
            // Sauvegarde ou récupération des informations de la moto
            $moto = $this->saveMotoIfNotExist2($request);
            if (!$moto) {
                throw new \Exception('Erreur lors de l\'enregistrement de la moto.');
            }

            // Sauvegarde ou récupération des informations utilisateur
            $user = $this->saveUserIfNotExist2($request);
            if (!$user) {
                throw new \Exception('Erreur lors de l\'enregistrement de l\'utilisateur.');
            }

            // Récupération des informations de la session
            $name = Session::get('_name_sousc');
            $phone = Session::get('_phone_sousc');

            if (!$name || !$phone) {
                throw new \Exception('Nom ou téléphone introuvable dans la session.');
            }

            // Formatage des garanties
            $type = $request->get('souscription');
            $my_guaranties = $request->get('guarantee', []);
            $formule = $request->get('formule');
            $garantie = $this->format_garantie($type, $my_guaranties, $formule);

            // Formatage des services optionnels
            $services = $request->get('opt_serv', []);
            $service = $this->format_service($services);

            // Formatage de la date de prise d'effet
            $priseeffet = Carbon::createFromFormat("d/m/Y", $request->get('priseeffet'))->toDateString();

            // Sauvegarde des informations d'assurance
            $assuranceInfos = $this->saveInfoAutoInsurance($garantie, $priseeffet, $request->get('periode'), $type);
            if (!$assuranceInfos) {
                throw new \Exception('Erreur lors de l\'enregistrement des informations d\'assurance.');
            }

            // Création du devis
            $quotation = $this->saveProductQuotation($moto->id, $assuranceInfos->id, $user->id, 2, $request->get('pref_comp'), $service);
            if (!$quotation) {
                throw new \Exception('Erreur lors de la création du devis.');
            }

            // Sauvegarde du statut de la commande
            $this->saveOrderStatusActor($quotation);

            // Gestion du compte personnel
            $spaceAccountId = $this->saveSpacePersoAccountInfo($name, $phone);
            if (!$spaceAccountId) {
                throw new \Exception('Erreur lors de l\'enregistrement du compte personnel.');
            }

            // Sauvegarde de la création du devis
            $this->storeWhoMadeQuote($quotation->id, $spaceAccountId);

            // Retour des détails du devis
            return $this->AutoQuoteDetail($quotation->id, $assuranceInfos->id);

        } catch (\Exception $e) {
            Log::error('Erreur lors du traitement du devis moto : ' . $e->getMessage());
            return response()->json(['error' => 'Une erreur est survenue lors du traitement du devis.'], 500);
        }
    }


    public function AutoQuoteDetail($id,$aid)
    {
        $prospect = DB::select('SELECT
        number_n,
        firstname,
        lastname,
        email,
        contact,
        usertype,
        date_pc,
        proprio_veh,
        company_name,
        product_type,
        matriculation,
        power,
        energy,
        charge_utile,
        color,
        firstrelease,
        placesnumber,
        parkingzone,
        vneuve,
        vvenale,
        city,
        city.zone,
        reduction_commerciale,
        job.id as jid,
        jobtitle,
        discount as job_discount,
        assurance_auto_infos.releasedate as assurance_release_date,
        assurance_auto_infos.id as assurance_auto_info_id,
        periode.periode,
        periode.nbmois,
        periode.id as pid,
        subscription_type,
        city.id as cid,
        quotation.status,
        quotation.collect_data,
        quotation.company_id as id_comp,
        quotation.id as qid,
        quotation.created_at as created_at,
        make.id as makid,
        quotation.id as qid,
        quotation.delivery_location,
        quotation.phone_client,
        auto_categories.id as autid,
        make.title,
        auto_categories.categorie,
        auto_infos.id as auto_info_id,
        users.id as uid,
        guarante
        from
        quotation,
        assurance_auto_infos,
        auto_infos,
        users,
        make,
        auto_categories,
        city,
        periode,
        job
        where users.id=user_id and auto_infos.id=product_id and quotation.id="'.$id.'" and  assurance_auto_infos.id=assurance_infos_id and   make.id=auto_infos.make_id and auto_categories.id=auto_infos.category and city.id=auto_infos.parkingzone and periode.id=assurance_auto_infos.periode')[0];

        Session::put('_userid_', $prospect->uid);
        Session::put('_firstname_', $prospect->firstname);
        Session::put('_lastname_', $prospect->lastname);
        Session::put('_email_', $prospect->email);
        Session::put('_contact_', $prospect->contact);
        Session::put('_quoteNumber_', $prospect->number_n);

        $makes = DB::table('make')
        ->join('model','make.id','=','model.make_id')
        ->select('make.*','model.id as modid','model.title as modtitle')
        ->get();
        $categories = AutoCategories::where('enabled', 1)->get();
        $zones = City::all();
        $periodes = Periode::all();
        $guarantees = AutoGuarantee::all();
        $guaranty = AssuranceAutoInfos::find($aid);
        if($guaranty && $prospect){
        $guarantees_array = $this->garantie_to_array($guaranty->guarante);
        }
        else{
        Session::flash('error','Une erreur s\'est produit');
        return redirect()->route('page.auto')->with(['isActive'=>'auto']);
        }
        if($prospect->collect_data==null){
            $quotations = json_decode(app('App\Http\Controllers\Quotation\AutoQuotationController')->caculAutoQuotationFromDb($prospect->auto_info_id, $prospect->uid, $prospect->assurance_auto_info_id));
            DB::table("quotation")->where("id",$id)->update([
                "collect_data"=> app('App\Http\Controllers\Quotation\AutoQuotationController')->caculAutoQuotationFromDb($prospect->auto_info_id, $prospect->uid, $prospect->assurance_auto_info_id)
            ]);
        }
        else{
            $quotations = json_decode($prospect->collect_data);
        }
        $optional_service = DB::table('optional_service')->where(['product_type'=>1])->get();
        $selected_serv = collect($quotations[0]->servopt);
        return json_encode($quotations);
    }

    public function VoyageQuoteDetail($id)
    {
        $prospect =  DB::table("quotation")
                    ->join("users","users.id","quotation.user_id")
                    ->join("assurance_voyage_infos","assurance_voyage_infos.id","quotation.assurance_infos_id")
                    ->join("pays","pays.pays_id","assurance_voyage_infos.destination_country")
                    ->select("users.*","quotation.id as quote_id","quotation.assurance_infos_id","quotation.number_n","quotation.user_id","quotation.product_type","quotation.company_id","assurance_voyage_infos.id as assur_voy_id","destination_country","current_addr","destination_addr","collect_data","departure_date","arrival_date","pays.pays_name","pays.pays_code","pays.pays_zone")
                    ->where("quotation.id",$id)->first();

        Session::put('_userid_', $prospect->user_id);
        Session::put('_firstname_', $prospect->firstname);
        Session::put('_lastname_', $prospect->lastname);
        Session::put('_email_', $prospect->email);
        Session::put('_contact_', $prospect->contact);
        Session::put('_quoteNumber_', $prospect->number_n);
        if($prospect->collect_data==null){
            $quotations = json_decode(app('App\Http\Controllers\Quotation\VoyageQuotationController')->caculVoyageQuotationFromDb($prospect));
            DB::table("quotation")->where("id",$id)->update([
                "collect_data"=> app('App\Http\Controllers\Quotation\VoyageQuotationController')->caculVoyageQuotationFromDb($prospect)
            ]);
        }
        else{
            $quotations = json_decode($prospect->collect_data);
        }


        $qu_sorted = collect($quotations)->sortBy("PRIME");

        return json_encode($qu_sorted->values()->all());

    }

    private function storeWhoMadeQuote($quote_id,$space_account_id)
    {
        DB::table("made_quote")->insert([
            "quote_id"=>$quote_id,
            "account_id"=>$space_account_id,
            "created_at"=>Carbon::now(),
            "updated_at"=>Carbon::now()
        ]);
    }

    public function ConfirmAutoQuotation(Request $request)
    {
        $qid = $request->get('qid'); // ID du devis
        $comp_id = $request->get('comp_id'); // ID de la compagnie sélectionnée
        $delivery_phone = $request->get('delivery_phone');
        $delivery_location = $request->get('delivery_location');

        // Calculer et mettre à jour le montant
        $this->calculateAndUpdateQuotationAmount($qid, $comp_id, $delivery_phone, $delivery_location);

        // Ne pas toucher aux parties e-mail et connexion automatique
        $phone = $delivery_phone;
        $password = "12345678";

        $user = DB::table('users')
            ->join('quotation', 'users.id', '=', 'quotation.user_id')
            ->where('quotation.id', $qid)
            ->select('users.email')
            ->first();

        if ($user) {
            $email = $user->email;
        } else {
            throw new \Exception("Utilisateur non trouvé pour ce devis.");
        }

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            Log::error('Adresse email invalide. Veuillez corriger votre saisie.');
        }

        $user_phone = str_replace(' ', '', $delivery_phone);
        $user_contact = EspacePersoAccount::where('phone_number', $user_phone)->first();

        if (!$user_contact) {
            throw new \Exception("Utilisateur introuvable pour le numéro de téléphone : $user_phone.");
        }

        Auth::guard('space_perso')->login($user_contact);

        $this->sendAccountDetailsEmail($phone, $password, $email);

        return json_encode($qid);
    }
    protected function sendAccountDetailsEmail($phone, $password, $email)
    {
        $details = [
            'phone' => $phone,
            'password' => $password,
        ];

        Mail::send('emails.account_details', $details, function ($message) use ($email) {
            $message->to($email)
                ->subject('Vos identifiants de connexion à MonAssurance');
        });
    }

    private function calculateAndUpdateQuotationAmount($qid, $comp_id, $delivery_phone, $delivery_location)
    {
        // Récupérer les données de devis
        $prospect = DB::select('SELECT quotation.collect_data, quotation.product_type, assurance_auto_infos.reduction_commerciale
                                FROM quotation
                                LEFT JOIN assurance_auto_infos ON assurance_auto_infos.id = quotation.assurance_infos_id
                                WHERE quotation.id = ?', [$qid]);

        if (!$prospect) {
            throw new \Exception("Devis introuvable.");
        }

        $prospect = $prospect[0];

        // Décoder collect_data
        $allQuotes = json_decode($prospect->collect_data, false);
        if (!$allQuotes || !is_array($allQuotes)) {
            throw new \Exception("Les données de devis sont invalides ou absentes.");
        }

        // Trouver le devis correspondant à la compagnie sélectionnée
        $selectedQuote = null;
        foreach ($allQuotes as $quote) {
            if ($quote->idcomp == $comp_id) {
                $selectedQuote = $quote;
                break;
            }
        }

        if (!$selectedQuote) {
            throw new \Exception("Aucun devis trouvé pour la compagnie sélectionnée.");
        }

        $totalAmount = 0;

        // Calculer le montant selon le type de produit
        if ($prospect->product_type == 3) { // Voyage
            if (!isset($selectedQuote->PRIME) || !isset($selectedQuote->FG)) {
                $selectedQuote->PRIME = $selectedQuote->PRIME ?? 0;
                $selectedQuote->FG = $selectedQuote->FG ?? 2000; // Valeur par défaut réaliste

                throw new \Exception("Les données du devis voyage sont incomplètes.");
            }
            $totalAmount = $selectedQuote->PRIME + $selectedQuote->FG;

        } elseif (in_array($prospect->product_type, [1, 2])) { // Auto ou Moto
            if (!isset($selectedQuote->som_serv) || !isset($selectedQuote->TTC)) {
                throw new \Exception("Les données du devis auto/moto sont incomplètes.");
            }
            $totalAmount = $selectedQuote->som_serv + $selectedQuote->TTC - $prospect->reduction_commerciale;
        } else {
            throw new \Exception("Type de produit non reconnu.");
        }

        // Mettre à jour le devis
        Quotation::where('id', $qid)->update([
            'status' => 1,
            'company_id' => $comp_id,
            'phone_client' => $delivery_phone,
            'delivery_location' => $delivery_location,
            'inbox_amount' => $totalAmount,
        ]);

        return $totalAmount; // Optionnel, pour un éventuel usage ultérieur
    }

    private function saveSpacePersoAccountInfo($souscr_name, $souscr_phone)
    {
        try {
            // Nettoyer le numéro de téléphone pour éviter les espaces ou caractères spéciaux
            $souscr_phone = str_replace(' ', '', $souscr_phone);

            // Vérifiez si le compte existe déjà
            $existingAccount = DB::table('espace_perso_account')
                ->where('phone_number', $souscr_phone)
                ->first();

            if ($existingAccount) {
                Log::info('Compte personnel existant trouvé.', [
                    'account_id' => $existingAccount->id,
                    'phone_number' => $souscr_phone
                ]);
                return $existingAccount->id; // Retourner l'ID du compte existant
            }

            // Créer un nouveau mot de passe et le stocker dans la session
            $password = Hash::make('12345678');
            Session::put('_password_sousc', $password);

            // Créer un nouveau compte personnel
            $newAccountId = DB::table('espace_perso_account')->insertGetId([
                'name' => $souscr_name,
                'phone_number' => $souscr_phone,
                'password' => $password,
                'status' => 1,
                'remember_token' => Str::random(60),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);

            Log::info('Nouveau compte personnel créé.', [
                'account_id' => $newAccountId,
                'phone_number' => $souscr_phone
            ]);

            return $newAccountId; // Retourner l'ID du nouveau compte

        } catch (\Exception $e) {
            Log::error('Erreur lors de la création ou de la récupération du compte personnel : ' . $e->getMessage(), [
                'name' => $souscr_name,
                'phone_number' => $souscr_phone
            ]);

            return null; // Retourner null en cas d'échec
        }
    }

    public function showAutoCongratePage($id_quote)
    {
        $prospect = DB::select('SELECT
        number_n,
        firstname,
        lastname,
        email,
        contact,
        usertype,
        product_type,
        matriculation,
        power,
        energy,
        firstrelease,
        placesnumber,
        parkingzone,
        vneuve,
        vvenale,
        city,
        city.zone,
        reduction_commerciale,
        assurance_auto_infos.releasedate as assurance_release_date,
        assurance_auto_infos.id as assurance_auto_info_id,
        periode.periode,
        periode.nbmois,
        periode.id as pid,
        subscription_type,
        city.id as cid,
        quotation.status,
        quotation.company_id as id_comp,
        quotation.id as qid,
        quotation.created_at as created_at,
        make.id as makid,
        quotation.id as qid,
        quotation.delivery_location,
        quotation.phone_client,
        auto_categories.id as autid,
        make.title,
        auto_categories.categorie,
        auto_infos.id as auto_info_id,
        users.id as uid,
        guarante
        from
        quotation,
        assurance_auto_infos,
        auto_infos,
        users,
        make,
        auto_categories,
        city,
        periode
        where users.id=user_id and auto_infos.id=product_id and quotation.id="'.$id_quote.'" and  assurance_auto_infos.id=assurance_infos_id and make.id=auto_infos.make_id and auto_categories.id=auto_infos.category and city.id=auto_infos.parkingzone and periode.id=assurance_auto_infos.periode');
        if($prospect)

        return redirect()->route('page.myspace')->with(['active'=>'','prospect'=>$prospect[0]], 'success', 'Votre devis a été confirmé avec succès. Rendez-vous dans la section Devis et documents pour procéder au paiement.');

        else

        return abort(404);

    }

    public function showVoyageCongratePage($id_quote)
    {

        $prospect =  DB::table("quotation")
                    ->join("users","users.id","quotation.user_id")
                    ->join("assurance_voyage_infos","assurance_voyage_infos.id","quotation.assurance_infos_id")
                    ->join("pays","pays.pays_id","assurance_voyage_infos.destination_country")
                    ->select("users.*","quotation.id as quote_id","quotation.assurance_infos_id","quotation.number_n","quotation.user_id","quotation.product_type","quotation.company_id","assurance_voyage_infos.id as assur_voy_id","destination_country","current_addr","destination_addr","departure_date","arrival_date","pays.pays_name","pays.pays_code","pays.pays_zone")
                    ->where("quotation.id",$id_quote)->first();

        return redirect()->route('page.myspace')->with(['active'=>'','prospect'=>$prospect], 'success', 'Votre devis a été confirmé avec succès. Rendez-vous dans la section Devis et documents pour procéder au paiement.');
    }

    private function format_garantie($type,$my_guaranties,$formule)
    {
        if($type=='F'){
            $garantie= $formule;
        }

        else{
        $nbre = count($my_guaranties);
        $garantie = "[";
        $delimiter = ",";
        for($i=0;$i<$nbre;$i++)
        {
        if($i==$nbre-1)
        {
        $delimiter = "";
        }
        $garantie =$garantie.$my_guaranties[$i].$delimiter;

        }
        $garantie =$garantie."]";
        }

        return $garantie;
    }

    private function garantie_to_array($guarantee)
    {
        $result = substr($guarantee, 1, -1);
        $guarantees_array = explode(',', $result);
        return $guarantees_array;
    }

    private function format_service($services)
    {
        // Si $services est null, le transformer en un tableau vide
        $services = $services ?? [];

        // Compter les éléments du tableau
        $nbre = count($services);

        $service = "[";
        $delimiter = ",";

        for ($i = 0; $i < $nbre; $i++) {
            if ($i == $nbre - 1) {
                $delimiter = "";
            }
            $service .= $services[$i] . $delimiter;
        }

        $service .= "]";
        return $service;
    }

    private function saveCarIfNotExist2(Request $req)
    {
        $auto = new AutoInfos();
        $auto->matriculation = strtoupper(str_replace(" ", "", $req->immat));
        $auto->proprio_veh = $req->proprio_veh;

        $auto->company_name = !empty($req->company_name) ? $req->company_name : 'N/A';
        $auto->manager_name = !empty($req->manager_name) ? $req->manager_name : 'N/A';

        $auto->name_cg = $req->name_cg;
        $auto->make_id = $req->marque;
        $auto->type_id = $req->genre;
        $auto->category = $req->category;
        $auto->power = $req->puissance;
        $auto->charge_utile = $req->cu ?? 0;
        $auto->energy = $req->ennergie;
        $auto->firstrelease = Carbon::createFromFormat("d/m/Y", $req->dateMiseCirc)->toDateString();
        $auto->vneuve = intval(str_replace(",", "", $req->vneuve));
        $auto->vvenale = intval(str_replace(",", "", $req->vvenale));
        $auto->color = $req->color;
        $auto->placesnumber = $req->nbplace;
        $auto->parkingzone = $req->city;
        $auto->created_at = Carbon::now();
        $auto->updated_at = Carbon::now();

        if ($auto->save()) {
            return $auto;
        }
    }

    private function saveMotoIfNotExist2(Request $req)
    {
        $marque_id  = DB::table('make')->insertGetId([
            "code"=> strtoupper($req->marque),
            "title"=> strtoupper($req->marque),
            "isMoto"=> 1
        ]);

        $modele_id  = DB::table('model')->insertGetId([
        "make_id"=> $marque_id ,
        "code"=> strtoupper($req->marque."-".time()),
        "title"=> strtoupper($req->marque."-".time())
        ]);

        $vehicule = AutoInfos::where('matriculation',strtoupper($req->immat))->first();
        $auto = new AutoInfos();
        $auto->matriculation=strtoupper(str_replace(" ", "",$req->immat));
        $auto->proprio_veh = $req->proprio_veh;
        $auto->company_name = $req->company_name;
        $auto->manager_name = $req->manager_name;
        $auto->name_cg = $req->name_cg;
        $auto->make_id = $marque_id;
        $auto->type_id = 7;
        $auto->cylindree = $req->cylindree;
        $auto->category =5;
        $auto->power = 0;
        $auto->charge_utile = 0;
        $auto->energy = "E";
        $auto->firstrelease = Carbon::createFromFormat("d/m/Y", $req->dateMiseCirc)->toDateString();
        $auto->vneuve = intval(str_replace(",", "", $req->vneuve));
        $auto->vvenale = intval(str_replace(",", "", $req->vvenale));
        $auto->color = $req->color;
        $auto->placesnumber  = $req->nbplace;
        $auto->parkingzone = $req->city;
        $auto->created_at = Carbon::now();
        $auto->updated_at = Carbon::now();
        if($auto->save()){
            return $auto;
        }

    }

    private function saveUserIfNotExist2(Request $req)
    {
        $user_date_pc = ($req->datePC != null) ? Carbon::createFromFormat("d/m/Y", $req->datePC)->toDateString() : null;
        $email = ($req->email == "") ? time() . "@email.com" : $req->email;

        // Gestion des noms et prénoms
        $firstname = ($req->proprio_veh == "E") ? $req->company_name : $req->firstname;
        $lastname = ($req->proprio_veh == "E") ? $req->company_name : $req->lastname;

        $phone = str_replace([" ", "-"], "", $req->phone);

        // Sauvegarde dans la session
        if ($req->proprio_veh == "P") {
            Session::put('_name_sousc', $firstname . " " . $lastname);
            Session::put('_phone_sousc', $phone);
        } else {
            Session::put('_name_sousc', $req->souscripteur_name);
            Session::put('_phone_sousc', str_replace(' ', '', $req->phone_souscr));
        }

        // Vérification du type de formulaire (Auto ou Voyage)
        $formType = decrypt($req->get("_form_type_"));

        // Rechercher un utilisateur par e-mail ou téléphone
        $user = User::where('contact', $phone)
            ->orWhere('email', $email)
            ->first();

        if ($user) {
            return $user; // Retourne l'utilisateur trouvé
        }

        // Si l'utilisateur n'existe pas, créez un nouvel utilisateur
        return $this->createUser($firstname, $lastname, $phone, $email, $req->gender, $user_date_pc);
    }

    private function createUser($firstname, $lastname, $phone, $email, $gender, $date_pc)
    {
        $user = new User();
        $user->firstname = $firstname;
        $user->lastname = $lastname;
        $user->contact = $phone;
        $user->email = $email;
        $user->gender = $gender;
        $user->date_pc = $date_pc;
        $user->password = bcrypt(Str::random(6));
        $user->avatar = 'default.png';
        $user->status = 1; // Par défaut inactif
        $user->usertype = 0; // Voyage par défaut
        $user->remember_token = md5(time());
        $user->created_at = Carbon::now();
        $user->updated_at = Carbon::now();
        $user->save();

        return $user;
    }

    private function saveInfoAutoInsurance($guarantee, $releasedate, $periode, $sub_type)
    {
        $assuranceAutoInfos =  new AssuranceAutoInfos();
        $assuranceAutoInfos->guarante =  $guarantee;
        $assuranceAutoInfos->releasedate = $releasedate;
        $assuranceAutoInfos->periode = $periode;
        $assuranceAutoInfos->subscription_type = $sub_type;
        $assuranceAutoInfos->reduction_commerciale =0;
        $assuranceAutoInfos->save();
        return $assuranceAutoInfos;
    }

    private function saveInfoVoyageInsurance($request)
    {
        try {
            $assuranceVoyageInfos = new AssuranceVoyageInfos();
            $assuranceVoyageInfos->destination_country = $request->destination;
            $assuranceVoyageInfos->current_addr = $request->current_addr;
            $assuranceVoyageInfos->destination_addr = $request->dest_addr;
            $assuranceVoyageInfos->departure_date = Carbon::createFromFormat("d/m/Y", $request->date_departure)->toDateString();
            $assuranceVoyageInfos->arrival_date = Carbon::createFromFormat("d/m/Y", $request->date_arrival)->toDateString();
            $assuranceVoyageInfos->nationality_id = $request->nationality;
            $assuranceVoyageInfos->passport_num = $request->num_passport;
            $assuranceVoyageInfos->date_expire_passport = Carbon::createFromFormat("d/m/Y", $request->expire_passport)->toDateString();

            // Tentative de sauvegarde
            if ($assuranceVoyageInfos->save()) {
                return $assuranceVoyageInfos;
            } else {
                Log::error('Échec de la sauvegarde des informations d\'assurance voyage.', [
                    'data' => $request->all()
                ]);
                return null;
            }
        } catch (\Exception $e) {
            Log::error('Erreur lors de la sauvegarde des informations d\'assurance voyage : ' . $e->getMessage());
            return null;
        }
    }

    public function saveProductQuotation($product_id,$assurance_infos_id,$user_id,$product_type, $comp_id, $service)
    {
        $quotation = new Quotation();
        $quotation->product_id= $product_id;
        $quotation->assurance_infos_id = $assurance_infos_id;
        $quotation->user_id = $user_id;
        $quotation->status =0;
        $quotation->product_type=$product_type;
        $quotation->number_n = Quotation::get_unique_number();
        $quotation->company_id = $comp_id;
        $quotation->service_opt = $service;
        $quotation->save();

        return $quotation;
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
