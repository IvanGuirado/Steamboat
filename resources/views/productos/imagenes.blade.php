@extends('layouts.plantilla')

@section('content1')
    <div class="container">
        <h1>imagenes de {{ $producto->nombre }}</h1>

        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif



            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Color</th>
                        <th>Imagen</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($imagenes as $index => $item)
                        <tr>
                            <td><input type="text" name="imagenes[][id]"
                                value="{{ $item->id }}" readonly></td>
                            <td><input type="text" name="imagenes[][color]" placeholder="Color"
                                    value="{{ $item->color }}" readonly></td>
                            <td><input type="text" name="imagenes[][imagen]" placeholder="Imagen"
                                    value="{{ $item->imagen }}" readonly></td>
                            <td>
                                <form action="{{ route('productos.eliminarImagen', $item->id) }}" method="POST">
                                    @csrf
                                <button>Borrar</button>
                            </form>
                            </td>
                        </tr>
                    @endforeach         
                </tbody>
            </table>
        
            <form action="{{ route('productos.agregarImagen', $producto->id) }}" method="POST">
                @csrf
            <input type="text" name="color" id="color" placeholder="Color" required>
            <input type="file" name="imagene" accept="image/*"> 
            <button type="submit" class="btn btn-primary">Añadir Imagen</button>
        </form>
    </div>
@endsection
