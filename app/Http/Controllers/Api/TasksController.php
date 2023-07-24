<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\RegisterRequest;
use App\Http\Resources\TaskCollection;
use App\Http\Resources\TaskResource;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;

class TasksController extends Controller
{

    public function login(Request $request)
    {
        $request->validate([
            'email' => ['required' , 'string' ,'email' ,'max: 255'],
            'password' => ['required' , 'string' ,'max: 255'],
        ]);

        if(!Auth::attempt($request->only(['email' , 'password'] ))) {
            return response()->json(['message' => 'Credentials do not match' , 'data' => ''] , 401);
        }

        $user = User::query()->Firstwhere('email' , $request->email);

        $token = $user->createToken('Api Token Of ' . $user->name)->plainTextToken;

        return response()->json(['message' => 'Success Login' , 'token' => $token , 'data' => $user],200);
    }


    public function register(RegisterRequest $request)
    {
        $request->validated();
        if ($request->has('image')) {
            if ($request->image !== null) {
                $img = Image::make($request->file('image'));
                $img->resize(300,null,function ($ration) {
                    $ration->aspectRatio();
                });
                // $img->save(storage_path('images'),50,'png');
                $img->save('images/bar.png');

            }
        }
        $user = User::query()->create([
            'name' => $request->name,
            'email' => $request->email,
            'gender' => $request->gender,
            'religion' => $request->religion,
            'password' => Hash::make($request->password),
        ]);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $posts = Post::query()->with('owner')->get();
        return response()->json(['posts' => $posts]);
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, $post_id)
    {
        $post  = Post::query()->find($post_id);
        if(!$post) {
            return response()->json(['status' => 'Post was not found'],404);
        }

        $request->validate([
            'body' => ['required','string','max:255'],
        ]);

        $postComment = $post->comments()->create([
            'body' => $request->get('body'),
            'created_at' => Carbon::now()
        ]);
        if (!$postComment){
            return response()->json(['status' => 'Error has occurred...' , 'data' => ''],422);
        }


        return response()->json(['status' => 'Success Transaction' , 'data' => $postComment],200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $post  = Post::query()->with('comments')->find($id);
        if(!$post) {
            return response()->json(['status' => 'Post was not found'],404);
        }

        $singlePost = new TaskResource($post);


        // $posts = Post::query()->with('comments')->limit(10)->get();
        // $resource = new TaskCollection($posts);
        return response()->json(['data' => $singlePost ,'status' => 'Success'] , 200);
    }
    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
