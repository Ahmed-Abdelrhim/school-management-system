<?php

use App\Http\Controllers\Api\LastLoginController;
use Illuminate\Support\Facades\Route;
use Post\Http\Controllers\BackEnd\PostController;
use Post\Http\Controllers\BackEnd\PaymentController;
use Post\Http\Controllers\FrontEnd\FrontendController;


Route::group(['middleware' => 'prevent-back-history'], function () {
    Route::namespace('Post\Http\Controllers')->group(function () { // ->middleware([''])
        //Posts···
        Route::get('back', [PostController::class, 'index']);
        Route::get('get/posts/datatables', [PostController::class, 'getPosts'])->name('posts.dataTables');

        //Payment···
        Route::get('pay/view', [PaymentController::class, 'index'])->name('pay.view');
        Route::get('pay', [PaymentController::class, 'pay'])->name('pay');

        //Redis···
        Route::get('redis/connection', [PostController::class, 'savePostsToRedis']);
        Route::get('query', [PostController::class, 'queryTest']);

        //FrontEnd···
        Route::get('frontend', [FrontendController::class, 'index']);

        // ngrock http 8090

        //LastLoginController···
        Route::get('users/last/login/times', [LastLoginController::class, 'homePage']);
        Route::get('last/login', [LastLoginController::class, 'index'])->name('data.sub');
        Route::get('seed', [LastLoginController::class, 'customSeed']);
        // redis installed
    });
});  // Prevent Back Middleware···

