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
        Schema::create('car_type', function (Blueprint $table) {
            $table->id();
            $table->integer('id_type');
            $table->string('car_type_code');
            $table->string('car_type_desc');
            $table->integer('car_type_status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('car_type');
    }
};
