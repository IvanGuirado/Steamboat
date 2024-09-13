<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\App;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function __invoke(){
        //App::setLocale("en");
        /*Devuelve vista home */
            return view('home');
    }
}
