@extends('layouts.plantilla')

@section('title', 'Productos')

@section('content')
    <div class="productos-container">
        <div class="resultados-titulo">
            <h1>{{__("RESULTADOS")}}</h1>
        </div>
        @foreach ($productos as $producto)
            <div class="producto">
                <div class="info-wrapper">
                    <div class="img-ctn"></div>

                    <div class="datos-cnt">
                        <div class="id">{{ $producto->id }}</div>
                        <a href="/productos/{{ $producto->id }}"><img src="{{ $producto->imagen }}"></a>
                        <div>{{ $producto->nombre }}</div>
                        <div>{{ $producto->precio }}</div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
    {{ $productos->links('vendor.pagination.simple-default') }}
@stop
