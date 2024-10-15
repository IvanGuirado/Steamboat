@extends('layouts.plantilla')

@section('title', 'Productos')

@section('content')
    <div class="wrapper">
        <div class="productos-container">
            @foreach ($productos as $producto)
                <div class="producto">
                    <div class="info-wrapper">
                        <div class="img-ctn"></div>

                        <div class="datos-productos-container">
                            <a href="/productos/{{ $producto->id }}"><img src="{{ $producto->imagen }}"></a>
                            <div>{{ $producto->nombre }}</div>
                            <div>{{ $producto->precio }}</div>
                        </div>
                        @if (optional(Auth::user())->id == 1)
                            <div class="buttons-edition">
                                <button class="boton2" onclick="eliminar({{ $producto->id }})">{{ __('Eliminar') }}</button>
                                <a href="{{ route('productos.edit', $producto->id) }}" class="boton1">{{ __('Editar') }}</a>
                                <a href="{{ route('productos.stock', $producto->id) }}" class="boton1">{{ __('Stock') }}</a>

                            </div>
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
        {{ $productos->links('pagination.simple-default') }}
    </div>
    <script>
        window.CSRF_TOKEN = '{{ csrf_token() }}';

        function eliminar(id) {
            if (confirm('¿Estas seguro que quieres eliminar este producto?')) {
                fetch('/productos/' + id, {
                    method: 'delete',
                    headers: {
                        'X-CSRF-TOKEN': window.CSRF_TOKEN // <--- aquí el token
                    },
                }).then(() => {
                    location.reload()
                })
            }

        }
    </script>
@stop
