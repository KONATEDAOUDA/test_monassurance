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
        Schema::create('auto_companyquotation', function (Blueprint $table) {
            $table->id();
            $table->integer('type_assurance');
            $table->integer('companyid');
            $table->text('formules');
            $table->text('files');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('auto_companyquotation');
    }
};
