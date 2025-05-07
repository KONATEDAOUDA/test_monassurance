<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AutoInfos extends Model
{
  protected $table = 'auto_infos';

  protected $fillable = [
        'matriculation',
        'proprio_veh',
        'company_name', // Champ problématique
        'manager_name',
        'name_cg',
        'make_id',
        'type_id',
        'category',
        'power',
        'charge_utile',
        'energy',
        'firstrelease',
        'vneuve',
        'vvenale',
        'color',
        'placesnumber',
        'parkingzone',
        // Ajoutez tous les autres champs modifiables
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
        return $this->belongsTo(City::class, 'city_id');
    }

    public function quotation()
    {
        return $this->hasMany(Quotation::class, 'product_id');
    }

    // Relation avec la table "auto_categories"
    public function category()
    {
        return $this->belongsTo(AutoCategories::class, 'category_id'); // 'category_id' est la clé étrangère dans la table "auto_infos"
    }

    public function carType()
    {
        return $this->belongsTo(CarType::class, 'type_id', 'id_type');
    }
}
