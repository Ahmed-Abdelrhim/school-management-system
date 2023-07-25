<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\RegisterRequest;
use App\Http\Requests\TaskUpdateRequest;
use App\Http\Resources\TaskCollection;
use App\Http\Resources\TaskResource;
use App\Models\Post;
use App\Models\User;
use App\Services\TaskService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;

class TasksController extends Controller
{
    private TaskService $taskService;
    public function __construct(TaskService $taskService)
    {
        $this->taskService = $taskService;
    }

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


    public function register(RegisterRequest $request): JsonResponse
    {
        $request->validated();
        $user = $this->taskService->registerUser($request);
        return response()->json(['status' => 'User Created Successfully' , 'data' => $user],200);
    }
    public function index(): JsonResponse
    {
        $posts = Post::query()->with('owner')->get();
        return response()->json(['posts' => $posts]);
    }

    public function store(Request $request, $post_id): JsonResponse
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

    public function show(string $id): JsonResponse
    {
        $post  = Post::query()->with('comments')->find($id);
        if(!$post) {
            return response()->json(['status' => 'Post was not found'],404);
        }
        $postResource = new TaskResource($post);
        return response()->json(['data' => $postResource ,'status' => 'Success'] , 200);
    }
    public function update(TaskUpdateRequest $request, $post_id): JsonResponse
    {
        $post = $this->taskService->findPostById($post_id);
        if ($post === false) {
            return response()->json(['status' => 'Post was not found'],404);
        }
        $request->validated();
        $updatedPost = $this->taskService->update($request, $post);
        return response()->json(['status' => 'Post Updated Successfully' , 'data' => $updatedPost],200);
    }

    public function destroy($post_id): JsonResponse
    {
        $post = $this->taskService->findPostById($post_id);
        if ($post === false) {
            return response()->json(['status' => 'Post was not found'],404);
        }
        $post->delete();
        return response()->json(['status' => 'Post Updated Successfully' , 'data' => $post],200);
    }

}
