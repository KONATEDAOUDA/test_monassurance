<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MadeQuot extends Model
{
    protected $table = 'made_quote'; 

    protected $fillable = ['ccount_id', 'quote_id'];
}
