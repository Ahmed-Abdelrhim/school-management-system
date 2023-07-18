<?php

namespace App\Http\Controllers\BackEnd;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\PostRequest;
use App\Http\Resources\PostResource;
use App\Jobs\BackGroundJob;
use App\Mail\EmailSending;
use App\Models\Images;
use App\Models\Post;
use App\Models\Tag;
use App\Models\User;
use App\Notifications\PostNotification;
use Carbon\Carbon;
use Faker\Factory as Faker;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Foundation\Application;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class PlayController extends Controller
{
    public function carouselImages(): View|Application|Factory
    {
        $images = Images::query()->limit(3)->get();
        return view('backend.images.view_images', ['images' => $images]);
    }

    public function updateYourData()
    {
        return $user = auth()->user();
        // $data = request()->all();
    }

    public function downloadPdfFile(): Response
    {
        $allData = User::query()->get(['id', 'usertype', 'name', 'email', 'Code']);
        // This Limits Only 10
        $pdf = Pdf::loadView('backend.images.pdf', ['allData' => $allData]);
        //        $pdf = Pdf::loadView('backend.images.pdf',['allData' =>$allData])
        //            ->setPaper('a4', 'landscape')
        //            ->setWarnings(false);
        return $pdf->download('users_new_file.pdf');
    }

    public function getUsersForApi()
    {
        // $users = User::query()->paginate(10);
        return $users = Post::query()->get();
        // return response()->json(['status' => 200, 'message' => 'OK', 'data' => $users]);
    }

    public function createUserForApi(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 400, 'message' => $validator->messages()]);
        }

        return response()->json(['status' => 200, 'message' => 'OK', 'data' => $request->get('email')]);
    }

    public function playWithApiCreateUser()
    {
        $uri = 'http://127.0.0.1:1050/api/create/users';
        $get_users = 'http://127.0.0.1:1050/api/get/users';
        // here to

        //        $createUser = Http::withHeaders([
        //            'Authorization' => 'application/json',
        //            'Content-Type' => 'application/json'
        //        ])
        //            ->post($uri,
        //                [
        //                    'email' => 'api.email@example.com',
        //                    'password' => '123456',
        //                ]);

        $createUser = Http::timeout(60)->get($uri);
        return $createUser;
    }



    public function playy()
    {
        $posts = Tag::query()->whereDoesntHave('posts', function ($query) {
            $query->where('name', 'Laravel');
        })->orderBy('created_at', 'desc')->take(12)->get();

        return $user = User::query()
            ->with([])
            ->select('id','name','email')
            ->get();

        return $user = User
            ::with(['posts' => function ($query) {
                return $query->select('title')->get();
            }])
            ->get();

        $user = DB::table('users')
            ->join('posts', 'posts.user_id', '=', 'users.id')
            ->limit(3)
            ->select('users.id', 'name', 'email', 'posts.title as post_title', 'posts.excerpt as post_excerpt')
            ->get();
        return $user;

        return $posts = Post::query()->latest()->get();
        // $redis = Redis::set('post_id'.'1','Laravel-is-very-powerful-framework-to-create-full-stack-application');
        return $redis = Redis::get('post_id' . '1');
        /*
        $tag = Tag::withTrashed()->find(8);
        if (!$tag) {
            return 'Tag Was Not Found';
        }

        $tag->restore();
        return 'Tag Restored Successfully';

        */

        // $users = User::find(1);
        //dd($users);
        // here

        //        Notification::route('mail',[
        //            'ahmedabdelrhim92@gmail.com' => auth()->user()->name,
        //        ])->notify(new PostNotification());
        // Circle , Square , Rectangle , Triangle , Pentagonal , Hexagonal
    }
    public function resource()
    {
        $title = 'qui';
        return Post::query()->whereFullText('title', $title)
            ->orWhereFullText('description', $title)
            ->get();
    }
    // "vue-template-compiler": "^2.6.11";
}
