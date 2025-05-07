<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $fillable = ['montant', 'reference', 'user_id', 'quote_id', 'status'];

    public function user()
    {
        return $this->belongsTo(EspacePersoAccount::class, 'user_id');
    }

    public function quotation()
    {
        return $this->belongsTo(Quotation::class, 'quote_id');
    }

}
