<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

require __DIR__ . '/auth.php';

//routes vue
Route::get('/', function () {
    return view('welcome');
});
Route::group(['middleware' => 'auth:sanctum'], function () {
    Route::get('admin', function () {
        return view('admin-app');
    });
    Route::get('admin/{any}', function () {
        return view('admin-app');
    });
});
