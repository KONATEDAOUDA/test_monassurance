<?php

namespace App\Http\Controllers\Backoffice\Order;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Models\Backoffice\AutoInfos;
use App\Models\Backoffice\Quotation;
use App\Models\Backoffice\AssuranceAutoInfos;
use App\Models\Backoffice\AssuranceVoyageInfos;
use Carbon\Carbon;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use Illuminate\Support\Facades\Log;
class UpdateOrderInfosController extends Controller
{

  public function updateClient(Request $request)
  {
      // Récupération des données depuis la requête
      $id = $request->get('uid');
      $firstname = $request->get('first_name');
      $lastname = $request->get('last_name');
      $contact = $request->get('contact');
      $email = ($request->get('email') == "") ? time() . "@email.com" : $request->get('email');

      // Log des informations reçues
      Log::info('Données client reçues:', [
          'id' => $id,
          'firstname' => $firstname,
          'lastname' => $lastname,
          'contact' => $contact,
          'email' => $email,
          'job_id' => $request->get('job_id'),
          'date_pc' => $request->get('date_pc')
      ]);

      // Initialisation de la variable de réponse
      $response = 0;

      // Mise à jour des informations du client
      if ($request->get('job_id') && $request->get('date_pc')) {
          $job_id = $request->get('job_id');
          $date_pc = Carbon::createFromFormat("d/m/Y", $request->get('date_pc'))->toDateString();

          // Log de la date formatée
          Log::info('Date formatée pour date_pc:', ['date_pc' => $date_pc]);

          // Effectuer la mise à jour et log du résultat
          $response = User::where('id', $id)
              ->update([
                  'firstname' => $firstname,
                  'lastname' => $lastname,
                  'contact' => $contact,
                  'email' => $email,
                  'job_id' => $job_id,
                  'date_pc' => $date_pc
              ]);
      } else {
          // Mise à jour sans job_id et date_pc
          $response = User::where('id', $id)
              ->update([
                  'firstname' => $firstname,
                  'lastname' => $lastname,
                  'contact' => $contact,
                  'email' => $email
              ]);
      }

      // Log de la valeur de retour de la mise à jour
      Log::info('Nombre de lignes affectées par la mise à jour:', ['response' => $response]);

      // Mise à jour de la table "quotation"
      DB::table("quotation")->where("id", $request->get('qid'))->update(["collect_data" => null]);

      // Vérification du résultat et redirection
      if ($response > 0) {
          // return redirect()->route('client.afficher')->with('success', 'Les informations du client ont été mises à jour avec succès.');
          return redirect()->back()->with('success', 'Les informations du client ont été mises à jour avec succès.');
      } else {
          // return redirect()->route('client.afficher')->with('error', 'Aucune modification n\'a été apportée aux informations du client.');
          return redirect()->back()->with('error', 'Aucune modification n\'a été apportée aux informations du client.');
      }
  }


public function updateClientVoyage(Request $request)
{
      // Validation des données du formulaire
      $validatedData = $request->validate([
        'uid' => 'required|exists:quotation,id',
        'assur_voy_id' => 'required|exists:assurance_voyage_infos,id',
        'last_name' => 'required|string|max:255',
        'first_name' => 'required|string|max:255',
        'email' => 'required|email|max:255',
        'contact' => 'required|string|max:20',
        'gender' => 'nullable|in:H,F',
        'dob' => 'nullable|date_format:d/m/Y',
    ]);

    try {
        // Récupérer le prospect et ses informations
        $prospect = quotation::findOrFail($validatedData['uid']);
        $client = $prospect->user;

        // Mettre à jour les informations du client
        $client->lastname = $validatedData['last_name'];
        $client->firstname = $validatedData['first_name'];
        $client->email = $validatedData['email'];
        $client->contact = $validatedData['contact'];
        $client->gender = $validatedData['gender'] ?? $client->gender;
        if (!empty($validatedData['dob'])) {
            $client->dob = \Carbon\Carbon::createFromFormat('d/m/Y', $validatedData['dob'])->format('Y-m-d');
        }
        $client->save();

        // Mettre à jour les informations d'assurance voyage si nécessaire
        // $assuranceVoyage = $prospect->assuranceVoyageInfo;
        // $assuranceVoyage->destination_country = $validatedData['pays_zone'];
        // $assuranceVoyage->save();
        // dd($assuranceVoyage);
        return redirect()->back()->with('success', 'Informations du client mises à jour avec succès.');
    } catch (\Exception $e) {
        return redirect()->back()->with('error', 'Une erreur est survenue lors de la mise à jour.');
    }
}

