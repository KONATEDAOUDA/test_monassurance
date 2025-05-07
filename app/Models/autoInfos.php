<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class autoInfos extends Model
{
  protected $table = 'auto_infos';

    public function make()
    {
        return $this->belongsTo(Make::class, 'make_id');
    }

    public function autoCategory()
    {
        return $this->belongsTo(autoCategories::class, 'category_id');
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
        return $this->belongsTo(autoCategories::class, 'category_id'); // 'category_id' est la clé étrangère dans la table "auto_infos"
    }
}
