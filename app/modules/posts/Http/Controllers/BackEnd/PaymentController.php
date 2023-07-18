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

use Illuminate\Support\Facades\Redis;
use JetBrains\PhpStorm\NoReturn;
use Yajra\DataTables\Facades\DataTables;
use Post\Services\PostService;
class PaymentController extends Controller
{
    public function index()
    {
        return view('posts::payment');
    }

    public function pay()
    {
        dd(request());
        // return view('posts::state');

        // No: 4987654321098769
        // Name: Test Account
        // EXP: 12/25
        // cvv: 123
    }
}
