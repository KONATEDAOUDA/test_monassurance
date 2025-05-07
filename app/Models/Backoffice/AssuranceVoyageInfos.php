<?php

namespace App\Models\Backoffice;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Backoffice\Pays;

class AssuranceVoyageInfos extends Model
{
    use HasFactory;
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
