<?php

use App\Http\Controllers\Api\RedisController;
use App\Http\Controllers\Api\TasksController;
use App\Http\Controllers\BackEnd\PlayController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Public Routes···
Route::post('login',[TasksController::class,'login']);
Route::post('register',[TasksController::class,'register']);



// Protected Routes···
Route::group(['middleware' => 'auth:sanctum'] , function() {
    Route::get('posts',[TasksController::class,'index']);
    Route::post('post/comment/{post}',[TasksController::class,'store']);
    Route::post('post/show/{post}',[TasksController::class,'show']);
    Route::post('post/update/{post}',[TasksController::class,'update']);
    Route::post('logout',[TasksController::class,'logout']);
});





Route::get('get/users', [PlayController::class, 'getUsersForApi']);
Route::post('create/users', [PlayController::class, 'createUserForApi']);
Route::get('get/posts', [PlayController::class, 'resource']);

//RedisController···
Route::controller(RedisController::class)->group(function () {
    Route::get('redis', 'index');
    Route::get('get/post/{id}', 'post');
});

// Software Template
// https://themeforest.net/item/notech-it-solutions-services-drupal-theme/42598838 45$

// Preview
// https://previewthemes.com/notech/

// Design Patterns·······
// 1) Builder Pattern
// 2) Factory Pattern
// 3) Strategy Pattern
// 4) Provider Pattern
// 5) Repository Pattern
// 6) Facade Pattern


// downloaded => 2,3 then 7,8
// many to many polymorphic
