@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Stock de {{ $producto->nombre }}</h1>

    @if(session('success'))
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
                @foreach($inventario as $item)
                <tr>
                    <td>{{ $item->talla }}</td>
                    <td>{{ $item->color }}</td>
                    <td>{{ $item->cantidad }}</td>
                    <td>
                        <input type="checkbox" name="delete_ids[]" value="{{ $item->id }}"> Eliminar
                    </td>
                </tr>
                @endforeach
                <tr>
                    <td><input type="text" name="new_inventario[0][talla]" placeholder="Talla" required></td>
                    <td><input type="text" name="new_inventario[0][color]" placeholder="Color" required></td>
                    <td><input type="number" name="new_inventario[0][cantidad]" placeholder="Cantidad" required></td>
                </tr>
            </tbody>
        </table>

        <button type="button" id="addRow" class="btn btn-secondary">Añadir otra fila</button>
        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
    </form>
</div>

<script>
    document.getElementById('addRow').onclick = function() {
        var table = document.querySelector('tbody');
        var rowCount = table.children.length - 1; // -1 to exclude the new row
        var newRow = `<tr>
            <td><input type="text" name="new_inventario[${rowCount}][talla]" placeholder="Talla" required></td>
            <td><input type="text" name="new_inventario[${rowCount}][color]" placeholder="Color" required></td>
            <td><input type="number" name="new_inventario[${rowCount}][cantidad]" placeholder="Cantidad" required></td>
        </tr>`;
        table.insertAdjacentHTML('beforeend', newRow);
    }
</script>
@endsection
