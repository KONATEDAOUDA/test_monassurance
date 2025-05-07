<?php

namespace App\Models\Backoffice;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Make;
use App\Models\Backoffice\AssuranceAutoInfos;
class AutoInfos extends Model
{
    use HasFactory;
    protected $table = 'auto_infos';
    protected $fillable = [
        'matriculation',
        'proprio_veh',
        'company_name',
        'manager_name',
        'name_cg',
        'make_id',
        'type_id',
        'power',
        'energy',
        'charge_utile',
        'cylindree',
        'category',
        'firstrelease',
        'placesnumber',
        'parkingzone',
        'color',
        'vneuve',
        'vvenale',
    ];
    

    public function make()
    {
        return $this->belongsTo(Make::class, 'make_id');
    }

    public function autoCategory()
    {
        return $this->belongsTo(AutoCategories::class, 'category_id');
    }

    public function city()
    {
        return $this->belongsTo(City::class, 'parkingzone');
    }

    public function assuranceAutoInfo()
    {
        return $this->belongsTo(AssuranceAutoInfos::class, 'assurance_infos_id'); 
    }

    public function carType()
    {
        return $this->belongsTo(CarType::class, 'type_id', 'id_type');
    }
}
