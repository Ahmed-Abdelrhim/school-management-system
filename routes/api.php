<?php

use App\Http\Controllers\Api\TasksController;
use Illuminate\Support\Facades\Route;

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
