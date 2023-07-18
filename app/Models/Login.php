<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Testing\Fluent\Concerns\Has;

class Login extends Model
{
    use HasFactory;
    protected $fillable = ['ip','last_login_at','created_at','updated_at'];

    protected $casts = [
        'last_login_at' => 'datetime:d-M-Y  H:i:s',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class,'user_id','id');
    }
}
