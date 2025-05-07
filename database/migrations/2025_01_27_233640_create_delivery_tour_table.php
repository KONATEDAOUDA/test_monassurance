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
        Schema::create('delivery_tour', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('tour_number');
            $table->date('tour_start_date');
            $table->integer('deliveryman_id');
            $table->integer('delivery_tour_status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('delivery_tour');
    }
};
