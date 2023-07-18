<?php

namespace Post\Http\Controllers\FrontEnd;

use App\Http\Controllers\Controller;
use JetBrains\PhpStorm\NoReturn;

class FrontendController extends Controller
{
    #[NoReturn]public function index()
    {
        dd('FrontEnd Controller HMVC');
    }
}
