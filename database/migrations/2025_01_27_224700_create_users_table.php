<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('firstname',100);
            $table->string('lastname',100);
            $table->char('gender',2)->nullable();
            $table->date('dob')->nullable();
            $table->string('contact',50)->nullable();
            $table->integer('job_id');
            $table->date('date_pc')->nullable();
            $table->string('email')->unique();
            $table->string('password');
            $table->string('avatar')->default("default.png");
            $table->integer('status');
            $table->integer('usertype');
            $table->string('remember_token');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
