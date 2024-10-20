<link rel="stylesheet" href="/css\stock.css" type="text/css">
@extends('layouts.plantilla')

@section('title', 'Productos')

@section('content1')

    <div class="wrapper">
        <div class="stock-container">
            <div class="stock-titulo">
                <h1>STOCK</h1>
            </div>
            <table id="stock_table" class="sortable asc">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Imagen</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Talla</th>
                        <th>Color</th>
                        <th>Categoria</th>
                        <th>Descripción</th>
                        <th>Detalle</th>
                        <th>Stock</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($productos as $producto)
                        <tr>
                            <td>{{ old('id', $producto->id) }}</td>
                            <td><img src="{{ $producto->imagen }}" style="max-height: 300px"></td>
                            <td>{{ old('nombre', $producto->nombre) }}</td>
                            <td>{{ old('precio', $producto->precio) }}</td>
                            <td>{{ old('talla', $producto->talla) }}</td>
                            <td>{{ old('color', $producto->color) }}</td>
                            <td>{{ old('categoria', $producto->categoria) }}</td>
                            <td>{{ old('descripcion', $producto->descripcion) }}</td>
                            <td>{{ old('detalle', $producto->detalle) }}</td>
                            <td readonly>{{ old('stock', $producto->stock) }}</td>
                            <td>
                                <div id="edit-stock">
                                    <a href="{{ route('productos.edit', $producto->id) }}"  class="boton1">Editar</a></span>
                                    <a href="{{ route('productos.stock', $producto->id) }}" class="boton1">{{ __('Stock') }}</a>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        {{ $productos->links('pagination.simple-default') }}
    </div>
@stop
