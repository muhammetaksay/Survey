<?php

namespace App\Http\Controllers;

use App\Models\Question;
use App\Models\Section;
use App\Models\Survey;
use Illuminate\Http\Request;

class SurveyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {   
        // return $id;
        $surveys = Survey::where('id', $id)->with('sections')->get();
        if(count($surveys) > 0){
            $collection = collect($surveys)->map(function($item) {
                return [
                    'title' => $item['title'],
                    'description' => $item['description'],
                    'sections' => collect($item->sections)->map(function($x) {
                        $questions = Question::where('section_id', $x->id)->get();
                        return [
                            'section' => $x->section,
                            'title' => $x->section,
                            'questions' => $questions,
                        ];
                    }),
                ];
            });
            return $collection;
        }else{
            return [];
        }
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
            "title" => "required",
            "description" => "required",
            "last_time" => "required",
            "status" => "required",
        ]);
        
        
        $survey = new Survey();
        $survey->title = $request->title;
        $survey->description = $request->description;
        $survey->last_time = $request->last_time;
        $survey->status = $request->status;
        $survey->save();

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
            "title" => "required",
            "description" => "required",
            "last_time" => "required",
            "status" => "required",
        ]);
        
        
        $survey = Survey::find($id);
        $survey->title = $request->title;
        $survey->description = $request->description;
        $survey->last_time = $request->last_time;
        $survey->status = $request->status;
        $survey->save();

        return "true ".$id;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $sections = Section::where('survey_id', $id)->get();
        foreach($sections as $sec){
            Question::where('section_id',$sec['id'])->delete();
        }
        Section::where('survey_id', $id)->delete();
        Survey::where('id', $id)->delete();
        return true;
    }
}
