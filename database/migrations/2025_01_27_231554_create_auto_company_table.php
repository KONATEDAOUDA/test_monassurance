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
        Schema::create('auto_company', function (Blueprint $table) {
            $table->id();
            $table->string('compname',100);
            $table->text('compdesc');
            $table->text('complocation');
            $table->string('compphone',100);
            $table->string('complogo',255);
            $table->longText('baseguar');
            $table->longText('tsimple');
            $table->longText('tcomplet');
            $table->longText('tcol');
            $table->longText('toutrisque',);
            $table->longText('accessory_free');
            $table->longText('road_safety_guarantee');
            $table->longText('company_discount');
            $table->longText('bns_custom');
            $table->longText('com_custom');
            $table->longText('fractionnement_guar');
            $table->integer('enabled');
            $table->integer('has_foresight');
            $table->integer('has_home');
            $table->boolean('has_travel')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('auto_company');
    }
};
