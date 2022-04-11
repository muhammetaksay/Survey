<?php

namespace App\Http\Controllers;

use App\Models\Question;
use App\Models\Section;
use Illuminate\Http\Request;

class SectionController extends Controller
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
            "survey_id" => "required",
            "section" => "required",
            "orderby" => "required",
            "status" => "required",
        ]);
        
        
        $section = new Section();
        $section->survey_id = $request->survey_id;
        $section->section = $request->section;
        $section->orderby = $request->orderby;
        $section->status = $request->status;
        $section->save();

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
            "survey_id" => "required",
            "section" => "required",
            "orderby" => "required",
            "status" => "required",
        ]);
        
        
        $section = Section::find($id);
        $section->survey_id = $request->survey_id;
        $section->section = $request->section;
        $section->orderby = $request->orderby;
        $section->status = $request->status;
        $section->save();

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
        $sections = Section::where('id', $id)->get();
        foreach($sections as $sec){
            Question::where('section_id',$sec['id'])->delete();
        }
        Section::where('id', $id)->delete();
        return true;
    }
}
