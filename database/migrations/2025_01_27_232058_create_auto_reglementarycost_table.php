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
        Schema::create('auto_reglementarycost', function (Blueprint $table) {
            $table->id();
            $table->integer('placecost');
            $table->float('autotaux');
            $table->double('fga');
            $table->double('cedeao');
            $table->text('drecours');
            $table->text('ranticipe');
            $table->text('rcivile');
            $table->double('default_redcom');
            $table->text('bns_rate');
            $table->string('has_custom_bns');
            $table->double('fg_annuel');
            $table->double('fraisaroli');
            $table->integer('active_max_discount')->nullable();
            $table->integer('enable_circulaire');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('auto_reglementarycost');
    }
};
