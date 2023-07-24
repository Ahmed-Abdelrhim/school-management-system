<?php

namespace App\Services;

class TaskService
{
    public function update($request , $post)
    {
        $data['title'] = $request->get('title');
        $data['slug'] = $request->get('slug');
        $data['excerpt'] = $request->get('excerpt');
        $data['description'] = $request->get('description');
        $data['min_to_read'] = $request->get('min_to_read');
        $data['is_published'] = $request->get('is_published');
        return $post->update($data);
    }
}
