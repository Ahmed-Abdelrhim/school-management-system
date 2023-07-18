<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class TagController extends Controller
{
    public function createMultipleTags()
    {
        $tags = Tag::query()->pluck('id')->toArray();
        $posts = Post::query()->pluck('id')->toArray();

        for ($i=0; $i < 100; $i++)
        {
            $random_post_id = array_rand($posts , 1);
            $random_tag_id = array_rand($tags , 1);
            $insert = DB::table('post_tag')->insert([
                'post_id' => $posts[$random_post_id],
                'tag_id' => $tags[$random_tag_id],
                'created_at' => Carbon::now(),
            ]);
        }
        return 'Inserted Success';
    }
}
