@extends('layouts.plantilla')

@section('title', 'Pedidos')

@section('content')
    <div class="wrapper">
        <table id="pedido_table" class="sortable asc">
            <div class="pedido-container">
                <div class="pedido-titulo">
                    <h1>{{__("PEDIDOS")}}</h1>
                </div>
                <thead>
                    <tr>
                        <th>{{__("Id")}}</th>
                        <th>{{__("Estado")}}</th>
                        <th>{{__("Fecha")}}</th>
                        <th>{{__("Dirección")}}</th>
                        <th>{{__("Total")}}</th>
                        <th>{{__("Usuario")}}</th>
                        <th>{{__("Nota")}}</th>
                        <th colspan=3></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($pedidos as $pedido)
                        <tr>
                            <td>{{ $pedido->id }}</td>
                            <td>{{ $pedido->estado }}</td>
                            <td>{{ $pedido->created_at }}</td>
                            <td>{{ $pedido->direccion_envio }}</td>
                            <td>{{ $pedido->total }}</td>
                            <td>{{ $pedido->usuario->name }}</td>
                            <td>{{ $pedido->notas }}</td>
                            <td>
                                <div id="ver">
                                    <a href="{{ route('pedidos.show', $pedido->id) }}"class="boton1"><span>{{__("Ver")}}</span></a>
                                </div>
                            </td>
                            <td>
                                <div id="editar">
                                    <a href="{{ route('pedidos.edit', $pedido->id) }}" class="boton1"><span>{{__("Editar")}}</span></a>
                                </div>
                            </td>
                            <td>
                                <div class="eliminar">
                                    <div class="boton2"
                                        onclick="confirmarBorrado({{ $pedido->id }},'{{ route('pedidos.destroy', $pedido->id) }}')">
                                        <span>{{__("Eliminar")}}</span>
                                    </div>

                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
        </table>
        {{ $pedidos->links('pagination.simple-default') }}
    </div>
    <script>
        function confirmarBorrado(id, url) {
            if (confirm('{{__("¿Quieres borrar el pedido ")}} ' + id + "?")) {
                fetch(url, {
                        method: "Delete",
                        headers: {
                            'X-CSRF-TOKEN': window.CSRF_TOKEN
                        }
                    }).then(Respuesta => Respuesta.text())
                    .then(Respuesta => {
                        if (Respuesta.indexOf("body")>=0) alert('{{__("Ha habido algun error")}} ');
                        else {
                            alert(Respuesta);
                            location.reload()

                        }

                    }).catch(e => {
                        console.log("pepito", e)
                    })
            }

        }
    </script>
@stop
