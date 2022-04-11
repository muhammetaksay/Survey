<?php

use App\Http\Controllers\AnswerController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\SectionController;
use App\Http\Controllers\SurveyController;
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

Route::get('/user', function (Request $request) {
    return $request->user();
});

Route::post('survey/create', [SurveyController::class, 'store']);
Route::post('survey/update/{id}', [SurveyController::class, 'update']);
Route::delete('survey/delete/{id}', [SurveyController::class, 'destroy']);

Route::post('customer/create', [CustomerController::class, 'store']);
Route::post('customer/update/{id}', [CustomerController::class, 'update']);

Route::post('section/create', [SectionController::class, 'store']);
Route::post('section/update/{id}', [SectionController::class, 'update']);
Route::delete('section/delete/{id}', [SectionController::class, 'destroy']);


Route::post('question/create', [QuestionController::class, 'store']);
Route::post('question/update/{id}', [QuestionController::class, 'update']);
Route::delete('question/delete/{id}', [QuestionController::class, 'destroy']);


Route::get('getsurvey/{id}', [SurveyController::class, 'index']);
Route::post('answers', [AnswerController::class, 'index']);




// Route::get('/test', function (Request $request) {
//     return "test";
// });