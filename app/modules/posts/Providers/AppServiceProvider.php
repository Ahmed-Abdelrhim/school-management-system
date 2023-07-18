<?php
namespace Post\Providers;

use App\Models\Tag;
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
        $ds = DIRECTORY_SEPARATOR;
        $this->loadRoutesFrom(__DIR__.$ds .'..'.$ds.'routes'.$ds.'web.php');
        $this->loadRoutesFrom(__DIR__.$ds .'..'.$ds.'routes'.$ds.'api.php');

        $this->loadMigrationsFrom(__DIR__.$ds .'..'.$ds.'database'.$ds.'migrations');
        $this->loadViewsFrom(__DIR__.$ds .'..'.$ds.'resources'.$ds.'views' ,'posts');
    }
}
