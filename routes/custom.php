<?php
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => 'prevent-back-history'], function () {
    Route::get('/custom' , function () {
        return 'Custom Route Is Working';
    });
});
