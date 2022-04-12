<?php

namespace App\Http\Controllers;

use App\Models\Answer;
use App\Models\Customer;
use App\Models\Question;
use App\Models\Survey;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    
    public function store(Request $request)
    {
        $validated = $request->validate([
            "name" => "required",
            "email" => "required",
            "status" => "required",
        ]);
        
        Customer::firstOrCreate(
            ['email' => $request->email],
            ['name' => $request->name, 'status' => 1]
        );

        return "true";

    }


    public function list()
    {
        $customer = Customer::where('status',1)->get();
        return $customer;
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        $customer = Customer::with("surveys")->find($id);
        foreach($customer->surveys as $sur){
            $survey = Survey::with("sections")->find($sur->id)->get();
            foreach($survey as $surveys){
                return [
                'name' => $customer->name,
                'email' => $customer->email,
                'survey' => $surveys->title,
                'sections' => collect($surveys->sections)->map(function($x) use ($customer){
                    $questions = Question::where('section_id', $x->id)->get();
                    return [
                        'section' => $x->section,
                        'title' => $x->section,
                        'questions' => collect($questions)->map(function($y) use($customer){
                            return [
                                'question' => $y->question,
                                'type' => $y->type,
                                'answer' => collect(Answer::where('question_id', $y->id)->where('customer_id', $customer->id)->get())->map(function($use){
                                        return $use->answer;
                                }),
                            ];
                        })
                    ];
                }),
            ];
        }
            
        }
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
            "email" => "required",
            "name" => "required",
            "status" => "required",
        ]);
        
        
        $customer = Customer::find($id);
        $customer->email = $request->email;
        $customer->name = $request->name;
        $customer->status = $request->status;
        $customer->save();

        return "updated";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $sections = Customer::where('id', $id)->delete();
        return true;
    }
}
