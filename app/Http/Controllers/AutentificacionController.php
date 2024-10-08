<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Mail\BienvenidoEmail;
use Dotenv\Dotenv;
use Dotenv\Exception\ValidationException;

class AutentificacionController extends Controller
{
    public function registro()
    {
        return view("registro");
    }
    public function registrarse(Request $request)
    {
        $nombre = $request->input('Nombre');
        $apellidos = $request->input('Apellidos');
        $mail = $request->input('Mail');
        $contraseña = $request->input('Contrasena');
        $user=User::create(["name" => $nombre, "last_name" => $apellidos, "name" => $nombre, "password" => $contraseña, "email" => $mail]);
        Mail::to($mail)->send(new BienvenidoEmail($nombre));
        //Iniciamos sesion con el usuario
        Auth::login($user);
        return redirect("/");
    }
    
    public function login()
    {
        return view("login");
    }

    public function autorizar(Request $request)
    {
        $email = $request->input("Mail");
        $password = $request->input("Contrasena");
        
        if (Auth::attempt(["email" => $email, "password" => $password], $request->boolean('recuerdame'))) {
            //session(["user_id" => Auth::user()->id]);
            $request->session()->regenerate();
            return redirect()->intended("/")
                ->with('status', 'Te has registrado correctamente');
        }

        return back()->withErrors(["Mail" => "Credenciales incorrectas"]);
    }

    public function logout()
    {
        Auth::logout();
        //session_destroy();
        return redirect("home")
            ->with('status', 'Has cerrado sesión');
    }

    public function datos()
    {
        return view("datos");
    }
    
}
