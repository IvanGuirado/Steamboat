<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Mail\BienvenidoEmail;

class DataController extends Controller
{

    public function datos()
    {

        $user = auth()->user();
        if ($user == null) {
            abort(403, "Debes iniciar sesión");
        }
        return view("datos", ["user" => $user]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function datosUpdate(Request $request, User $user)
    {
        $id = $request->input("id");

        $validatedData = $request->validate([
            'name' => ['required', 'regex:/^[A-Za-z\sñáéíóúÁÉÍÓÚ]*$/', 'max:50'],
            'last_name' => ['required', 'regex:/^[A-Za-z\sñáéíóúÁÉÍÓÚ]*$/', 'max:50'],
            'birthdate' => 'required|date|before:' . \Carbon\Carbon::now()->subYears(18)->format('Y-m-d'),
            'address' => ['required', 'regex:/^[A-Za-z0-9\sñáéíóúÁÉÍÓÚ]*$/', 'max:50'],
            'city' => ['required', 'regex:/^[A-Za-z0-9\sñáéíóúÁÉÍÓÚ]*$/', 'max:50'],
            'pc' => ['required', 'regex:/^[A-Za-z0-9\s]*$/', 'max:10'],
            'country' => ['required', 'regex:/^[A-Za-z\sñáéíóúÁÉÍÓÚ]*$/', 'max:50'],
            'province' => ['required', 'regex:/^[A-Za-z\sñáéíóúÁÉÍÓÚ]*$/', 'max:50'],
            'email' => 'required|email|unique:users,email',
        ]);
        $user = User::findOrFail($id);
        $user->name = $validatedData["name"];
        $user->last_name = $validatedData["last_name"];
        $user->birthdate = $validatedData["birthdate"];
        $user->address = $validatedData["address"];
        $user->city = $validatedData["city"];
        $user->pc = $validatedData["pc"];
        $user->country = $validatedData["country"];
        $user->province = $validatedData["province"];
        $user->email = $validatedData["email"];
        $user->save();

        return redirect("/datos")
            ->with('success', 'Datos actualizados');
    }
}
