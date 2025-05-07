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
        Schema::create('callme_log', function (Blueprint $table) {
            $table->id();
            $table->integer('call_id');
            $table->string('call_name');
            $table->string('call_phone');
            $table->integer('call_motif');
            $table->integer('advisor_conclusion');
            $table->text('reason')->nullable();
            $table->date('date_relance')->nullable();;
            $table->integer('advisor_user_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('callme_log');
    }
};
