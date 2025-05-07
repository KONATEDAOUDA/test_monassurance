<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::table('auto_infos', function (Blueprint $table) {
        $table->string('manager_name')->nullable()->change();
        // Ajoutici tous les autres champs qui pourraient poser problème
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('auto_infos', function (Blueprint $table) {
            //
        });
    }
};
