@extends('layouts.plantilla')

@section('title', 'update')

@section('content')
    <div class="wrapper">
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        <div class="edit-pedidos-container">
            <div class="edit-titulo-pedido">
                <h1>{{__("EDITAR PEDIDO")}}</h1>
            </div>
            <form action="{{ route('pedidos.update', $pedido->id) }}" method="post" id="edit-pedidos" class="edit_pedidos">
                @csrf
                @method('POST')
                <input type="text" name="direccion_envio" class="pedido_direccion" required placeholder="Dirección"
                    value="{{ old('direccion_envio', $pedido->direccion_envio) }}">

                <select name="estado" class="estados_pedidos">
                    <option value="Pendiente" @if (old('estado', $pedido->estado) == 'Pendiente') selected @endif>{{__("Pendiente")}}</option>
                    <option value="Enviado" @if (old('estado', $pedido->estado) == 'Enviado') selected @endif>{{__("Enviado")}}</option>
                    <option value="Recibido" @if (old('estado', $pedido->estado) == 'Recibido') selected @endif>{{__("Recibido")}}</option>
                    <option value="Incidencia" @if (old('estado', $pedido->estado) == 'Incidencia') selected @endif>{{__("Incidencia")}}</option>
                    <option value="Cancelado" @if (old('estado', $pedido->estado) == 'Cancelado') selected @endif>{{__("Cancelado")}}</option>
                    <option value="Devuelto" @if (old('estado', $pedido->estado) == 'Devuelto') selected @endif>{{__("Devuelto")}}</option>
                </select>
                <textarea name="notas" class="notas" cols="30" rows="10">{{ old('notas', $pedido->notas) }}</textarea>
                <div class="save_pedido">
                    <button type="submit" class="boton3">{{__("Guardar cambios")}}</button>
                </div>
            </form>
        </div>
    </div>

    <script src="//js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
    <script type="text/javascript">
        bkLib.onDomLoaded(nicEditors.allTextAreas);
    </script>
@stop
