<?php

namespace App\Http\Controllers\Backoffice\Order;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Carbon\Carbon;
use App\Models\Backoffice\Quotation;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Log; 
use Illuminate\Support\Facades\DB;
class StatusOrderController extends Controller
{

    public function cancelCommande($qid)
    {
        try {
            Log::info("Tentative d'annulation de la commande avec ID : " . $qid);
    
            // Vérification de l'existence du devis
            $existingQuotation = Quotation::find($qid);
            if (!$existingQuotation) {
                Log::warning("Commande non trouvée avec ID : " . $qid);
                return redirect()->back()->with('error', 'Commande non trouvée.');
            }
    
            // Mise à jour du statut
            $existingQuotation->status = -1;
            $existingQuotation->company_id = 0;
            $existingQuotation->save();
            $existingQuotation->refresh(); // Recharge les attributs après sauvegarde
    // dd($existingQuotation);
            // Sauvegarde de l'historique ou autre action nécessaire
            $actorId = Auth::id();
            if (!$actorId) {
                Log::warning("Utilisateur non authentifié.");
                return redirect()->back()->with('error', 'Utilisateur non authentifié.');
            }
    
            DB::table('order_status_actor')->insert([
                'order_id' => $existingQuotation->id,
                'order_status' => $existingQuotation->status,
                'actor_id' => $actorId,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
    
            Log::info("Commande annulée avec succès.");
            return redirect()->back()->with('success', 'Commande annulée avec succès.');
        } catch (\Exception $e) {
            Log::error('Erreur lors de l\'annulation : ' . $e->getMessage(), [
                'line' => $e->getLine(),
                'file' => $e->getFile(),
                'trace' => $e->getTraceAsString(),
            ]);
            return redirect()->back()->with('error', 'Erreur interne! Contactez le support.');
        }
    }
    
    
    
     
    private function saveOrderStatusActor($quotation)
    {
        DB::table('order_status_actor')->insert([
            'order_id'=>$quotation->id,
            'order_status'=>$quotation->status,
            'actor_id'=>Auth::user()->id,
            'created_at'=>Carbon::now(),
            'updated_at'=>Carbon::now()
        ]);
    } 


}
