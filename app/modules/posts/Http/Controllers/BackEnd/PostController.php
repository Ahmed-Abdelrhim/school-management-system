<?php

namespace Post\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Contracts\View\View;
use Illuminate\Foundation\Application;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

use Faker\Factory as Faker;
use Illuminate\Support\Facades\Redis;
use JetBrains\PhpStorm\NoReturn;
use Yajra\DataTables\Facades\DataTables;
use Post\Services\PostService;

class PostController extends Controller
{
    public PostService $postService;

    public function __construct(PostService $postService)
    {
        $this->postService = $postService;
    }

    public function index()
    {
        return $ghostTags = Tag::query()->doesntHave('posts')->get();

        $posts = DB::table('post_tag')->pluck('tag_id')->toArray();
        return $tags = Tag::query()->whereNotIn('id' , $posts)->get();

        $postsArray = [];
        $posts = Post::query()->where('id', '<=', 10)->get();
        foreach ($posts as $post) {
            if ($post->networks == 1) {
                $postsArray[] .= $post;
            }
        }
        return $postsArray;
        // return $this->postService->getPosts();
        // return view('posts::index');
    }

    public function getPosts(): JsonResponse
    {
        return $this->postService->getPosts();
    }

    public function savePostsToRedis(Request $request)
    {
        //        $post = Cache::rememberForever('posts', function () {
        //            return Post::all();
        //        });
        return $posts = Cache::get('posts');

        return view('', ['posts' => $posts]);


        //        $postsIds = Post::query()->pluck('id')->toArray();
        //        $posts = [];
        //        foreach ($postsIds as $postId) { // O(n) Complexity
        //            $postCached = Cache::get('post_id_id_' . $postId);
        //            if (!$postCached) {
        //                continue;
        //            }
        //            return json_decode($postCached);
        //        }
        //        return $posts;
    }


    public function queryTest()
    {
        return $posts_does_not_have_tags = Cache::get('posts_does_not_have_tags');
        /*TODO
         *  Run background job for these posts and send them mails of our offers and new prices,
         *  And we have a very good prices for them to make them subscribe
         */
    }

    public function savePostsWithNoTagsToRedis(): bool
    {
        $post_tags = DB::table('post_tag')->pluck('post_id')->toArray();
        $postsDoesNotHaveTags = Post::query()
            ->with('owner:id,name,email')
            ->whereNotIn('id', $post_tags)
            ->select('id', 'title', 'user_id', 'created_at')
            ->get();
        return $saveToRedis = Cache::put('posts_does_not_have_tags', $postsDoesNotHaveTags);
    }
}

// return Cache::get('post_id_id_3');
//        $post = Post::find(1);
//        Cache::put('post_id_id_'.$post->id, $post);
//
//        $post_2 = Post::find(2);
//        Cache::put('post_id_id_' . $post_2->id, $post_2);
//
//        $post_3 = Post::find(3);
//        Cache::put('post_id_id_' . $post_3->id, $post_3);
//        return 'Done';


//        return $keys = Cache::getRedis()->keys('school_database_post_id:*');
//        return Redis::connection('cache')->keys('*');
//        return Cache::get('post_id_:*');
//        return Cache::get('post_id_' . 1);
//        $posts = $request->get('posts');
//        foreach ($posts as $post) {
//            $redis = Cache::set('post_id' . $post->id, $post);
//        }
//        return 'Done';
