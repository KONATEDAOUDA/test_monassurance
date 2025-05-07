<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CarType extends Model
{
    use HasFactory;
    protected $primaryKey = 'id_type'; // Spécifie la clé primaire
    protected $table = 'car_type'; // Spécifie le nom de la table

    protected $fillable = [
        'car_type_code', 'car_type_desc', 'car_type_status'
    ];
}
