<?php

namespace Post\Services;

use App\Models\Post;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Cache;
use Yajra\DataTables\Facades\DataTables;

class PostService
{
    public function getPosts()
    {
         $posts = Post::query()
         ->with('owner:id,name,email','tags:id,name,slug')
            ->where('is_published', 0)
            ->select('id', 'title', 'excerpt', 'description', 'min_to_read','user_id')
            ->get();
        // $posts = Cache::get('posts');
        return $this->postsDataTable($posts);
    }

    public function postsDataTable($posts): JsonResponse
    {
        return DataTables::of($posts)
            ->addColumn('id', function ($post) {
                return $post->id;
            })
            ->addColumn('title', function ($post) {
                return $post->title;
            })
            ->addColumn('excerpt', function ($post) {
                return $post->excerpt;
            })
            ->addColumn('description', function ($post) {
                return $post->description;
            })
            ->addColumn('min_to_read', function ($post) {
                return $post->min_to_read;
            })
            ->addColumn('actions', function ($post) {
                return view('posts::_action', ['post' => $post]);
            })
            ->rawColumns(['actions'])
            ->tojson();
        // ->make(true);
    }
}
