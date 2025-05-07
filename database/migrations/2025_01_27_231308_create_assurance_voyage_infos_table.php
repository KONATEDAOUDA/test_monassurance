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
        Schema::create('assurance_voyage_infos', function (Blueprint $table) {
            $table->id();
            $table->integer('destination_country');
            $table->string('current_addr');
            $table->string('destination_addr');
            $table->date('departure_date');
            $table->date('arrival_date');
            $table->integer('nationality_id');
            $table->string('passport_num');
            $table->date('date_expire_passport');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('assurance_voyage_infos');
    }
};
