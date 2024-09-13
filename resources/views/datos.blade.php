@extends('layouts.plantilla')

@section('title', 'datos')


@section('content')
    <div class="wrapper">
        <div class="datos-container">
            <div class="nombre-pag">
                <h1>{{ __('MIS DATOS') }}</h1>
            </div>
            <form class="datos" action="/datos" method="post" id="formulario-datos">
                @csrf
                <div class="inputs-datos">
                    <input type="hidden" name="id"value={{ old('id', $user->id) }}>
                    <label for="Nombre">{{ __('Nombre') }}</label>
                    <input type="text" id="Nombre" name="name" placeholder={{ __('Nombre') }} required
                        value="{{ old('name', $user->name) }}">
                    @error('name')
                        <div class="error-input">{{ $message }}</div>
                    @enderror
                    <label for="Apellidos">{{ __('Apellidos') }}</label>
                    <input type="text" id="Apellidos" name="last_name" placeholder="Apellidos" required
                        value="{{ old('last_name', $user->last_name)}}">
                    @error('last_name')
                        <div class="error-input">{{ $message }}</div>
                    @enderror
                    <label for="fechaNacimiento">{{ __('Fecha de nacimiento') }}</label>
                    <input type="date" id="fechaNacimiento" name="birthdate" placeholder="Fecha de Nacimiento" required
                        value={{ old('birthdate', $user->birthdate) }}>
                    @error('birthdate')
                        <div class="error-input" id="mensajeError">{{ $message }} </div>
                    @enderror
                    <label for="Direccion">{{ __('Dirección') }}</label>
                    <input type="text" id="Direccion" name="address" placeholder="Dirección" required
                        value="{{ old('address', $user->address)}}">
                    @error('address')
                        <div class="error-input">{{ $message }}</div>
                    @enderror
                    <label for="Ciudad">{{ __('Ciudad') }}</label>
                    <input type="text" id="Ciudad" name="city" placeholder="Ciudad" required
                        value="{{ old('city', $user->city)}}">
                    @error('city')
                        <div class="error-input">{{ $message }}</div>
                    @enderror
                    <label for="CP">{{ __('Código postal') }}</label>
                    <input type="text" id="CP" name="pc" placeholder="Código postal" required
                        value="{{ old('pc', $user->pc) }}">
                    @error('pc')
                        <div class="error-input">{{ $message }}</div>
                    @enderror
                    <label for="Pais">{{ __('País') }}</label>
                    <input type="text" id="Pais" name="country" placeholder="País" required
                        value="{{ old('country', $user->country)}}">
                    @error('country')
                        <div class="error-input">{{ $message }}</div>
                    @enderror
                    <label for="Provincia">{{ __('Provincia') }}</label>
                    <input type="text" id="Provincia" name="province" placeholder="Provincia" required
                        value="{{ old('province', $user->province)}}">
                    @error('province')
                        <div class="error-input">{{ $message }}</div>
                    @enderror
                    <label for="Mail">{{ __('Email') }}</label>
                    <input type="email" id="Mail" name="email" placeholder="Email" required
                        value={{ old('email', $user->email) }}>
                    @error('email')
                        <div class="error-input">{{ $message }}</div>
                    @enderror


                    
                </div>
                <div class="botones">
                    <div class="update-button">
                        <input type="submit" value={{ __('Actualizar') }}>
                    </div>
                    <div class="cancel-button">
                        <button value="cancel">{{ __('Cancelar') }}</button>
                    </div>

                </div>

            </form>
        </div>
    </div>

@endsection
