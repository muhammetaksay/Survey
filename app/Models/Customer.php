<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;
    public $timestamps = false;

    protected $fillable = ['name', 'email', 'survey_id', 'customer_id'];

    public function surveys()
    {
        return $this->hasMany(SurveyCustomer::class, 'customer_id', 'id');
    }
}
