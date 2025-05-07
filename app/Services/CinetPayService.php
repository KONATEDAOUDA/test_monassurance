<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class CinetPayService
{
    protected $apiKey;
    protected $siteId;
    protected $baseUrl;

    public function __construct()
    {
        $this->apiKey = env('CINETPAY_API_KEY');
        $this->siteId = env('CINETPAY_SITE_ID');
        $this->baseUrl = 'https://api-checkout.cinetpay.com/v1/payment';
    }

    public function initiatePayment($amount, $reference, $description, $returnUrl, $notifyUrl)
    {
        $endpoint = $this->baseUrl . '/v1/payment';
        $response = Http::post($endpoint, [
            'apikey' => $this->apiKey,
            'site_id' => $this->siteId,
            'transaction_id' => $reference,
            'amount' => $amount,
            'currency' => 'XOF',
            'description' => $description,
            'return_url' => $returnUrl,
            'notify_url' => $notifyUrl,
        ]);

        if ($response->successful()) {
            return $response->json();
        }

        throw new \Exception('Erreur lors de l\'initiation du paiement');
    }

    public function checkPaymentStatus($reference)
    {
        $endpoint = $this->baseUrl . '/v1/payment/check';
        $response = Http::post($endpoint, [
            'apikey' => $this->apiKey,
            'site_id' => $this->siteId,
            'transaction_id' => $reference,
        ]);

        if ($response->successful()) {
            return $response->json();
        }

        throw new \Exception('Erreur lors de la vérification du statut du paiement');
    }
}
