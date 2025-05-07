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
        Schema::create('sending_notification', function (Blueprint $table) {
            $table->id();
            $table->string('type_notif');
            $table->integer('from_user');
            $table->integer('to_user');
            $table->string('head_notif');
            $table->text('body_notif');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sending_notification');
    }
};
