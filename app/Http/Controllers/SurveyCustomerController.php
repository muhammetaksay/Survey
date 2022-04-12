<?php

namespace App\Http\Controllers;

use App\Models\SurveyCustomer;
use Illuminate\Http\Request;

class SurveyCustomerController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            "customer_id" => "required",
            "survey_id" => "required",
            "status" => "required",
        ]);
        
        SurveyCustomer::firstOrCreate(
            ['customer_id' => $request->customer_id, 'survey_id' => $request->survey_id, 'status' => $request->status],
            ['customer_id' => $request->customer_id, 'survey_id' => $request->survey_id, 'status' => $request->status]
        );

        return "true";

    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            "customer_id" => "required",
            "survey_id" => "required",
            "status" => "required",
        ]);

        SurveyCustomer::updateOrCreate(
            ['customer_id' => $request->customer_id, 'survey_id' => $request->survey_id],
            ['customer_id' => $request->customer_id, 'survey_id' => $request->survey_id, 'status' => $request->status]
        );
        

        return "updated";
    }

}
