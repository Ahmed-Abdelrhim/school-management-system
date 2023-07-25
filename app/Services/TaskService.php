<?php

namespace App\Services;

use App\Models\Post;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;

class TaskService
{
    public function registerUser($request)
    {
        $data['name'] = $request->get('name');
        $data['email'] = $request->get('email');
        $data['gender'] = $request->get('gender');
        $data['religion'] = $request->get('religion');
        $data['password'] =  Hash::make($request->get('password'));
        $data['created_at'] = Carbon::now();
        $user = User::query()->create($data);
        return $user;
    }
    public function update($request , $post)
    {
        $data['title'] = $request->get('title');
        $data['slug'] = $request->get('slug');
        $data['excerpt'] = $request->get('excerpt');
        $data['description'] = $request->get('description');
        $data['min_to_read'] = $request->get('min_to_read');
        $data['is_published'] = $request->get('is_published');
        $data['updated_at'] = Carbon::now();
        return $post->update($data);
    }
    public function findPostById($post_id)
    {
        $post  = Post::query()->find($post_id);
        if(!$post) {
            return false;
        }
        return $post;
    }
}
