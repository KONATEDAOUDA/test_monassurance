<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        // Insérer l'utilisateur
        $userId = DB::table('users')->insertGetId([
            'firstname' => 'Aroli',
            'lastname' => 'Aroli',
            'gender' => 'M',
            'dob' => '2024-05-27',
            'contact' => '0700000000',
            'job_id' => 14,
            'date_pc' => '2024-09-27',
            'email' => 'aroli@gmail.com',
            'password' => Hash::make('123456789'),
            'avatar' => 'default.png',
            'status' => 1,
            'usertype' => 99,
            'remember_token' => null,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

            // Tableau des rôles à assigner
        $roles = [1, 2, 3, 4, 5, 6, 9, 10];

        // Préparer les données pour l'insertion
        $data = [];
        foreach ($roles as $role) {
            $data[] = [
                'user_id' => $userId,
                'role_id' => $role,
            ];
        }

        // Insérer les données dans la table role_users
        DB::table('role_user')->insert($data);
    }
}
