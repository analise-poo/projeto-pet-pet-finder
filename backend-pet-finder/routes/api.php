<?php

use App\Http\Controllers\API\LoginController;
use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\API\UsersController;
use App\Http\Controllers\API\PostsController;
use App\Models\User;
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
Route::post('register', [RegisterController::class, 'register'])->name('register');

Route::post('login', [LoginController::class, 'login'])->name('login');

Route::get('users/{user}/details', [UsersController::class, 'details']);

Route::post('users/{user}/updateProfile', [UsersController::class, 'updateProfile']);

Route::resource('users', UsersController::class)->middleware('auth:sanctum');

Route::get('posts/{post}/details', [PostsController::class, 'details']);

Route::post('posts/{post}/updatePost', [PostsController::class, 'updatePost']);

Route::resource('posts', PostsController::class)->middleware('auth:sanctum');