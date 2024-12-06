@extends('layouts.plantilla')

@section('title', 'create')
@section('head')
<link rel="stylesheet" href="/css\create.css" type="text/css">
@stop

@section('content1')
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
        <div class="create-productos-container">
            <div class="create-titulo">
                <h1>CREAR PRODUCTO</h1>
            </div>
            <form action="/productos" method="post" id="crear-productos" class="create" enctype="multipart/form-data">
                @csrf
                <input type="file" name="imagen" required accept="image/*" class="img_crear">
                <input class="create_inputs" name="nombre" required placeholder="Nombre" value="{{ old('nombre') }}">
                <input class="create_inputs" name="nombre_en" required placeholder="Name" value="{{ old('nombre_en') }}">
                <input type="number" name="precio" required placeholder="Precio" class="create_inputs" value="{{ old('precio') }}">
                <input type="text" name="categoria" required placeholder="Categoria" class="create_inputs" value="{{ old('categoria') }}">
                <input type="text" name="descripcion" required placeholder="Descripción" class="create_inputs"
                    value="{{ old('descripcion') }}">
                    <input type="text" name="descripcion_en" required placeholder="Description" class="create_inputs"
                    value="{{ old('descripcion_en') }}">
                <textarea name="detalle" cols="30" rows="10">{{ old('detalle') }}</textarea>
                <textarea name="detalle_en" cols="30" rows="10">{{ old('detalle_en') }}</textarea>
                <br>
                <input type="number" name="stock" required placeholder="stock" class="create_inputs" value="{{ old('stock') }}"
                    placeholder="1" value="1" min="1">
                <div id="create-pro">
                    <input type="submit" value="Crear" id="create" class="boton1">
                </div>

            </form>

        </div>
        

        <script src="//js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
        <script type="text/javascript">
            bkLib.onDomLoaded(nicEditors.allTextAreas);
        </script>
    @stop
</div>
