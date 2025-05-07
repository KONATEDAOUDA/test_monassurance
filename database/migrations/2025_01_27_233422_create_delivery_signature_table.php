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
        Schema::create('delivery_signature', function (Blueprint $table) {
            $table->id();
            $table->integer('id_sign');
            $table->integer('id_deliveryman');
            $table->integer('id_financial');
            $table->integer('id_operation');
            $table->integer('id_tour');
            $table->double('amount_inbox');
            $table->integer('sign_status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('delivery_signature');
    }
};
