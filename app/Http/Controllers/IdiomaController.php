<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\App;
use Illuminate\Http\Request;

class IdiomaController extends Controller
{
    public function setIdioma($lang)
    {
        //Establece el idioma en sesión
        session()->put("lang", $lang);
        \Log::info("setIdioma:$lang");
        $user = auth()->user();
        if ($user != null) {
            $user->update([

                "language" => $lang

            ]);
        }
    }
}
