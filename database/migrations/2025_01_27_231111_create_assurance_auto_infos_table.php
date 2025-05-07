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
        Schema::create('assurance_auto_infos', function (Blueprint $table) {
            $table->id();
            $table->string('guarante');
            $table->date('releasedate');
            $table->integer('periode');
            $table->string('subscription_type');
            $table->integer('reduction_commerciale');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('assurance_auto_infos');
    }
};
