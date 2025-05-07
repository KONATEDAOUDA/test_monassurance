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
        Schema::create('auto_categories', function (Blueprint $table) {
            $table->id();
            $table->string('categorie');
            $table->string('genre');
            $table->string('usage');
            $table->string('qualite_proprietaire');
            $table->text('longdesc');
            $table->string('shortdesc');
            $table->boolean('enabled');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('auto_categories');
    }
};
