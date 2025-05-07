<?php

namespace App\Models;

use App\Models\Backoffice\OrderStatusActor;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Facades\DB;

class Quotation extends Model
{
    protected $table = 'quotation';

    public static function get_unique_number()
    {
        // Requête pour obtenir la dernière entrée du jour
        $today_quote_last = static::whereDate('created_at', DB::raw('CURDATE()'))->orderBy('id', 'desc')->first();

        // Vérifiez si $today_quote_last existe
        if ($today_quote_last) {
            // Si un enregistrement est trouvé, extrayez le numéro unique et ajoutez 1
            $today_quote_nb = intval(substr($today_quote_last->number_n, 13)) + 1;
        } else {
            // Si aucun enregistrement n'est trouvé, démarrez à 1
            $today_quote_nb = 1;
        }

        // Générer le suffixe, la date et le numéro unique
        $chiffre = str_pad($today_quote_nb, 4, '0', STR_PAD_LEFT);
        $_SUFFIX = "ARO";
        $today = date("dmY");
        $number = $_SUFFIX . "/" . $today . "/" . $chiffre;

        // Vérifier si ce numéro est déjà utilisé
        $nb = static::where('number_n', $number)->count();

        // Si le numéro existe déjà, refaire l'appel récursivement
        if ($nb > 0) {
            return static::get_unique_number();
        }

        // Retourner le numéro unique en majuscules
        return strtoupper($number);
    }

    public function orderStatusActors()
    {
        return $this->hasMany(OrderStatusActor::class, 'order_id', 'id');
    }

    public function assuranceVoyageInfo()
    {
        return $this->belongsTo(AssuranceVoyageInfos::class, 'assurance_infos_id', 'id');
    }

    /**
     * Relation avec AssuranceAutoInfos
     */
    public function assuranceAutoInfos()
    {
        return $this->belongsTo(AssuranceAutoInfos::class, 'assurance_infos_id', 'id');
    }

    public function assuranceInfos()
    {
        return $this->belongsTo(AssuranceAutoInfos::class, 'assurance_infos_id');
    }

    public function payment()
    {
        return $this->hasOne(Payment::class, 'quote_id');
    }


    public function assuranceAutoInfo()
    {
        return $this->belongsTo(AssuranceAutoInfos::class, 'assurance_infos_id');
    }
    public function autoInfo()
    {
        return $this->belongsTo(AutoInfos::class, 'product_id'); // 'product_id' est la clé étrangère
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function job()
    {
        return $this->belongsTo(Job::class, 'job_id');
    }

    public function city()
    {
        return $this->belongsTo(City::class, 'city_id');
    }

    protected $fillable = [
        'product_id',
        'assurance_infos_id',
        'user_id',
        'status',
        'product_type',
        'number_n',
        'company_id',
        'phone_client',
        'delivery_location',
        'service_opt',
    ];
}
