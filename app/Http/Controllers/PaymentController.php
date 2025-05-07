<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Quotation;
use App\Models\Payment;
use Illuminate\Support\Facades\Auth;
use App\Services\CinetPayService;

class PaymentController extends Controller
{

    public function initiatePayment(Request $request, CinetPayService $cinetPay)
    {
        $quoteId = $request->input('quote_id');
        $quotation = Quotation::where('id', $quoteId)
            ->where('is_payed', 0)
            ->firstOrFail();

        $reference = 'PAY-' . strtoupper(uniqid());
        $amount = $quotation->inbox_amount;
        $description = "Paiement pour le devis #{$quotation->number_n}";
        $returnUrl = route('payment.complete', ['reference' => $reference]);
        $notifyUrl = route('payment.notify');

        // Crée l'entrée dans la table `payment`
        $payment = Payment::create([
            'montant' => $amount,
            'reference' => $reference,
            'user_id' => Auth::guard('space_perso')->id(),
            'quote_id' => $quotation->id,
            'status' => 'pending',
        ]);

        // Appel à l'API CinetPay
        $response = $cinetPay->initiatePayment($amount, $reference, $description, $returnUrl, $notifyUrl);

        // Redirige l'utilisateur vers l'URL de paiement
        return redirect()->away($response['payment_url']);
    }

    public function completePayment(Request $request, CinetPayService $cinetPay)
    {
        $reference = $request->get('reference');

        // Vérifier le statut auprès de CinetPay
        $statusResponse = $cinetPay->checkPaymentStatus($reference);
        $status = $statusResponse['status'] ?? 'failed';

        $payment = Payment::where('reference', $reference)->firstOrFail();

        if ($status === 'completed') {
            $payment->update(['status' => 'completed']);
            $payment->quotation->update(['is_payed' => 1]);

            return redirect()->route('page.myspace')->with('success', 'Paiement effectué avec succès !');
        } else {
            $payment->update(['status' => 'failed']);
            return redirect()->route('page.myspace')->with('error', 'Le paiement a échoué.');
        }
    }

    public function notify(Request $request)
    {
        $reference = $request->get('transaction_id');
        $status = $request->get('status'); // Statut envoyé par CinetPay

        $payment = Payment::where('reference', $reference)->first();

        if ($payment && $status === 'completed') {
            $payment->update(['status' => 'completed']);
            $payment->quotation->update(['is_payed' => 1]);
        } elseif ($payment) {
            $payment->update(['status' => 'failed']);
        }

        return response()->json(['message' => 'Notification traitée avec succès']);
    }

}
