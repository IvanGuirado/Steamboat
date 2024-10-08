<div class="wrapper">
    @if (!count($data))
    <h2>{{ __('Su carrito está vacio') }}</h2>
    @else
        <form class="carrito" action="/carrito/" method="post" id="carrito-productos">
            @csrf
            @php
                $total = 0;
            @endphp
            @foreach ($data as $index => $item)
                @php
                    $producto = $item->producto;
                    $total += $item->cantidad * $producto->precio;
                    $color = 'black';
                    switch ($item->color) {
                        case 'rojo':
                            $color = 'red';
                            break;
                        case 'blanco':
                            $color = 'white';
                            break;
                        case 'gris':
                            $color = 'grey';
                            break;
                        default:
                            # code...
                            break;
                    }
                @endphp

                <div class="carrito-item" data="{{ json_encode($item->toArray()) }}">
                    <div class="data1">
                        <div><img src="{{ $producto->imagen }}"></div>
                        <div>{{ $producto->nombre }}</div>
                    </div>
                    <div class="carrito-color">
                        <p>{{ __('Color') }}</p>
                        <div class="color-recuadro" style="background: {{ $color }}"></div>
                    </div>
                    <div class="carrito-talla">
                        <p>{{ __('Talla') }}</p>
                        <div>{{ $item->talla }}</div>
                    </div>
                    <div class="carrito-cantidad">
                        <p>{{ __('Cantidad') }}</p>
                        <div><input type="number"value="{{ $item->cantidad }}" min=0 max=99 class=" cantidad"
                                data-index-carrito="{{ $index }}"></div>
                    </div>
                    <div class="carrito-precio">{{ $producto->precio }}€</div>
                    <div data-id="{{ $item->id }}" class="eliminar-carrito">{{ __('Eliminar') }}</div>
                </div>
            @endforeach

            <div class="realizar-pedido">
                <div class="total-carrito">
                    <p>{{ __('TOTAL') }}:<span>{{ $total }}</span> €</p>
                </div>
                <div class="buy-button">
                    <button>{{ __('Realizar pedido') }}</button>
                </div>
            </div>
        </form>
    @endif
</div>
<div id="items-carrito" style="display:none" >
{{count($data)}}

</div>
<data style="display: none">{{ json_encode($data->toArray()) }}</data>
