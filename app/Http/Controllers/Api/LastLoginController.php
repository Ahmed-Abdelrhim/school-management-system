<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Login;
use App\Models\User;
use Carbon\CarbonPeriod;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Faker\Factory as Faker;
use Yajra\DataTables\Facades\DataTables;

class LastLoginController extends Controller
{
    public function homePage()
    {
        return view('posts::index');
    }

    public function index()
    {
        //        $firstQuery = User::query()
        //            ->with('logins:id,ip,last_login_at,user_id')
        //            ->select('id', 'name', 'email')
        //            ->get();

        $users = User::query()
            ->select('id', 'name', 'email')
            ->addSelect([
                'last_login_ip' => Login::query()
                    ->select('ip')
                    ->whereColumn('user_id', 'users.id')
                    ->limit(1),
                'last_login_at' => Login::query()
                    ->select( 'last_login_at')
                    ->whereColumn('user_id', 'users.id')
                    ->orderBy('last_login_at', 'desc')
                    ->limit(1),
            ])
            ->get();

        return $this->postsDataTable($users);
        // return view('posts::index',['users' => $users]);
    }


    public function postsDataTable($users): JsonResponse
    {
        return DataTables::of($users)
            ->addColumn('name', function ($user) {
                return $user->name;
            })
            ->addColumn('email', function ($user) {
                return $user->email;
            })
            ->addColumn('last_login_ip', function ($user) {
                return $user->last_login_ip;
            })
            ->addColumn('last_login_at', function ($user) {
                return $user->last_login_at;
            })
            ->tojson();
        // ->make(true);
    }

    public function customSeed()
    {
        //        $faker = Faker::create();
        //        $users = User::query()->pluck('id')->toArray();
        //        $dates =  CarbonPeriod::create('2023-06-01', '2023-06-20')->toArray();
        //
        //        foreach ($users as $user) {
        //            $hours = mt_rand(0,23);
        //            $minutes = str_pad(mt_rand(0,59), 2, "0", STR_PAD_LEFT);
        //            $seconds =  mt_rand(0,59);
        //            if ($seconds < 10) {
        //                $seconds = '0' . $seconds;
        //            }
        //            $time = $hours . ":" . $minutes . ":" . $seconds;
        //            $date = $dates[array_rand($dates,1)]->format('Y-m-d');
        //            $finalDateTime = $date . " " . $time;
        //
        //            Login::query()->insert([
        //                'user_id' => $users[array_rand($users,1)],
        //                'ip' => $faker->ipv4,
        //                'last_login_at' => $finalDateTime,
        //                'created_at' => Carbon::now(),
        //            ]);
        //        }
    }
}
