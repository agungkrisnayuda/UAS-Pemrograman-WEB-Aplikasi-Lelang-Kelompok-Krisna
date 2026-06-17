<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AuctionController;
use App\Http\Controllers\Api\BidController;

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/auctions/{auction}/bid', [BidController::class, 'store']);
    Route::apiResource('auctions', AuctionController::class);

});

Route::post('/register',[AuthController::class,'register']);
Route::post('/login',[AuthController::class,'login']);

Route::middleware('auth:sanctum')->group(function(){

    Route::post('/logout',[AuthController::class,'logout']);

});