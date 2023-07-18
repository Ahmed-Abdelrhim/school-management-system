<?php

namespace App\Providers;

use App\Models\Tag;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // Model::preventLazyLoading(! $this->app->isProduction() );
        View::composer('admin.body.header' , function($view) {
            $tags = Cache::rememberForever('tags' , function() {
                return Tag::query()->get();
            });
            return $view->with('tags', $tags);
        });
    }
}
