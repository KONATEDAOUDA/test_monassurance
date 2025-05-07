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
        Schema::create('revive_client_quotation', function (Blueprint $table) {
            $table->id();
            $table->integer('quotation_id');
            $table->integer('revive_by_mail');
            $table->integer('revive_by_sms');
            $table->integer('revive_by_dashboard_alert');
            $table->integer('admin_id');
            $table->text('advisor_note');
            $table->date('revive_date');
            $table->integer('revive_status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('revive_client_quotation');
    }
};
