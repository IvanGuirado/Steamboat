<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\App;

use Illuminate\Http\Request;
use App\Models\Producto;

class HomeController extends Controller
{
    public function __invoke(){
        //App::setLocale("en");
        /*Devuelve vista home */
        $destacados=Producto::take(10)->get();
        return view('home',compact('destacados'));
    }
}
