@extends('layouts.plantilla')

@section('title', 'registro')


@section('content')
    <div class="wrapper">
        <div class="registro-container">
            <div class="nombre-pag">
                <h1>{{ __('CREAR CUENTA') }}</h1>
            </div>

            <form class="registro" action="/registro/registrarse" method="post">
                @csrf
                <div class="inputs-registro">
                    <input type="text" id="nombre" name="Nombre" placeholder={{ __('Nombre') }} required>
                    <input type="text" id="Apellidos" name="Apellidos" placeholder={{ __('Apellidos') }} required>
                    <input type="email" id="Mail" name="Mail" placeholder={{ __('Email') }} required>
                    <input type="password" id="Contraseña" name="Contrasena" placeholder={{ __('Contraseña') }} required>
                </div>
                <div class="botones">
                    <div class="create-button">
                        <input type="submit" value={{ __('Crear') }}>
                    </div>
                    <div class="login-button">
                        <a href="{{ route('login') }}">{{ __('Iniciar sesión') }}</a>
                    </div>
                </div>

            </form>
        </div>

    </div>
@endsection
