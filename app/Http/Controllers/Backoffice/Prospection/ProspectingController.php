<?php

namespace App\Http\Controllers\Backoffice\Prospection;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Models\Backoffice\Attestation;
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
use App\Models\AssuranceAutoInfos;
use App\Models\AssuranceVoyageInfos;
use App\Models\Quotation;
use Illuminate\Support\Str;
use PDF;

class ProspectingController extends Controller
{
    public function ShowCreateQuotationForm()
    {
        $makes = DB::table('make')->where('isMoto', 0)->get();
        $categories = AutoCategories::where('enabled', 1)->get();
        $zones = City::all();
        $jobs = Job::where('enabled', 1)->get();
        $periodes = Periode::all();
        $companies = AutoCompany::where('enabled', 1)->get();
        $guarantees = AutoGuarantee::where('isDeprecated', 0)->get();
        $optional_services = OptionnalService::where('product_type', 1)->get();
        $car_types = DB::table('car_type')->where('car_type_status', 1)->get();

        return view('Backoffice.backend.prospection.creer-devis')->with([
            'isActive' => 'prospectmanager',
            'categories' => $categories,
            'makes' => $makes,
            'zones' => $zones,
            'jobs' => $jobs,
            'car_types' => $car_types,
            'guarantees' => $guarantees,
            'companies' => $companies,
            'optional_services' => $optional_services,
            'periodes' => $periodes
        ]);
    }

    public function ShowCreateMotoQuotationForm()
    {
        $makes = DB::table('make')->where('isMoto', 0)->get();
        $categories = AutoCategories::where('enabled', 1)->get();
        $zones = City::all();
        $jobs = Job::where('enabled', 1)->get();
        $periodes = Periode::all();
        $companies = AutoCompany::where('enabled', 1)->get();
        $guarantees = AutoGuarantee::where('isDeprecated', 0)->get();
        $optional_services = OptionnalService::where('product_type', 1)->get();
        $car_types = DB::table('car_type')->where('car_type_status', 0)->get();

        return view('Backoffice.backend.prospection.creer-devis-moto')->with([
            'isActive' => 'prospectmanager',
            'categories' => $categories,
            'makes' => $makes,
            'zones' => $zones,
            'jobs' => $jobs,
            'car_types' => $car_types,
            'guarantees' => $guarantees,
            'companies' => $companies,
            'optional_services' => $optional_services,
            'periodes' => $periodes
        ]);
    }

    public function ShowCreateVoyageQuotationForm()
    {
        $companies = DB::table('auto_company')->where(['has_travel' => 1])->get();
        $pays = DB::table('pays')->get();
        $optional_service = DB::table('optional_service')->where(['product_type' => 3])->get();

        return view('Backoffice.backend.prospection.creer-devis-voyage')->with([
            'isActive' => 'prospectmanager',
            'pays' => $pays,
            'companies' => $companies,
            'optional_service' => $optional_service
        ]);
    }

    public function saveVehicleIfNotExist(Request $request)
{
    try {
        $auto = new AutoInfos();

        // Champs obligatoires avec validation
        $auto->matriculation = strtoupper(str_replace(" ", "", $request->immat));
        $auto->proprio_veh = $request->proprio_veh;
        $auto->name_cg = $request->name_cg ?? 'N/A';
        $auto->make_id = $request->marque;
        $auto->type_id = $request->genre;
        $auto->category = $request->category ?? 1; // Valeur par défaut
        $auto->power = $request->puissance ?? 0;
        $auto->charge_utile = $request->cu ?? 0; // Correction du problème principal
        $auto->energy = $request->ennergie ?? 'E'; // Valeur par défaut
        $auto->firstrelease = Carbon::createFromFormat("d/m/Y", $request->dateMiseCirc)->toDateString();
        $auto->vneuve = intval(str_replace(",", "", $request->vneuve ?? 0));
        $auto->vvenale = intval(str_replace(",", "", $request->vvenale ?? 0));
        $auto->color = $request->color ?? 1;
        $auto->placesnumber = $request->nbplace ?? 5;
        $auto->parkingzone = $request->city ?? 1;

        // Champs optionnels avec valeurs par défaut
        $auto->company_name = $request->company_name ?? 'N/A';
        $auto->manager_name = $request->manager_name ?? 'N/A';

        $auto->created_at = Carbon::now();
        $auto->updated_at = Carbon::now();

        if (!$auto->save()) {
            throw new \Exception('Échec de la sauvegarde des informations du véhicule');
        }

        return $auto;

    } catch (\Exception $e) {
        Log::error('Erreur saveVehicleIfNotExist', [
            'error' => $e->getMessage(),
            'request' => $request->all(),
            'trace' => $e->getTraceAsString()
        ]);
        throw $e;
    }
}

