<?php
namespace App\Models\Scopes;

use App\Models\User;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Spatie\Sluggable\SlugOptions;

trait PostScope {
    public function owner(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id','id');
    }

    /**
     * Get the options for generating the slug.
     */


    public function getRouteKeyName(): string
    {
        return 'slug';
    }
    public function scopeUser(Builder $builder): Builder
    {
        return $builder->join('users', 'users.id','=' ,'posts.user_id')
            ->select('posts.*' ,'users.name as user_name' ,'users.email as user_email');
    }
}
