<?php

namespace App\Http\Resources;

use App\Models\User;
use Faker\Provider\Payment;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use Illuminate\Http\Resources\Json\JsonResource;

class PostCollection extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'title' => $this->title,
            'slug' => $this->slug,
            'excerpt' => $this->excerpt,
            'description' => $this->description,
            'min_to_read' => $this->min_to_read,
            'is_published' => $this->is_published,
            'created_at' => $this->created_at->format('d-M-Y'),
        ];
    }
}
