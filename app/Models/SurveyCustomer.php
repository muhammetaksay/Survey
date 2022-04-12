<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SurveyCustomer extends Model
{
    use HasFactory;
    public $timestamps = false;

    public function survey()
    {
        return $this->hasOne(Survey::class, 'id', 'survey_id');
    }
}
