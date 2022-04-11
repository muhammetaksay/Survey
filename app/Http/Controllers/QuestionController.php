<?php

namespace App\Http\Controllers;

use App\Models\Question;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $validated = $request->validate([
            "section_id" => "required",
            "question" => "required",
            "type" => "required",
            "orderby" => "required",
            "status" => "required",
        ]);
        
        
        $question = new Question();
        $question->section_id = $request->section_id;
        $question->question = $request->question;
        $question->type = $request->type;
        $question->orderby = $request->orderby;
        $question->status = $request->status;
        $question->save();

        return "true";
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
        $validated = $request->validate([
            "section_id" => "required",
            "question" => "required",
            "type" => "required",
            "orderby" => "required",
            "status" => "required",
        ]);
        
        
        $question = Question::find($id);
        $question->section_id = $request->section_id;
        $question->question = $request->question;
        $question->type = $request->type;
        $question->orderby = $request->orderby;
        $question->status = $request->status;
        $question->save();

        return "true";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Question::where('id',$id)->delete();
        return true;
    }
}
