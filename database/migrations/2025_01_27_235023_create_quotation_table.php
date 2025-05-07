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
        Schema::create('quotation', function (Blueprint $table) {
            $table->id();
            $table->integer('product_id');
            $table->integer('assurance_infos_id');
            $table->integer('user_id');
            $table->integer('status');
            $table->integer('is_payed');
            $table->integer('product_type');
            $table->string('number_n');
            $table->string('policy_number');
            $table->integer('priority');
            $table->integer('company_id');
            $table->string('service_opt');
            $table->text('delivery_location')->nullable();
            $table->float('inbox_amount')->default(0);
            $table->string('phone_client')->nullable();
            $table->integer('view');
            $table->text('collect_data');
            $table->integer('renew_order');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('quotation');
    }
};
