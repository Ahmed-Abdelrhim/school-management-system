<?php

namespace App\Services;

use App\Models\Post;
use App\Providers\RouteServiceProvider;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class PostService {

    public function data()
    {
        $data['title'] = 'Laravel is very powerful framework to create full stack applications';
        $data['slug'] = 'Laravel-is-very-powerful-framework-to-create-full-stack-application';
        $data['description'] = 'Laravel is a web application framework with expressive, elegant syntax. A web framework provides a structure and starting point for creating your application,
                        allowing you to focus on creating something amazing while we sweat the details.
                Laravel strives to provide an amazing developer experience while providing powerful features such as thorough dependency injection, an expressive database
                abstraction layer, queues and scheduled jobs, unit and integration testing, and more.
                Whether you are new to PHP web frameworks or have years of experience, Laravel is a framework
                that can grow with you. We\'ll help you take your first steps as a web developer or give you a boost
                as you take your expertise to the next level. We can\'t wait to see what you build.';
        $data['excerpt'] = 'Laravel';
        return $data;
    }

    public function store(array $data)
    {
        try {
            DB::beginTransaction();
            $post = Post::query()->insertOrIgnore([
                'user_id' => auth()->user()->id,
                'title' => $data['title'],
                'slug' => $data['slug'],
                'excerpt' => $data['excerpt'],
                'description' => $data['description'],
                'min_to_read' => 5,
                'is_published' => false,
                'created_at' => Carbon::now(),
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            $notification = array('message' =>'Something Wrong Happened' , 'alert-type' => 'error');
            return redirect(RouteServiceProvider::HOME)->with($notification);
        }
        DB::commit();
        return $post;
    }

    public function show($slug)
    {
    }
    public function search($searchItem): Collection|array
    {
        return Post::query()
            ->whereFullText('title', $searchItem)
            ->select('id','title','excerpt','description','min_to_read')
            ->get();
    }
}
