<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AutoCategories extends Model
{
    protected $table = 'auto_categories';
    public $timestamps = false;

    protected $fillable = [
        'categorie', 'genre', 'usage', 'qualite_proprietaire', 'enabled'
    ];
}
