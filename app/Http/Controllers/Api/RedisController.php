<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Monolog\Handler\IFTTTHandler;

class RedisController extends Controller
{
    public function index()
    {
        $post = DB::table('posts')->find(1);
        // $redis_store_to_cache = Cache::put('post_id_' . $post->id ,$post);

        return Cache::get('post_id_' . $post->id);
    }

    public function post($postId)
    {
        if (!is_numeric($postId) || is_float($postId) || is_double($postId) ) {
            return response()->json(['status' => 400, 'msg' => 'ID should be a numeric value']);
        }

        $post = Cache::get('post_id_' . $postId, function () use ($postId) {
            $post = Post::query()->firstWhere('id', $postId);
            if ($post) {
                Cache::put('post_id_' . $post->id, $post);
            }
            // info('Post From Database Layer = ' . $post->id );
            return $post;
        });
        if (!$post) {
            return response()->json(['status' => 400, 'msg' => 'Post was not found']);
        }
        return response()->json(['status' => 200, 'msg' => 'OK', 'data' => $post]);
    }
}
