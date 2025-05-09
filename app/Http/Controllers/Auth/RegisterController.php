<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Session;


class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    public function showRegistrationForm()
    {
        return redirect('login');
    }

    public function register()
    {

    }

   


    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'firstname' => 'required|string|max:255',
            'lastname' => 'required|string|max:255',
            'phone' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return User
     */
    protected function create(array $data)
    {
        $uid = (Session::has('_userid_')) ? Session::get('_userid_') : null;
        if($uid==null){
            Session::flash('error', 'Oupsss Une erreur s\'est produite !');
            return redirect()->back();
        }
        $new_space = User::where('id',$uid)->update([
            'firstname' => $data['firstname'],
            'lastname' => $data['lastname'],
            'contact' => $data['phone'],
            'password' => bcrypt($data['password']),
            ]);

        Session::forget('_userid_');
        Session::forget('_firstname_');
        Session::forget('_lastname_');
        Session::forget('_email_');
        Session::forget('_contact_');
        return User::findOrFails() ;
    }
}
