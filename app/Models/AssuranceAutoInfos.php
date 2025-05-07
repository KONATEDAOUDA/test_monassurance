<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AssuranceAutoInfos extends Model
{
      protected $table = 'assurance_auto_infos';
      public $timestamps = false;

      protected $fillable = ['guarantee', 'datepriseeffet', 'periode', 'subscription_type'];

      public function periode()
      {
          return $this->belongsTo(Periode::class, 'periode_id', 'id');
      }

      public function quotation()
      {
          return $this->hasOne(Quotation::class, 'assurance_infos_id');
      }

}