  public function updateVehicule(Request $request)
  {
      // Log des données reçues
      Log::debug('Formulaire soumis', $request->all());

      // Validation des données
      $validated = $request->validate([
          'aid' => 'required|integer',
          'Immatriculation' => 'required|string|max:100',
          'marque' => 'required|integer',
          'puissance_fiscale' => 'nullable|integer|min:1|max:13',
          'energie' => 'required|string|in:E,D',
          'category' => 'required|integer',
          'genre' => 'required|integer',
          'cu' => 'nullable|integer|min:1|max:16',
          'cylindree' => 'nullable|integer|min:1|max:5',
          'firstrelease' => 'required|date_format:d/m/Y',
          'place' => 'required|integer|min:1',
          'valeur_neuve' => 'nullable|numeric|min:0',
          'valeur_venale' => 'required|numeric|min:0',
          'zone' => 'required|integer',
          'color' => 'nullable|integer',
      ]);


      $vehicule = AutoInfos::find($validated['aid']);
      if (!$vehicule) {
          Log::error('Véhicule introuvable avec l\'ID : ' . $validated['aid']);
          return redirect()->back()->with('error', 'Véhicule introuvable.');
      }

      try {

          $firstrelease = Carbon::createFromFormat('d/m/Y', $validated['firstrelease'])->toDateString();

          $vehicule->update([
              'matriculation' => $validated['Immatriculation'],
              'make_id' => $validated['marque'],
              'power' => $validated['puissance_fiscale'],
              'energy' => $validated['energie'],
              'category' => $validated['category'],
              'type_id' => $validated['genre'],
              'charge_utile' => $validated['cu'],
              'cylindree' => $validated['cylindree'],
              'firstrelease' => $firstrelease,
              'placesnumber' => $validated['place'],
              'parkingzone' => $validated['zone'],
              'vneuve' => $validated['valeur_neuve'],
              'vvenale' => $validated['valeur_venale'],
              'color' => $validated['color'],
              'updated_at' => now(),
          ]);

          Log::info('Mise à jour effectuée pour le véhicule ID : ' . $validated['aid']);

          DB::table('quotation')->where('id', $request->get('qid'))->update(['collect_data' => null]);

          return redirect()->back()->with('success', 'Véhicule mis à jour avec succès.');
      } catch (\Exception $e) {
          Log::error('Erreur lors de la mise à jour : ' . $e->getMessage());
          return redirect()->back()->with('error', 'Une erreur est survenue lors de la mise à jour.');
      }
  }




  public function updateGarantie(Request $request)
  {
      try {
          Log::info('Début de la mise à jour des garanties', ['request' => $request->all()]);

          // Validation stricte des données
          $validatedData = $request->validate([
              'formule_type' => 'required|string|in:F,G',
              'assurance_infos_id' => 'required|integer|exists:assurance_auto_infos,id',
              'releasedate' => 'nullable|date_format:d/m/Y',
              'periode' => 'nullable|integer',
              'qid' => 'required|integer|exists:quotation,id',
              'garantie' => 'nullable|array',
              'formule' => 'nullable|string',
          ]);

        //   dd($validatedData);

          // Extraction des données validées
          $type = $validatedData['formule_type'];
          $id = $validatedData['assurance_infos_id'];
          $my_guaranties = $request->get('garantie', []);
          $formule = $request->get('formule', null);

          // Formatage des garanties ou de la formule
          $guarante = $this->format_garantie($type, $my_guaranties, $formule);

          // Traitement de la date
          $releasedate = null;
          if ($request->has('releasedate')) {
              try {
                  $releasedate = Carbon::createFromFormat("d/m/Y", $request->get('releasedate'))->toDateString();
              } catch (\Exception $e) {
                  return redirect()->back()->with('error', 'Le format de la date est invalide. Assurez-vous qu\'il respecte le format jj/mm/aaaa.');
              }
          }

          $periode = $request->get('periode', null);

          // Mise à jour dans la base de données
          $response = AssuranceAutoInfos::where('id', $id)->update([
              'guarante' => $guarante,
              'releasedate' => $releasedate,
              'periode' => $periode,
              'subscription_type' => $type,
          ]);
        //   dd($type);

          // Mise à jour dans la table quotation
          if ($request->has('qid')) {
              DB::table('quotation')->where('id', $validatedData['qid'])->update(['collect_data' => null]);
          }

          // Retour avec un message de succès
          if ($response) {
              return redirect()->back()->with('success', 'Mise à jour réussie : les informations d\'assurance ont été mises à jour.');
          } else {
              return redirect()->back()->with('info', 'Aucune mise à jour n\'a été effectuée.');
          }
      } catch (\Exception $e) {
          Log::error('Erreur lors de la mise à jour des garanties : ' . $e->getMessage(), [
              'request' => $request->all(),
          ]);

          return redirect()->back()->with('error', 'Une erreur est survenue. Veuillez réessayer.');
      }
  }



