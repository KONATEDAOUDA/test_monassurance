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
        Schema::create('auto_infos', function (Blueprint $table) {
            $table->id();
            $table->string('matriculation');
            $table->string('proprio_veh');
            $table->string('company_name');
            $table->string('manager_name');
            $table->string('name_cg');
            $table->unsignedBigInteger('make_id');
            $table->unsignedBigInteger('type_id');
            $table->string('power', 25);
            $table->char('energy', 2);
            $table->integer('charge_utile');
            $table->integer('cylindree');
            $table->integer('category');
            $table->date('firstrelease');
            $table->integer('placesnumber');
            $table->integer('parkingzone');

            $table->integer('color');
            $table->double('vneuve');
            $table->double('vvenale');
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('auto_infos');
    }
};
