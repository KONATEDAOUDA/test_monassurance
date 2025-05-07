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
        Schema::create('sinistre', function (Blueprint $table) {
            $table->id();
            $table->integer('sin_id');
            $table->string('sin_number');
            $table->integer('sin_manager');
            $table->string('client_name');
            $table->string('client_phone');
            $table->string('client_policy_number');
            $table->date('date_sinistre');
            $table->text('client_declaration');
            $table->integer('sin_status');
            $table->integer('decision_sin');
            $table->text('observation');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sinistre');
    }
};