    public function CreateAutoQuotation(Request $request)
    {
        // Validation étendue
        $validator = Validator::make($request->all(), [
            'immat' => 'required|string|max:20',
            'proprio_veh' => 'required|in:P,E',
            'marque' => 'required|exists:make,id',
            'genre' => 'required|exists:car_type,id_type',
            'dateMiseCirc' => 'required|date_format:d/m/Y',
            'priseeffet' => 'required|date_format:d/m/Y',
            'periode' => 'required|exists:periode,id',
            'souscription' => 'required|in:F,A',
            'guarantee' => 'nullable|array',
            'opt_serv' => 'nullable|array',
            'cu' => 'nullable|numeric', // Nouvelle règle pour charge_utile
            'puissance' => 'nullable|numeric',
            'nbplace' => 'nullable|integer|min:1'
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        DB::beginTransaction();

        try {
            $auto = $this->saveVehicleIfNotExist($request);
            $user = $this->saveUserIfNotExist($request);

            $name = Session::get('_name_sousc');
            $phone = Session::get('_phone_sousc');

            $type = $request->get('souscription');
            $my_guaranties = $request->get('guarantee');
            $formule = $request->get('formule');
            $pref_comp = 0;
            $garantie = $this->format_garantie($type, $my_guaranties, $formule);
            $service = $this->format_service($request->get('opt_serv'));
            $priseeffet = Carbon::createFromFormat("d/m/Y", $request->get('priseeffet'))->toDateString();

            $assurance_infos = $this->saveInfoAutoInsurance($garantie, $priseeffet, $request->get('periode'), $request->get('souscription'));

            $quotation = $this->saveProductQuotation($auto->id, $assurance_infos->id, $user->id, 1, $pref_comp, $service);

            $this->saveOrderStatusActor($quotation);
            $space_account_id = $this->saveSpacePersoAccountInfo($name, $phone);
            $this->storeWhoMadeQuote($quotation->id, $space_account_id);

            DB::commit();

            return redirect()->route('devis.details', ['id' => $quotation->id, 'aid' => $assurance_infos->id]);

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Erreur CreateAutoQuotation', [
                'error' => $e->getMessage(),
                'request' => $request->all(),
                'trace' => $e->getTraceAsString()
            ]);

            return redirect()->back()
                ->with('error', 'Une erreur est survenue lors de la création du devis')
                ->withInput();
        }
    }

    public function traitMotoQuotation(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'immat' => 'required|string|max:20',
            'proprio_veh' => 'required|in:P,E',
            'marque' => 'required|string',
            'dateMiseCirc' => 'required|date_format:d/m/Y',
            'priseeffet' => 'required|date_format:d/m/Y',
            'periode' => 'required|exists:periode,id',
            'souscription' => 'required|in:F,A',
            'guarantee' => 'nullable|array',
            'opt_serv' => 'nullable|array',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        DB::beginTransaction();

        try {
            $auto = $this->saveMotoIfNotExist($request);
            $user = $this->saveUserIfNotExist($request);

            $name = Session::get('_name_sousc');
            $phone = Session::get('_phone_sousc');

            $type = $request->get('souscription');
            $my_guaranties = $request->get('guarantee');
            $formule = $request->get('formule');
            $pref_comp = $request->get('pref_comp');
            $garantie = $this->format_garantie($type, $my_guaranties, $formule);
            $service = $this->format_service($request->get('opt_serv'));
            $priseeffet = Carbon::createFromFormat("d/m/Y", $request->get('priseeffet'))->toDateString();

            $assurance_infos = $this->saveInfoAutoInsurance($garantie, $priseeffet, $request->get('periode'), $request->get('souscription'));

            $quotation = $this->saveProductQuotation($auto->id, $assurance_infos->id, $user->id, 1, $pref_comp, $service);

            $this->saveOrderStatusActor($quotation);
            $space_account_id = $this->saveSpacePersoAccountInfo($name, $phone);
            $this->storeWhoMadeQuote($quotation->id, $space_account_id);

            DB::commit();

            return redirect()->route('devis.details', ['id' => $quotation->id, 'aid' => $assurance_infos->id]);
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Erreur lors de la création du devis moto : ' . $e->getMessage());
           // return redirect()->back()->with('error', 'Une erreur est survenue lors de la création du devis moto.');
        }
    }

