@extends('layouts.plantilla')

@section('title', 'login')


@section('content')
    <div class="wrapper">
        <div class="login-container">
            <div class="login-pag">
                <h1>{{ __('INICIAR SESIÓN') }}</h1>
            </div>
            <form action="/login/autorizar" method="post" class="login">
                @csrf
                <div class="inputs-login">
                    <label for="Mail">{{ __('Email') }}</label>
                    <input type="text" id="Mail" name="Mail" placeholder="Email" required>
                    <label for="Contraseña">{{ __('Contraseña') }}</label>
                    <input type="text" id="Contraseña" name="Contrasena" placeholder="Contraseña" required>
                </div>
                <div class="remember-container">
                    <label><input type="checkbox" name="recuerdame" class="remember"> <span>{{ __('Recuérdame') }}</span></label><br>
                </div>
                <div class="logear">
                    <div class="registrar">
                        <a href="{{ route('registro') }}">{{ __('Registrar') }}</a></span>
                    </div>
                    <div class="log-button">
                        <input type="submit" value="Login">
                    </div>

                </div>

            </form>
        </div>
    </div>
@endsection
