<?php

namespace App\Http\Controllers;

use App\Models\Answer;
use App\Models\Customer;
use Illuminate\Http\Request;

class AnswerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $name = $request->name;
        $email = $request->email;
        $survey_id = $request->survey_id;
        $customer_id = $request->customer_id;

        $customer_add = Customer::updateOrCreate(
            ['name' => $name, 'email' => $email, 'survey_id' => $survey_id, 'customer_id' => $customer_id],
            ['name' => $name, 'email' => $email, 'survey_id' => $survey_id, 'customer_id' => $customer_id],
        );
        $new_customer_id = $customer_add->id;

        foreach($request->answers as $ans){
            $answer = Answer::updateOrCreate(
                ['question_id' => $ans["question_id"], 'survey_id' => $survey_id, 'customer_id' => $new_customer_id],
                ['question_id' => $ans["question_id"], 'answer' => $ans["answer"], 'survey_id' => $survey_id, 'customer_id' => $new_customer_id]
            );
        }
        return true;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