    public function traitVoyageQuotation(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'destination' => 'required|string',
            'current_addr' => 'required|string',
            'dest_addr' => 'required|string',
            'date_departure' => 'required|date_format:d/m/Y',
            'date_arrival' => 'required|date_format:d/m/Y',
            'nationality' => 'required|exists:pays,id',
            'num_passport' => 'required|string',
            'expire_passport' => 'required|date_format:d/m/Y',
            'pref_comp' => 'required|exists:auto_company,id',
            'opt_serv' => 'nullable|array',
        ]);


        DB::beginTransaction();

        try {
            $user = $this->saveUserIfNotExist($request);

            $name = Session::get('_name_sousc');
            $phone = Session::get('_phone_sousc');

            $assurance_infos = $this->saveInfoVoyageInsurance($request);
            $service = ($request->get('opt_serv') != null) ? $this->format_service($request->get('opt_serv')) : "[]";

            $quotation = $this->saveProductQuotation(0, $assurance_infos->id, $user->id, 3, $request->pref_comp, $service);

            $this->saveOrderStatusActor($quotation);
            $space_account_id = $this->saveSpacePersoAccountInfo($name, $phone);
            $this->storeWhoMadeQuote($quotation->id, $space_account_id);

            DB::commit();

            return redirect()->route('devis.voyage.details', ['id' => $quotation->id, 'aid' => $assurance_infos->id]);
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Erreur lors de la création du devis voyage : ' . $e->getMessage());
            return redirect()->back()->with('error', 'Une erreur est survenue lors de la création du devis voyage.');
        }
    }

    private function saveMotoIfNotExist(Request $request)
    {
        $marque_id = DB::table('make')->insertGetId([
            "code" => strtoupper($request->marque),
            "title" => strtoupper($request->marque),
            "isMoto" => 1
        ]);

        $modele_id = DB::table('model')->insertGetId([
            "make_id" => $marque_id,
            "code" => strtoupper($request->marque . "-" . time()),
            "title" => strtoupper($request->marque . "-" . time())
        ]);

        $auto = new AutoInfos();
        $auto->matriculation = strtoupper($request->immat);
        $auto->proprio_veh = $request->proprio_veh;
        $auto->company_name = $request->company_name;
        $auto->manager_name = $request->manager_name;
        $auto->name_cg = $request->name_cg;
        $auto->make_id = $marque_id;
        $auto->type_id = 7;
        $auto->cylindree = $request->cylindree;
        $auto->category = 5;
        $auto->power = 0;
        $auto->charge_utile = 0;
        $auto->energy = "E";
        $auto->firstrelease = Carbon::createFromFormat("d/m/Y", $request->dateMiseCirc)->toDateString();
        $auto->vneuve = intval(str_replace(",", "", $request->vneuve));
        $auto->vvenale = intval(str_replace(",", "", $request->vvenale));
        $auto->color = $request->color;
        $auto->placesnumber = $request->nbplace;
        $auto->parkingzone = $request->city;
        $auto->created_at = Carbon::now();
        $auto->updated_at = Carbon::now();

        if (!$auto->save()) {
            throw new \Exception('Échec de la sauvegarde des informations du véhicule.');
        }

        return $auto;
    }

    private function saveUserIfNotExist(Request $request)
    {
        $user_date_pc = ($request->datePC != null) ? Carbon::createFromFormat("d/m/Y", $request->datePC)->toDateString() : null;
        $user_dob = ($request->dob != null) ? Carbon::createFromFormat("d/m/Y", $request->dob)->toDateString() : null;
        $email = ($request->email == "") ? time() . "@email.com" : $request->email;

        if ($request->proprio_veh != null) {
            $firstname = ($request->proprio_veh == "E") ? $request->company_name : $request->firstname;
            $lastname = ($request->proprio_veh == "E") ? $request->company_name : $request->lastname;
            $job_id = ($request->proprio_veh == "E") ? 13 : $request->job;
        } else {
            $firstname = $request->firstname;
            $lastname = $request->lastname;
            $job_id = 14;
        }

        if ($request->proprio_veh == "P") {
            Session::put('_name_sousc', $firstname . " " . $lastname);
            Session::put('_phone_sousc', str_replace(' ', '', $request->phone));
        } else {
            Session::put('_name_sousc', $request->souscripteur_name);
            Session::put('_phone_sousc', str_replace(' ', '', $request->phone_souscr));
        }

        $phone = str_replace([" ", "-"], "", $request->phone);

        if (decrypt($request->get("_form_type_")) == 'AUTO') {
            if (User::check_auto_user($phone, $job_id) || User::check_mail($email)) {
                $u = (User::check_auto_user($phone, $job_id)) ? User::check_auto_user($phone, $job_id) : User::check_mail($email);
                return $u;
            } else {
                $user = new User();
                $user->firstname = $firstname;
                $user->lastname = $lastname;
                $user->contact = $phone;
                $user->email = $email;
                $user->gender = $request->gender;
                $user->job_id = $job_id;
                $user->date_pc = $user_date_pc;
                $user->dob = $user_dob;
                $user->password = bcrypt(Str::random(6));
                $user->avatar = 'default.png';
                $user->status = 0;
                $user->usertype = 0;
                $user->remember_token = md5(time());
                $user->created_at = Carbon::now();
                $user->updated_at = Carbon::now();

                if (!$user->save()) {
                    throw new \Exception('Échec de la sauvegarde des informations de l\'utilisateur.');
                }

                return $user;
            }
        } elseif (decrypt($request->get("_form_type_")) == 'VOYAGE') {
            if (User::check_travel_user($phone, $user_dob) || User::check_mail($email)) {
                $u = (User::check_travel_user($phone, $user_dob)) ? User::check_travel_user($phone, $user_dob) : User::check_mail($email);
                return $u;
            } else {
                $user = new User();
                $user->firstname = $request->firstname;
                $user->lastname = $request->lastname;
                $user->contact = $phone;
                $user->email = $email;
                $user->gender = $request->gender;
                if ($job_id) {
                    $user->job_id = $job_id;
                }
                $user->date_pc = $user_date_pc;
                $user->dob = $user_dob;
                $user->password = bcrypt(Str::random(6));
                $user->avatar = 'default.png';
                $user->status = 0;
                $user->usertype = 0;
                $user->remember_token = md5(time());
                $user->created_at = Carbon::now();
                $user->updated_at = Carbon::now();

                if (!$user->save()) {
                    throw new \Exception('Échec de la sauvegarde des informations de l\'utilisateur.');
                }

                return $user;
            }
        }
    }

    private function saveInfoAutoInsurance($guarantee, $releasedate, $periode, $sub_type)
    {
        $assuranceAutoInfos = new AssuranceAutoInfos();
        $assuranceAutoInfos->guarante = $guarantee;
        $assuranceAutoInfos->releasedate = $releasedate;
        $assuranceAutoInfos->periode = $periode;
        $assuranceAutoInfos->subscription_type = $sub_type;
        $assuranceAutoInfos->reduction_commerciale = 0;

        if (!$assuranceAutoInfos->save()) {
            throw new \Exception('Échec de la sauvegarde des informations d\'assurance auto.');
        }

        return $assuranceAutoInfos;
    }

    private function saveInfoVoyageInsurance(Request $request)
    {
        $assuranceVoyageInfos = new AssuranceVoyageInfos();
        $assuranceVoyageInfos->destination_country = $request->destination;
        $assuranceVoyageInfos->current_addr = $request->current_addr;
        $assuranceVoyageInfos->destination_addr = $request->dest_addr;
        $assuranceVoyageInfos->departure_date = Carbon::createFromFormat("d/m/Y", $request->date_departure)->toDateString();
        $assuranceVoyageInfos->arrival_date = Carbon::createFromFormat("d/m/Y", $request->date_arrival)->toDateString();
        $assuranceVoyageInfos->nationality_id = $request->nationality;
        $assuranceVoyageInfos->passport_num = $request->num_passport;
        $assuranceVoyageInfos->date_expire_passport = Carbon::createFromFormat("d/m/Y", $request->expire_passport)->toDateString();

        if (!$assuranceVoyageInfos->save()) {
            throw new \Exception('Échec de la sauvegarde des informations d\'assurance voyage.');
        }

        return $assuranceVoyageInfos;
    }

    private function saveProductQuotation($auto_id, $assurance_infos_id, $user_id, $product_type, $comp_id, $service)
    {
        $quotation = new Quotation();
        $quotation->product_id = $auto_id;
        $quotation->assurance_infos_id = $assurance_infos_id;
        $quotation->user_id = $user_id;
        $quotation->status = 0;
        $quotation->product_type = $product_type;
        $quotation->number_n = Quotation::get_unique_number();
        $quotation->company_id = $comp_id;
        $quotation->service_opt = $service;

        if (!$quotation->save()) {
            throw new \Exception('Échec de la sauvegarde du devis.');
        }

        return $quotation;
    }

    private function saveOrderStatusActor($quotation)
    {
        DB::table('order_status_actor')->insert([
            'order_id' => $quotation->id,
            'order_status' => $quotation->status,
            'actor_id' => Auth::user()->id,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);
    }

    private function format_garantie($type, $my_guaranties, $formule)
    {
        if ($type == 'F') {
            return $formule;
        } else {
            return json_encode($my_guaranties ?? []);
        }
    }

    private function format_service($services)
    {
        return json_encode($services ?? []);
    }

    private function saveSpacePersoAccountInfo($souscr_name, $souscr_phone)
    {
        if (!$this->checkIfPersoSpaceExist($souscr_phone)) {
            $password = Str::random(6);
            Session::put('_password_sousc', $password);
            return DB::table("espace_perso_account")->insertGetId([
                'name' => $souscr_name,
                'phone_number' => $souscr_phone,
                'password' => bcrypt($password),
                'status' => 0,
                'remember_token' => Str::random(60),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ]);
        } else {
            $space_account = DB::table("espace_perso_account")->where("phone_number", $souscr_phone)->first();
            return $space_account->id;
        }
    }

    public function ShowListQuotationPage()
    {
      $prospects = DB::select('SELECT number_n,policy_number,priority, firstname,lastname, contact, email, usertype, product_type,product_id,assurance_infos_id, quotation.status, quotation.id as qid, quotation.created_at as date_created FROM quotation,users WHERE users.id=user_id and quotation.status>=1 and quotation.status<=4 and users.usertype<>99 order by qid desc, priority asc');

      $prospects_users = User::where([
          ['usertype','=',0],
          ['status','<>', '-1']
        ])->get();

      $prospects_users = Quotation::join('users','users.id','quotation.user_id')->select("users.*","quotation.status as status_quote",DB::Raw("count(quotation.id) as nb_devis"))->where('quotation.status','<',5)->whereAnd('users.status','<>',-1)->groupBy('users.id')->orderBy("id","desc")->get();

      return view('Backoffice/backend/prospection/list-devis', compact('prospects','prospects_users'))->with(['isActive'=> 'prospectmanager']);
    }
    private function checkIfPersoSpaceExist($phone)
    {
        $p = str_replace(" ", "", $phone);
        return DB::table("espace_perso_account")->where("phone_number", $p)->exists();
    }

    private function storeWhoMadeQuote($quote_id, $space_account_id)
    {
        DB::table("made_quote")->insert([
            "quote_id" => $quote_id,
            "account_id" => $space_account_id,
            "created_at" => Carbon::now(),
            "updated_at" => Carbon::now()
        ]);
    }

    public function upload(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'quotation_id' => 'required|exists:quotation,id',
            'file' => 'required|mimes:pdf,jpg,png|max:2048',
        ]);

        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $fileName = time() . '.' . $file->getClientOriginalExtension();
            $filePath = $file->move(public_path('attestations'), $fileName);

            $existingAttestation = Attestation::where('quotation_id', $request->quotation_id)->first();
            if ($existingAttestation) {
                return redirect()->back()->with('error', 'Une attestation existe déjà pour ce devis.');
            }

            Attestation::create([
                'user_id' => $request->user_id,
                'quotation_id' => $request->quotation_id,
                'file_path' => $fileName,
            ]);

            $quotation = Quotation::find($request->quotation_id);
            if ($quotation) {
                $quotation->status = 5;
                $quotation->save();
            }

            return redirect()->back()->with('success', 'Attestation téléversée avec succès.');
        }

        return redirect()->back()->with('error', 'Le fichier est requis.');
    }
}
