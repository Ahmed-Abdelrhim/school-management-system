<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Http\Resources\Json\ResourceCollection;

class PostResource extends JsonResource
{
    public bool $preserveKeys = true;
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // return parent::toArray($request);
        return [
            //'data' => PostResource::collection($this->collection),
              'description' => $this->description,
             'slug' => $this->slug,
             'title' => $this->title,
             'tags' => $this->tags,
        ];
    }
}
