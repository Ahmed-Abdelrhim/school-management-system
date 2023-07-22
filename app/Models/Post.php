<?php

namespace App\Models;

use App\Models\Scopes\PostScope;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Prunable;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\SoftDeletes;

use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use PhpParser\Node\Expr\FuncCall;
use App\Models\Comment;
class Post extends Model
{
    use  HasSlug, Prunable, SoftDeletes, PostScope;

    protected $table = 'posts';
    protected $fillable = ['user_id', 'title', 'slug', 'excerpt', 'description', 'min_to_read', 'is_published', 'created_at', 'updated_at'];
    protected $casts = [
        'user_id' => 'integer',
        'is_published' => 'boolean',
        'min_to_read' => 'integer',
    ];
    protected $hidden = ['pivot'];

    public function prunable(): Builder
    {
        return static::query()->where('deleted_at', '<=', now()->subMinute());
    }

    public function tags(): BelongsToMany
    {
        return $this->belongsToMany(Tag::class, 'post_tag', 'post_id', 'tag_id');
    }

    public function getSlugOptions(): SlugOptions
    {
        return SlugOptions::create()
            ->generateSlugsFrom('title')
            ->saveSlugsTo('slug')
            ->doNotGenerateSlugsOnUpdate();
    }

    public function getNetworksAttribute($query)
    {
        return $this->tags->isNotEmpty();
    }

    public function comments(): MorphMany
    {
        return $this->morphMany(Comment::class,'commentable');
    }

}