  private function format_garantie($type, $my_guaranties, $formule)
  {
      // Log des données d'entrée
      Log::info('Début formatage garantie', [
          'type' => $type,
          'my_guaranties' => $my_guaranties,
          'formule' => $formule
      ]);

      // Cas où le type est "Formule"
      if ($type === 'F') {
          return $formule ?: ''; // Retourne la formule ou une chaîne vide si non définie
      }

      // Cas où le type est "Garantie" (tableau de garanties)
      if (is_array($my_guaranties) && !empty($my_guaranties)) {
          // Nettoyage des valeurs du tableau pour éviter des caractères non désirés
          $filteredGuaranties = array_map('trim', $my_guaranties);
          return '[' . implode(',', $filteredGuaranties) . ']';
      }

      // Retourne un tableau vide si aucune garantie n'est fournie
      return '[]';
  }




  public function updateService(Request $request)
  {
      // Log des données reçues
      Log::debug('Données reçues dans la requête : ', $request->all());

      $qid = $request->get('qid');
      $service = $request->get('service');
      Log::debug('ID Quotation : ' . $qid);
      Log::debug('Services reçus : ', $service);

      // Vérifiez le format du service
      $service = $this->format_service($service);
      Log::debug('Services formatés : ' . $service);

      // Effectuez la mise à jour
      $response = quotation::where('id', $qid)
          ->update([
              'service_opt' => $service,
          ]);

      Log::debug('Résultat de la mise à jour : ' . $response);

      // Réinitialisez les données dans la table
      DB::table("quotation")->where("id", $qid)->update(["collect_data" => null]);

      return redirect()->back();
  }


  public function updateTravel(Request $request)
  {
     // Validate incoming data
     $request->validate([
        'assur_voy_id' => 'required|exists:assurance_voyage_infos,id',
        'destination' => 'required|string',
        'date_departure' => 'required|date_format:d/m/Y',
        'date_arrival' => 'required|date_format:d/m/Y|after_or_equal:date_departure',
        'nationality' => 'required|exists:pays,pays_id',
        'num_passport' => 'required|string|max:50',
        'expire_passport' => 'required|date_format:d/m/Y',
        'current_addr' => 'nullable|string',
        'dest_addr' => 'required|string',
    ]);


    try {
        // Find the assurance record by ID
        $assurance = AssuranceVoyageInfos::findOrFail($request->assur_voy_id);
        // dd($assurance);
        // Update assurance information
        $assurance->update([
            'destination_country' => $request->destination,
            'departure_date' => \Carbon\Carbon::createFromFormat('d/m/Y', $request->date_departure)->format('Y-m-d'),
            'arrival_date' => \Carbon\Carbon::createFromFormat('d/m/Y', $request->date_arrival)->format('Y-m-d'),
            'nationality_id' => $request->nationality,
            'passport_num' => $request->num_passport,
            'date_expire_passport' => \Carbon\Carbon::createFromFormat('d/m/Y', $request->expire_passport)->format('Y-m-d'),
            'current_addr' => $request->current_addr,
            'destination_addr' => $request->dest_addr,
        ]);

        return redirect()->back()->with('success', 'Les informations d’assurance ont été mises à jour avec succès.');
    } catch (\Exception $e) {
        return redirect()->back()->with('error', 'Une erreur est survenue lors de la mise à jour des informations.');
    }
}


    private function format_service($services)
    {
      $nbre = count($services);
      $service = "[";
      $delimiter = ",";
      for($i=0;$i<$nbre;$i++)
      {
        if($i==$nbre-1)
        {
          $delimiter = "";
        }
      $service =$service.$services[$i].$delimiter;
      }
      $service =$service."]";
      return $service;
    }


    public function updateReduction(Request $request)
    {
      $reduction = $request->get('reduction');
      $id = $request->get('assur_auto_info_id');
      $response = AssuranceAutoInfos::where('id', $id)
          ->update(['reduction_commerciale' => $reduction]);

      DB::table("quotation")->where("id",$request->get('qid'))->update(["collect_data"=>null]);
      if($response)
      {
        return back()->withMessage('Reduction modifié avec succes');
      }
      else
      {
       return back()->withError('Mise à jour echoué');
      }
    }
}
