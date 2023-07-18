<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Carbon;

class PostNotification extends Notification implements ShouldQueue
{
    use Queueable;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toDatabase()
    {
        return [
            'id' => 1,
            'title' => 'Title Is Here',
            'date' => Carbon::now(),
        ];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    // ->replyTo('ahmedabdelrhim92@gmail.com')
                    ->line('Something went wrong while user adding a new post')
                    // ->action('update your data from here', url('http://127.0.0.1:1010/update/your/data'))
                    ->line('School management system team');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }

    public function routeNotificationForMail(Notification $notification): string
    {
        // Return email address only...
        return 'ahmedabdelrhim92@gmail.com';

    }
}
