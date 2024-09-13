@extends('layouts.plantilla')

@section('title', 'login')


@section('content')
    <div class="login-container">
        <div class="login-pag">
            <h1>CERRAR SESIÓN</h1>
        </div>
        <form action="{{ route('logout') }}" method="post" class="logout">
            @csrf

            <div class="logout-button">
                <input type="submit" value="Logout">
            </div>


        </form>
    </div>



@endsection
