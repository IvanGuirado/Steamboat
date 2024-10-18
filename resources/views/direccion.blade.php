@extends('layouts.plantilla')

@section('title', 'datos')


@section('content1')
    <div class="wrapper">
        <div class="datos-container">
            <div class="nombre-pag">
                <h1>{{ __('DIRECCIÓN DE ENVIO') }}</h1>
            </div>
            <form class="direccion" action="/carrito/pagar" method="post" id="formulario-direccion">
                @csrf
                <div class="inputs-direccion">
                    <input type="hidden" name="id"value={{ old('id', $user->id) }}>
                    <label for="Direccion">{{ __('Dirección') }}</label>
                    <input type="text" id="Direccion" name="address" placeholder="Dirección" required
                        value="{{ old('address', $user->address) }}">
                    @error('address')
                        <div class="error-input">{{ $message }}</div>
                    @enderror
                    <label for="Ciudad">{{ __('Ciudad') }}</label>
                    <input type="text" id="Ciudad" name="city" placeholder="Ciudad" required
                        value="{{ old('city', $user->city) }}">
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
                        value="{{ old('country', $user->country) }}">
                    @error('country')
                        <div class="error-input">{{ $message }}</div>
                    @enderror
                    <label for="Provincia">{{ __('Provincia') }}</label>
                    <input type="text" id="Provincia" name="province" placeholder="Provincia" required
                        value="{{ old('province', $user->province) }}">
                    @error('province')
                        <div class="error-input">{{ $message }}</div>
                    @enderror


                    <div class="guardarDatos-container">
                        <input name="guardarDatos" type="checkbox" id="guardar" class="guardar">
                        <label for="guardar">{{ __('Guardar nueva dirección') }}</label>
                    </div>

                </div>
                <div class="botones">
                    <div class="continuar-button">
                        <input type="submit" value="Continuar con la compra">
                    </div>
                </div>

            </form>
        </div>
    </div>

@endsection
