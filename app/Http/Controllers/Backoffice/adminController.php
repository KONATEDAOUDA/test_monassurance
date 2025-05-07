<?php

namespace App\Http\Controllers\Backoffice;

use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\ProductContract;
use App\Models\Backoffice\Quotation;
use App\Models\Backoffice\AutoCompany;
use App\Models\Backoffice\Sinistre;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use App\Models\CallmeLog;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
class AdminController extends Controller
{
    public function showDashboard()
    {
        $currentUser= User::all();
        if (Auth::check()){
            $confirm_1 = sizeof(newDevis());
            $processiong_2 = waitingTraitement()->count();
            $complete_5 = completedOrder()->count();
            $cancel_6 = canceledOrder()->count();

            return view('Backoffice.backend.dashboard', compact(
                'confirm_1',
                'processiong_2',
                'currentUser',
                'complete_5',
                'cancel_6',
            ));
        }
        else{
            return view('Backoffice.auth.index');
        }
    }





    public function getOnlineUsers()
    {
        // Récupérer tous les utilisateurs
        $users = User::all();

        // Filtrer pour trouver ceux qui sont en ligne
        $onlineUsers = $users->filter(function ($user) {
            return Cache::has('user-is-online-' . $user->id);
        });

        return $onlineUsers;
    }


    public function deliveryManStats($start = null, $end = null)
    {
        $query = DB::table('delivery_tour')
            ->join('users', 'users.id', '=', 'delivery_tour.deliveryman_id')
            ->select('users.firstname', 'users.lastname', 'deliveryman_id', DB::raw('COUNT(delivery_tour.deliveryman_id) as nb'));

        if ($start && $end) {
            $query->whereBetween("delivery_tour.created_at", [$start, $end]);
        }

        return $query->groupBy('deliveryman_id')->get();
    }


    private function lastFiveOrders($start = null, $end = null)
    {
        $query = Quotation::query();

        if ($start && $end) {
            $query->whereBetween('created_at', [$start, $end]);
        }

        return $query->orderBy('created_at', 'desc')->take(5)->get();
    }




    private function getAllProductContractsCount($start = null, $end = null)
    {
        $query = AutoCompany::query();

        if ($start && $end) {
            $query->whereBetween('created_at', [$start, $end]);
        }

        return $query->count();
    }


    private function getSaleByCompany($start = null, $end = null)
    {
        $query = DB::table('auto_company')
            ->selectRaw('auto_company.compname as compname, COUNT(quotation.id) as sales')
            ->join('quotation', 'quotation.company_id', '=', 'auto_company.id')
            ->groupBy('auto_company.compname');

        if ($start && $end) {
            $query->whereBetween('quotation.created_at', [$start, $end]);
        }


        return $query->get();
    }


}
