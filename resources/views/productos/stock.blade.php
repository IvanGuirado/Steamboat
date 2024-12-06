@extends('layouts.plantilla')
@section('head')
<link rel="stylesheet" href="/css\stock.css" type="text/css">
@stop
@section('content1')
    <div class="container">
        <h1>Stock de {{ $producto->nombre }}</h1>

        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif

        <form action="{{ route('productos.updateStock', $producto->id) }}" method="POST">
            @csrf

            <table class="table">
                <thead>
                    <tr>
                        <th>Talla</th>
                        <th>Color</th>
                        <th>Cantidad</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($stock as $index => $item)
                        <tr>
                            <td><input type="text" name="stock[][talla]" placeholder="Talla"
                                    value="{{ $item->talla }}" required></td>
                            <td><input type="text" name="stock[][color]" placeholder="Color"
                                    value="{{ $item->color }}" required></td>
                            <td><input type="number" name="stock[][cantidad]" placeholder="Cantidad"
                                    value="{{ $item->cantidad }}" required></td>
                            <td>
                                <button onclick="eliminar_Fila()">Eliminar</button>
                            </td>
                        </tr>
                    @endforeach
                    
                </tbody>
            </table>

            <button type="button" id="addRow" class="btn btn-secondary">Añadir otra fila</button>
            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
        </form>
    </div>

    <script>
        document.getElementById('addRow').onclick = function() {
            var table = document.querySelector('tbody');
            var rowCount = table.children.length; // -1 to exclude the new row
            var newRow = `<tr>
            <td><input type="text" name="stock[][talla]" placeholder="Talla" required></td>
            <td><input type="text" name="stock[][color]" placeholder="Color" required></td>
            <td><input type="number" name="stock[][cantidad]" placeholder="Cantidad" required></td>
            <td><button onclick="eliminar_Fila()">Eliminar</button>
                            </td>
        </tr>`;
            table.insertAdjacentHTML('beforeend', newRow);
        }

        function eliminar_Fila() {
            event.preventDefault();
            var tr = event.target.closest("tr");
            //Elimimamos la fila tr de la tabla
            tr.parentNode.removeChild(tr);

        }
    </script>
@endsection
