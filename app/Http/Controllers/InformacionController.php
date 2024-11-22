<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\App;
use Illuminate\Http\Request;

class InformacionController extends Controller
{

    public function quienesSomos(Request $request)
    {
        return view('quienesSomos'); // Aquí se referencia 'quienesSomos' en lugar de 'quienes_somos'
    }

    public function devoluciones(Request $request)
    {
        return view('devolucion'); // Aquí se referencia 'devoluciones'
    }
    public function guiaDeTallas(Request $request)
    {
        return view('guiaDeTallas'); // Aquí se referencia 'devoluciones'
    }
}
