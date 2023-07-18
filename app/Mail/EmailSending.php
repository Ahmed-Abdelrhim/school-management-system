<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Address;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class EmailSending extends Mailable
{
    use Queueable, SerializesModels;

    public string $name;

    public function __construct($name)
    {
        $this->name =  $name;
    }


    public function envelope()
    {
        return new Envelope(
            from : new Address('aabdelrhim974@gmail.com' ,'Ahmed Abdelrhim'),
            subject: 'School Management System',
        );
    }

    public function content()
    {
        return new Content(
            view: 'backend.email.play',
            with: [
                'name' => $this->name,
            ],
        );
    }

    public function attachments()
    {
        return [];
    }
}
