<?php

namespace App\Jobs;

use App\Mail\EmailSending;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class BackGroundJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $name = 'Ahmed Abdelrhim';
        $to = 'ahmedabdelrhim92@gmail.com';
        $mail = Mail::to($to)->send(new EmailSending($name));
    }

    public function failed(\Throwable $e)
    {
        session()->flash('Something went wrong while sending sms and mail');
    }
}
