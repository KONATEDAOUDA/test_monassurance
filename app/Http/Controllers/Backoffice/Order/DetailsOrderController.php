<?php

namespace App\Http\Controllers\Backoffice\Order;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;
use Carbon\Carbon;
use App\Http\Controllers\Backoffice\AnotherController;
use App\Models\Quotation;
use App\Models\Make;
use App\Models\AutoCategories;
use App\Models\City;
use App\Models\Periode;
use App\Models\User;
use App\Models\AutoGuarantee;
use App\Models\Job;
use App\Models\CarType;
use App\Models\AssuranceAutoInfos;
use App\Models\AssuranceVoyageInfos;
use App\Models\Backoffice\OrderStatusActor;
use App\Models\Backoffice\Attestation;
use App\Models\EspacePersoAccount;
use Illuminate\Support\Facades\Log;
use PDF;
use PhpParser\Node\Stmt\Return_;
use Whoops\Run;
use Illuminate\Support\Facades\Mail;

class DetailsOrderController extends Controller
{
    public function commandeTraiter()
    {
        $commandes = DB::select('SELECT
        number_n,
        policy_number,
        firstname,
        lastname,
        email,
        contact,
        product_type,
        quotation.status,
        quotation.created_at,
        quotation.id as qid,
        assurance_infos_id as aid
        from
        quotation,
        users
        where users.id=user_id and quotation.status=5 order by quotation.id desc');
        return view('Backoffice.backend.order.commande-traiter')->with(['isActive'=>'commandes','commandes'=>$commandes]);
    }

    public function Quotedetails($id, $aid)
    {
        // Récupérer le prospect avec les relations nécessaires
        $prospect = Quotation::with(['user', 'assuranceAutoInfo', 'autoInfo'])
            ->where('id', $id)
            ->first();

        // Vérifier si le prospect existe
        if (!$prospect) {
            Log::error('Prospect introuvable avec l\'ID : ' . $id);
            throw new \Exception('Prospect introuvable.');
        }

        Log::info('Prospect trouvé :', ['prospect' => $prospect]);

        // Vérifier que product_id est défini
        if (empty($prospect->product_id)) {
            Log::error('product_id est null pour le devis ID : ' . $prospect->id);
            throw new \Exception('product_id est null. Le devis ne peut pas être traité sans product_id.');
        }

        // Vérifier que assurance_infos_id est défini
        if (empty($prospect->assurance_infos_id)) {
            Log::error('assurance_infos_id est null pour le devis ID : ' . $prospect->id);
            throw new \Exception('assurance_infos_id est null. Le devis ne peut pas être traité sans assurance_infos_id.');
        }

        // Récupérer les données nécessaires
        $makes = Make::all();
        $categories = AutoCategories::where('enabled', 1)->get();
        $zones = City::all();
        $jobs = Job::where('enabled', 1)->orderBy('jobtitle')->get();
        $car_types = CarType::where('car_type_status', 1)->get();
        $periodes = Periode::all();
        $guarantees = AutoGuarantee::all();

        // Récupérer les garanties formatées
        $guaranty = AssuranceAutoInfos::find($aid);
        if (!$guaranty) {
            Session::flash('error', 'Informations de garantie manquantes.');
            return redirect()->route('spaceDashboard')->with(['isActive' => 'dashboard']);
        }
        $guarantees_array = $this->garantie_to_array($guaranty->guarante);

        // Mettre à jour collect_data si nécessaire
        if ($prospect->collect_data == null) {
            $quotations = json_decode(app('App\Http\Controllers\Backoffice\Quotation\AutoQuotationController')
                ->caculAutoQuotationFromDb($prospect->product_id, $prospect->user_id, $prospect->assurance_infos_id));

            $prospect->update([
                "collect_data" => app('App\Http\Controllers\Backoffice\Quotation\AutoQuotationController')
                    ->caculAutoQuotationFromDb($prospect->product_id, $prospect->user_id, $prospect->assurance_infos_id)
            ]);
        } else {
            $quotations = json_decode($prospect->collect_data);
        }

        // Récupérer les services optionnels
        $optional_service = DB::table('optional_service')->where(['product_type' => 1])->get();
        $selected_serv = collect($quotations[0]->servopt);

        // Récupérer les relances client
        $revives = DB::table('revive_client_quotation')->where('quotation_id', $id)->get();

        // Récupérer l'historique des statuts de la commande
        $order_status = DB::table('order_status_actor')
            ->join('quotation', 'quotation.id', '=', 'order_status_actor.order_id')
            ->join('users', 'users.id', '=', 'order_status_actor.actor_id')
            ->select(
                'user_id', 'firstname', 'lastname', 'usertype', 'number_n',
                'quotation.status as current_status', 'policy_number',
                'order_id', 'order_status', 'order_status_actor.created_at',
                'order_status_actor.updated_at'
            )
            ->where('order_status_actor.order_id', $id)
            ->groupBy('order_status')
            ->orderBy('order_status')
            ->get();

        $client = User::find($prospect->user_id); // Récupérer les informations du client

        // Mettre à jour la vue du devis
        $prospect->update(["view" => 1]);

        // Retourner la vue avec les données
        return view('Backoffice.backend.prospection.details-devis')->with([
            'isActive' => 'commande',
            'categories' => $categories,
            'makes' => $makes,
            'zones' => $zones,
            'jobs' => $jobs,
            'car_types' => $car_types,
            'guarantees' => $guarantees,
            'periodes' => $periodes,
            'prospect' => $prospect,
            'guarantees_array' => $guarantees_array,
            'quotations' => $quotations,
            'optional_service' => $optional_service,
            'selected_serv' => $selected_serv,
            'revives' => $revives,
            'order_status' => $order_status,
            'client' => $client,
        ]);
    }

    public function TravelQuotedetails($id, $aid)
    {
        $prospect = DB::table("quotation")
                ->join("assurance_voyage_infos", "assurance_voyage_infos.id", "quotation.assurance_infos_id")
                ->join("users", "users.id", "quotation.user_id")
                ->join("pays", "pays.pays_id", "assurance_voyage_infos.destination_country")
                ->select("quotation.id as qid", "assurance_infos_id as assur_voy_id", "user_id", "quotation.status", "product_type", "number_n", "policy_number", "priority", "company_id", "collect_data", "service_opt", "delivery_location", "inbox_amount", "phone_client", "renew_order", "quotation.created_at", "destination_country", "current_addr", "destination_addr", "departure_date", "arrival_date", "nationality_id", "passport_num", "date_expire_passport", "firstname", "lastname", "gender", "dob", "contact", "email", "usertype", "pays.pays_name", "pays.pays_code", "pays.pays_zone")
                ->where("quotation.id", $id)->first();

        if (!$prospect) {
            Session::flash('error', 'Une erreur s\'est produite');
            return redirect()->route('spaceDashboard')->with(['isActive' => 'dashboard']);
        }

        // Calcul de la durée correcte
        $duration = Carbon::parse($prospect->departure_date)
                    ->diffInDays(Carbon::parse($prospect->arrival_date));

        if ($prospect->collect_data == null) {
            $quotations = json_decode(app('App\Http\Controllers\Quotation\VoyageQuotationController')->caculVoyageQuotationFromDb($prospect));
            DB::table("quotation")->where("id", $id)->update([
                "collect_data" => app('App\Http\Controllers\Quotation\VoyageQuotationController')->caculVoyageQuotationFromDb($prospect)
            ]);
        } else {
            $quotations = json_decode($prospect->collect_data);

            // Correction de la durée dans les données existantes
            foreach ($quotations as $quote) {
                if (isset($quote->ASSURANCE)) {
                    $quote->ASSURANCE->DUREE = $duration;
                }
            }
        }

        $optional_service = DB::table('optional_service')->where(['product_type' => 3])->get();
        $selected_serv = collect($quotations[0]->SERVICES ?? []);
        $revives = DB::table('revive_client_quotation')->where('quotation_id', $id)->get();

        $order_status = DB::table('order_status_actor')
                        ->join('quotation', 'quotation.id', 'order_status_actor.order_id')
                        ->join('users', 'users.id', 'order_status_actor.actor_id')
                        ->select('user_id', 'firstname', 'lastname', 'usertype', 'number_n', 'quotation.status as current_status', 'policy_number', 'order_id', 'order_status', 'order_status_actor.created_at', 'order_status_actor.updated_at')
                        ->where('order_status_actor.order_id', $id)
                        ->groupBy('order_status')
                        ->orderBy('order_status')
                        ->get();

        DB::table("quotation")->where("id", $id)->update([
            "view" => 1
        ]);

        $companies = DB::table('auto_company')->where(['has_travel' => 1])->get();
        $pays = DB::table('pays')->get();

        return view('Backoffice.backend.prospection.details-devis-voyage')->with([
            'isActive' => 'commande',
            'prospect' => $prospect,
            'quotations' => $quotations,
            'optional_service' => $optional_service,
            'selected_serv' => $selected_serv,
            'companies' => $companies,
            'pays' => $pays,
            'revives' => $revives,
            'order_status' => $order_status,
            'correct_duration' => $duration // Passage de la durée calculée à la vue
        ]);
    }

    public function garantie_to_array($guarante)
    {
        // Conversion de la garantie en tableau
        return json_decode($guarante, true);
    }

    public function loadDevisVoyagePDF($comp_id,$quote_id)
    {
        $prospect =  DB::table("quotation")
                ->join("users","users.id","quotation.user_id")
                ->join("assurance_voyage_infos","assurance_voyage_infos.id","quotation.assurance_infos_id")
                ->join("pays","pays.pays_id","assurance_voyage_infos.destination_country")
                ->select("users.*","quotation.id as quote_id","quotation.assurance_infos_id","quotation.number_n","collect_data","quotation.user_id","quotation.product_type","quotation.company_id","quotation.created_at as date_devis", "quotation.status as status_devis","assurance_voyage_infos.id as assur_voy_id","destination_country","current_addr","destination_addr","departure_date","arrival_date","nationality_id","passport_num","date_expire_passport","pays.pays_name","pays.pays_code","pays.pays_zone")
                ->where("quotation.id",$quote_id)->get();

        if(sizeof($prospect)>0){

        $prospect = $prospect[0];

            if($prospect->collect_data==null){
                $quotations = json_decode(app('App\Http\Controllers\Quotation\VoyageQuotationController')->caculVoyageQuotationFromDb($prospect));
                DB::table("quotation")->where("id",$id)->update([
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

    public function setAllAutoQuotationToPersistedData(){
        $quotes = DB::table("quotation")->where('product_type',1)->orderBy('id','desc')->get();
            foreach ($quotes as $q){

                if($q->collect_data==null){
                    $prospect = DB::select('SELECT
                    number_n,
                    priority,
                    policy_number,
                    firstname,
                    lastname,
                    email,
                    contact,
                    gender,
                    dob,
                    usertype,
                    product_type,
                    matriculation,
                    power,
                    proprio_veh,
                    company_name,
                    manager_name,
                    name_cg,
                    energy,
                    firstrelease,
                    placesnumber,
                    parkingzone,
                    city.zone,
                    type_id,
                    vneuve,
                    vvenale,
                    city,
                    city.zone,
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
                    quotation.company_id as id_comp,
                    quotation.id as qid,
                    quotation.phone_client,
                    quotation.delivery_location,
                    quotation.renew_order,
                    quotation.collect_data,
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
                    job_id,
                    auto_infos.type_id,
                    date_pc,
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
                    job,
                    car_type
                    where users.id=user_id and auto_infos.id=product_id and quotation.id="'.$q->id.'" and  assurance_auto_infos.id=assurance_infos_id and job.id=job_id and car_type.id_type=auto_infos.type_id and make.id=auto_infos.make_id and auto_categories.id=auto_infos.category and city.id=auto_infos.parkingzone and periode.id=assurance_auto_infos.periode');

                    if(sizeof($prospect)>0){
                    $prospect = $prospect[0];
                    DB::table("quotation")->where("id",$q->id)->update([
                        "collect_data"=> app('App\Http\Controllers\Backoffice\Quotation\AutoQuotationController')->caculAutoQuotationFromDb($prospect->auto_info_id, $prospect->uid, $prospect->assurance_auto_info_id)
                    ]);
                    }
                }
            }
    }

    public function setAllTravelQuotationToPersistedData()
    {
            DB::table("quotation")->where('product_type',3)->orderBy('id','desc')->chunk(100,function ($quotes){
            foreach ($quotes as $q) {

                if ($q->collect_data == null) {
                    $prospect = DB::table("quotation")
                        ->join("users", "users.id", "quotation.user_id")
                        ->join("assurance_voyage_infos", "assurance_voyage_infos.id", "quotation.assurance_infos_id")
                        ->join("pays", "pays.pays_id", "assurance_voyage_infos.destination_country")
                        ->select("users.*", "quotation.id as quote_id", "quotation.assurance_infos_id","collect_data","user_id", "quotation.number_n", "collect_data", "quotation.user_id", "quotation.product_type", "quotation.company_id", "quotation.created_at as date_devis", "quotation.status as status_devis", "assurance_voyage_infos.id as assur_voy_id", "destination_country", "current_addr", "destination_addr", "departure_date", "arrival_date", "nationality_id", "passport_num", "date_expire_passport", "pays.pays_name", "pays.pays_code", "pays.pays_zone")
                        ->where("quotation.id", $q->id)->first();

                    DB::table("quotation")->where("id", $q->id)->update([
                        "collect_data" => app('App\Http\Controllers\Quotation\VoyageQuotationController')->caculVoyageQuotationFromDb($prospect)
                    ]);
                }
            }
            });
    }
    public function adminshowQuoteDetails($quote_id,$comp_id)
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
                $quotations = json_decode(app('App\Http\Controllers\Backoffice\Quotation\AutoQuotationController')->caculAutoQuotationFromDb($prospect->auto_info_id, $prospect->uid, $prospect->assurance_auto_info_id));
                DB::table("quotation")->where("id",$quote_id)->update([
                    "collect_data"=> app('App\Http\Controllers\Backoffice\Quotation\AutoQuotationController')->caculAutoQuotationFromDb($prospect->auto_info_id, $prospect->uid, $prospect->assurance_auto_info_id)
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



            return view('Backoffice.backend.Order.details-auto-confirm', compact('data','prospect','garantees','comp_gar'))->with('active','auto');
        }
    }

    public function ConfirmadminAutoQuotation(Request $request)
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

        return redirect()->route('devis.list')->with('sucess',  'Devis confirmé avec succès');
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

    public function showadminTravelQuoteDetails($quote_id, $comp_id)
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
            return redirect()->back();
        }

        $quotations = $prospect->collect_data ? json_decode($prospect->collect_data) : [];

        Log::info('Données collectées :', [
            'quotations' => $quotations,
            'comp_id' => $comp_id,
            'dates' => [
                'depart' => $prospect->departure_date,
                'arrivee' => $prospect->arrival_date
            ]
        ]);

        $data = null;
        if ($quotations) {
            foreach ($quotations as $q) {
                if (isset($q->idcomp) && $q->idcomp == $comp_id) {
                    $data = $q;
                    break;
                }
            }
        }

        if (!$data) {
            Log::error("Aucune correspondance trouvée pour comp_id : $comp_id");
            Session::flash('error', "Devis introuvable pour cette compagnie.");
           // return redirect()->back();
        }

        // Calcul précis de la durée (inclusif)
        $duration = Carbon::parse($prospect->departure_date)
                    ->diffInDays(Carbon::parse($prospect->arrival_date));

        // Assure que toutes les propriétés requises existent
        $data->PRIME = $data->PRIME ?? 0;
        $data->FG = $data->FG ?? 0;
        $data->ASSURANCE = $data->ASSURANCE ?? (object)[];
        $data->ASSURANCE->ZONE = $data->ASSURANCE->ZONE ?? $prospect->pays_zone ?? 'INCONNUE';
        $data->ASSURANCE->DUREE = $duration;

        $company_quotation = DB::table('auto_companyquotation')
            ->where(['companyid' => $data->idcomp, 'type_assurance' => 3])
            ->orderBy('id', 'desc')
            ->first();

        if (!$company_quotation) {
            Session::flash('error', "Informations sur la compagnie introuvables.");
           // return redirect()->back();
        }

        $comp_gar = json_decode($company_quotation->formules, true);

        // Journalisation pour débogage
        Log::debug('Données envoyées à la vue', [
            'duration' => $duration,
            'data' => $data,
            'prospect_dates' => [
                'depart' => $prospect->departure_date,
                'arrivee' => $prospect->arrival_date
            ]
        ]);

        return view('Backoffice.backend.Order.details-auto-confirm-voyage', compact('data', 'prospect', 'comp_gar'))
            ->with('active', 'voyage');
    }
}
