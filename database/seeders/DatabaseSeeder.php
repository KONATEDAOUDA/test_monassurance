<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call(UsersTableSeeder::class);
    }
}

class UsersTableSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        
        
        DB::table('roles')->insert([
            ['id' => 1, 'name' => 'admin', 'display_name' => 'Super Admin', 'description' => NULL, 'created_at' => '2017-05-08 14:44:01', 'updated_at' => '2017-05-08 14:44:01', 'guard_name' => ''],
            ['id' => 2, 'name' => 'advisor', 'display_name' => 'Customer advisor', 'description' => NULL, 'created_at' => '2017-05-08 14:44:01', 'updated_at' => '2017-05-08 14:44:01', 'guard_name' => ''],
            ['id' => 3, 'name' => 'financial', 'display_name' => 'Financial manager', 'description' => NULL, 'created_at' => '2017-05-08 14:46:59', 'updated_at' => '2017-05-08 14:46:59', 'guard_name' => ''],
            ['id' => 4, 'name' => 'operation', 'display_name' => 'Operation Manager', 'description' => NULL, 'created_at' => '2017-05-08 14:46:59', 'updated_at' => '2017-05-08 14:46:59', 'guard_name' => ''],
            ['id' => 5, 'name' => 'deliveryman', 'display_name' => 'Deliveryman', 'description' => NULL, 'created_at' => '2017-05-08 14:46:59', 'updated_at' => '2017-05-08 14:46:59', 'guard_name' => ''],
            ['id' => 6, 'name' => 'claimsmanager', 'display_name' => 'Gestionnaire de sinistre', 'description' => NULL, 'created_at' => '2017-10-05 07:08:35', 'updated_at' => '2017-10-05 07:08:35', 'guard_name' => ''],
            ['id' => 9, 'name' => 'usermanager', 'display_name' => 'User manager', 'description' => NULL, 'created_at' => '2017-11-20 09:41:10', 'updated_at' => '2017-11-20 09:41:10', 'guard_name' => ''],
            ['id' => 10, 'name' => 'settingsmanager', 'display_name' => 'Setting Manager', 'description' => NULL, 'created_at' => '2017-11-20 09:41:10', 'updated_at' => '2017-11-20 09:41:10', 'guard_name' => ''],
        ]);

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
            'remember_token' => Str::random(60), // Générer un token
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

        // Insérer les données dans la table role_user
        DB::table('role_user')->insert($data);
    }
}
