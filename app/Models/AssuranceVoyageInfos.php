<?php

namespace App\Models;

use App\Models\Backoffice\Pays;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AssuranceVoyageInfos extends Model
{
    protected $table = 'assurance_voyage_infos';

    protected $fillable = [
        'destination_country',
        'departure_date',
        'arrival_date',
        'nationality_id',
        'passport_num',
        'date_expire_passport',
        'current_addr',
        'destination_addr',
    ];

    public function pays()
    {
        return $this->belongsTo(Pays::class, 'pays_id', 'id');
    }
}
