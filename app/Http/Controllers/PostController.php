<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\User;
use App\Services\PostService;
use Faker\ORM\Spot\ColumnTypeGuesser;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

use Faker\Factory as Faker;

class PostController extends Controller
{
    public PostService $postService;

    public function __construct(PostService $postService)
    {
        $this->postService = $postService;
    }

    public function index()
    {
        $title = 'Laravel is very powerful framework to create full stack applications';
        return str_replace(' ', '-', $title);
    }

    public function create()
    {
        $data = $this->postService->data();
        return $createPost = $this->postService->store($data);
    }

    public function store(Request $request)
    {
        $data = $this->postService->data();
        return $createPost = $this->postService->store($data);
    }

    public function show($slug)
    {
        $post = $this->postService->show($slug);
    }

    public function edit()
    {
    }

    public function update(Request $request, $post_id)
    {
    }

    public function destroy($post_id)
    {
    }

    public function postSearch(Request $request)
    {
        return $this->postService->search($request->searchItem);
    }

    public function methods()
    {
        //TODO :
        // insertOrIgnore => allows to insert data into the database table only if the data does not already exist in the table
        // [if there an duplicate with the primary key or unique key the method will ignore it and continue]

        //TODO :
        // updateOrCreate => adds or update a column in the database table [accepts two arrays  the first one for search and the second is the data]
        // if the second parameter of the function is already exists the method will update this row of data
        // if it's not existed the method will create a new row of data

        //TODO
        // firstOrCreate => returns the first row of data if found else creates a new row [accepts two arrays  the first one for search and the second is the data]

        //TODO :
        // insertGetId => allow to insert a new record of data  into a table and retrieve its id in a single query


        //TODO :
        // firstWhere => returns the first row of data by a custom attribute

        return $post = Post::query()->upsert([
            'user_id' => 8,
            'title' => 'Eloquent is awesome',
            'excerpt' => 'awesome',
            'description' => 'Laravel Features are very easy  and powerful',
            'slug' => 'eloquent-is-awesome',
            'min_to_read' => '2',
            'is_published' => false,
            'created_at' => \Carbon\Carbon::now(),
        ], ['min_to_read']);

    }

    public function createMultiplePosts() // Creating 100 Posts
    {
        $users = User::query()->pluck('id')->toArray();
        $is_published = [true, false];
        $min_to_read = [10, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        $faker = Faker::Create();
        for ($i = 0; $i < 100; $i++) {
            $random_user_id = array_rand($users, 1);
            $random_is_published = array_rand($is_published, 1);
            $random_min_to_read = array_rand($min_to_read, 1);

            $title = $faker->sentence($nbWords = 6, $variableNbWords = true);
            $slug = str_replace(' ', '-', $title);
            $description = $faker->paragraph($nbSentences = 3, $variableNbSentences = true);
            $post = Post::query()->create([
                'user_id' => $users[$random_user_id],
                'title' => $title,
                'slug' => $slug,
                'excerpt' => $faker->word,
                'is_published' => $is_published[$random_is_published],
                'min_to_read' => $min_to_read[$random_min_to_read],
                'description' => $description,
                'created_at' => Carbon::now(),
            ]);
        }
        return 'Done';
    }

    public function postTags()
    {
        // return $post = Post::query()->with('tags')->find(1);
        // return $post = Post::query()->select('title', 'slug')->where('id' , 1)->with('tags')->first();
        $post = Post::query()
            ->select('title', 'slug')
            ->with([
                'tags' => function ($query) {
                    $query->select('name', 'slug');
                },
            ])
            ->find(1);
        return $post;

    }
}
