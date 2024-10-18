@extends('layouts.plantilla')

@section('title', 'update')

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
        <div class="edit-productos-container">
            <div class="edit-titulo">
                <h1>EDITAR PRODUCTO</h1>
            </div>
            <form action="{{ route('productos.update', $producto->id) }}" method="post" id="edit-productos" class="edit"
                enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <img src="{{ $producto->imagen }}" style="max-height: 150px">
                <input type="file" name="imagen" accept="image/*">
                <input type="text" name="nombre" required placeholder="Nombre"
                    value="{{ old('nombre', $producto->nombre) }}">
                <input type="text" name="nombre_en" required placeholder="Name"
                    value="{{ old('nombre_en', $producto->nombre_en) }}">
                <div class="talla-container">
                    <label for="talla">Talla</label>
                    <input type="text" name="tallas" required placeholder="Tallas"
                        value="{{ old('tallas', $producto->tallas) }}">
                </div>
                <div class="color-container">
                    <label for="color">Color</label>
                    <input type="text" name="colores" required placeholder="Colores"
                        value="{{ old('colores', $producto->colores) }}">
                </div>
                <input type="number" name="precio" required placeholder="Precio"
                    value="{{ old('precio', $producto->precio) }}" min="5">
                <input type="text" name="categoria" required placeholder="Categoria"
                    value="{{ old('categoria', $producto->categoria) }}">
                <input type="text" name="descripcion" required placeholder="Descripción"
                    value="{{ old('descripcion', $producto->descripcion) }}">
                <input type="text" name="descripcion_en" required placeholder="Description" class="create_inputs"
                    value="{{ old('descripcion_en', $producto->descripcion_en) }}">
                <textarea name="detalle" cols="30" rows="10">{{ old('detalle', $producto->detalle) }}</textarea>
                <textarea name="detalle_en" cols="30" rows="10">{{ old('detalle_en', $producto->detalle_en) }}</textarea>
                <br>
                <div class="save">
                    <button class="boton3" type="submit">Guardar cambios</button>
                </div>
            </form>
        </div>
       
    </div>

    <script src="//js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
    <script type="text/javascript">
        bkLib.onDomLoaded(nicEditors.allTextAreas);
    </script>
@stop
