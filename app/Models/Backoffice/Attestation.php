<?php

namespace App\Models\Backoffice;

use Illuminate\Database\Eloquent\Model;

class Attestation extends Model
{
    protected $fillable = [
        'user_id',
        'quotation_id',
        'file_path',
    ];
}
