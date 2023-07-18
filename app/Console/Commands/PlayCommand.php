<?php

namespace App\Console\Commands;

use App\Models\Post;
use App\Models\Tag;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;
use Faker\Factory as Faker;

class PlayCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'play:cron';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Just Playing With Laravel Commands and Cron Jobs';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        info('Log From Schedule');
    }
}
