<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Survey extends Model
{
    use HasFactory;

    public function sections()
    {
        return $this->hasMany(Section::class, 'survey_id', 'id');
    }


}
