@extends('layouts.plantilla')

@section('title', 'show')

@section('content1')
    <div class="wrapper">
        <p>{{__("Estado")}}:{{ $pedido->estado }}</p>
        <p>{{__("Usuario")}}:{{ $pedido->user_id }}</p>
        <p>{{__("Dirección")}}:{{ $pedido->direccon_envio }}</p>
        <p>{{__("Fecha")}}{{ $pedido->created_at }}</p>
        <p>{{__("Total")}}{{ $pedido->total }}</p>
        <p>{{__("Notas")}}{{ $pedido->notas }}</p>

        @foreach ($productos as $producto)
            <p>{{__("Id producto")}}:{{ $producto->producto_id }}</p>
            <p>{{__("Talla")}}:{{ $producto->talla }}</p>
            <p>{{__("Color")}}:{{ $producto->color }}</p>
            <p>{{__("Cantidad")}}:{{ $producto->cantidad }}</p>
            <p>{{__("Precio unidad")}}:{{ $producto->precio_unidad }}</p>
        @endforeach
    </div>
@stop
