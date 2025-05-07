<?php

namespace App\Http\Controllers\Backoffice;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Backoffice\Payment;
class PaymentsController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'quotation_id' => 'required|exists:quotation,id',
            'amount' => 'required|numeric|min:0.01',
        ]);

        Payment::create([
            'quotation_id' => $request->quotation_id,
            'amount' => $request->amount,
        ]);

        return redirect()->back()->with('success', 'Paiement enregistré avec succès.');
    }
}
