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
        Schema::create('auto_guarantee', function (Blueprint $table) {
            $table->id();
            $table->string('codeguar');
            $table->string('titleguar');
            $table->text('description');
            $table->integer('isdeprecated');
            $table->integer('type_assurance');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('auto_auto_guarantee');
    }
};
