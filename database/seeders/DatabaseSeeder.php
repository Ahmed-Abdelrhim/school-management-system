<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(40)->create();
        // \App\Models\Designation::factory(7)->create();
        // $this->call(LoginSeeder::class);


        \App\Models\Video::factory(50)->create();

    }
}
