<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use App\Http\Resources\CommentResource;

class TaskCollection extends ResourceCollection
{

    public function toArray(Request $request)
    {
        return CommentResource::collection($this->collection);
    }
}
