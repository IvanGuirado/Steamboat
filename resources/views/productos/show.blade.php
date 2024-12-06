@extends('layouts.plantilla')

@section('head')
    <link rel="stylesheet" href="/css\producto.css" type="text/css">
    <link rel="stylesheet" href="/css/swiper.css" type="text/css">
    <style>
        .swiper {
            width: 600px;
            height: 300px;
        }
    </style>
@stop

@section('title', '{{ $producto->nombre }}')

@php

    $lang = session()->get('lang');
    if ($lang) {
        // App::setLocale($lang);
    }

    $user = auth()->user();

    if ($user != null) {
        $lang = $user->language;
        //App::setLocale($user->language);
    }
@endphp

@section('content1')

    <div class="wrapper">
        <div class="product-container">
            <!--<div class="id">
                                                                                                                                    <h1>{{ $producto->id }}</h1>
                                                                                                                                </div>-->
            <!-- Slider main container -->
            <div class="swiper">
                <!-- Additional required wrapper -->
                <div class="swiper-wrapper" id="img-container">
                    <!-- Slides -->
                    <div class="swiper-slide"> <img src="{{ $producto->imagen }}" alt="imagen-producto" id="imagen">
                    </div>
                    ...
                </div>
                <!-- If we need pagination -->
                <div class="swiper-pagination"></div>

                <!-- If we need navigation buttons -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>

                <!-- If we need scrollbar -->
                <div class="swiper-scrollbar"></div>
            </div>

            <div class="container-information">
                <div class="container-info-product">
                    <div class="container-title">
                        <span>{{ $producto->nombre }}</span>
                        <i class="fa fa-chevron-right"></i>
                    </div>
                    <div class="container-price">
                        <span>{{ $producto->precio }}€</span>
                    </div>
                    <div class="container-details-product">
                        <div class="form-group">
                            <label for="size">{{ __('Talla') }}</label>
                            <select name="size" id="size">
                                @php
                                    $tallas = explode(',', $producto->tallas);
                                @endphp
                                @foreach ($tallas as $i => $talla)
                                    <option value="{{ $talla }}">{{ $talla }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="colour">{{ __('Color') }}</label>
                            <select name="colour" id="colour">
                                @php
                                    $colores = explode(',', $producto->colores);
                                @endphp
                                @foreach ($colores as $i => $color)
                                    <option value="{{ $color }}">{{ __($color) }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="container-add-cart">
                    <div class="container-quantity">
                        <input type="number" placeholder="1" value="1" min="1" max=99
                            class="input-quantity cantidad" />
                    </div>
                    <button class="btn-add-to-cart" data-id="{{ $producto->id }}">
                        <i class="fa-solid fa-plus"></i>
                        {{ __('Agregar al carro') }}
                    </button>
                </div>
                <div class="container-description">
                    <div class="title-description">
                        <span>{{ __('Descripción') }}</span>
                    </div>
                    <div class="text-description">
                        <p>{{ $lang == 'en' ? $producto->descripcion_en : $producto->descripcion }}</p>
                    </div>
                </div>
                <div class="container-additional-information">
                    <div class="title-additional-information">
                        <span>{{ __('Información adicional') }}</span>
                        <i class="fa fa-chevron-down"></i>
                    </div>
                    <div class="text-additional-information hidden">
                        <p>{!! $lang == 'en' ? $producto->detalle_en : $producto->detalle !!}</p>
                    </div>
                </div>
                <div class="container-reviews">
                    <div class="title-reviews">
                        <span>{{ __('Reseñas') }}</span>
                        <i class="fa fa-chevron-down"></i>
                    </div>
                    <div class="text-reviews hidden">
                        <p></p>
                    </div>
                </div>

                <div class="container-social">
                    <span>{{ __('Compartir') }}</span>
                    <div class="container-buttons-social">
                        <a href="mailto:?subject=Visita%20mi%20sitio%20web&body=Hola,%20te%20invito%20a%20visitar%20mi%20sitio%20web:%20http://steamboatbrand.com"
                            aria-label="Enviar correo">
                            <i class="fa-solid fa-envelope"></i>
                        </a>
                        <a href="https://www.facebook.com/sharer.php?u={{ url()->current() }}" target="_blank"
                            rel="noopener noreferrer" aria-label="Compartir en Facebook">
                            <i class="fa-brands fa-facebook"></i>
                        </a>
                        <a href="https://twitter.com/intent/tweet?text={{ $producto ? $producto->nombre : 'steamboat' }}&url={{ url()->current() }}&via=Steamboat"
                            target="_blank" rel="noopener noreferrer" aria-label="Compartir en Twitter">
                            <i class="fa-brands fa-square-x-twitter"></i>
                        </a>
                        </a>
                        <a href="https://www.instagram.com/?url={{ url()->current() }}" target="_blank"
                            rel="noopener noreferrer" aria-label="Ir al perfil de Instagram">
                            <i class="fa-brands fa-instagram"></i>
                        </a>
                        <a href="https://api.whatsapp.com/send?text={{ url()->current() }}" target="_blank"
                            rel="noopener noreferrer" aria-label="Compartir en WhatsApp">
                            <i class="fa-brands fa-whatsapp"></i>
                        </a>
                    </div>

                </div>
            </div>
        </div>
        <div class="container-related-products">
            <span>{{ __('Productos Relacionados') }}</span>
            <div class="card-list-products">
                @foreach ($relacionados as $item)
                    <div class="card">
                        <div class="card-img">
                            <a href="/productos/{{ $item->id }}"><img src="{{ $item->imagen }}"></a>
                        </div>
                        <div class="info-card">
                            <div class="text-product">
                                <h3>{{ $item->nombre }}</h3>
                                <p>{{ $item->categoria }}</p>
                            </div>
                            <div class="price">
                                {{ $item->precio }}€
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>

    <!--script-->
    <script type="text/javascript" src="/js\producto.js"></script>
    <script>
        //pasamos los datos del $stock a una variable de javascript llamada stock
        var stock = @json($stock);
        var imagenes = @json($imagenes);
        //creamos un objeto de disponibilidad agrupado por talla
        var disponibilidad = {};
        for (var i = 0; i < stock.length; i++) {
            if (!disponibilidad[stock[i].talla]) {
                disponibilidad[stock[i].talla] = [];
            }
            disponibilidad[stock[i].talla].push(stock[i].color);
        }
        var ImagenesPorColor = {};
        for (var i = 0; i < imagenes.length; i++) {
            if (!ImagenesPorColor[imagenes[i].color]) {
                ImagenesPorColor[imagenes[i].color] = [];
            }
            ImagenesPorColor[imagenes[i].color].push(imagenes[i].imagen);
        }
        console.log(disponibilidad);
        console.log(ImagenesPorColor);
    </script>
    <script>
        function mapearTallas() {

            //Recreamos las opciones del select de tallas en funcion de los datos de disponibilidad
            var tallas = Object.keys(disponibilidad);
            const selectTallas = document.getElementById("size");
            selectTallas.innerHTML = tallas.map(talla => `<option value="${talla}">${talla}</option>`).join("");
            //Elegimos el primer elemento del select de tallas
            selectTallas.selectedIndex = 0;

        }

        function mapearColores() {

            //Recreamos las opciones del select de colores enn funcion de los datos de disponibilidad y la talla selecionada
            var colores = disponibilidad[document.getElementById("size").value];

            const selectColores = document.getElementById("colour");
            selectColores.innerHTML = colores.map(color => `<option value="${color}">${color}</option>`).join("");
            //Elegimos el primer elemento del select de colores
            selectColores.selectedIndex = 0;
        }
        mapearTallas();
        mapearColores();

        function mapearImagenes() {

            //Recreamos las opciones del select de colores enn funcion de los datos de disponibilidad y la talla selecionada
            var imagenes = ImagenesPorColor[document.getElementById("colour").value];
            if (!imagenes) {
                imagenes = ['{{ $producto->imagen }}'];
            }
            const selectImagen = document.getElementById("img-container");
            selectImagen.innerHTML = imagenes.map(src => `<div class="swiper-slide"><img src="${src}"></div>`).join("");
            iniciarSwiper()
        }

        //Cuando cambiamos la talla selecionada, actualizamos los colores disponibles
        document.getElementById("size").addEventListener("change", function() {
            mapearColores();
        });
        document.getElementById("colour").addEventListener("change", function() {
            mapearImagenes();
        });
    </script>

    <script src="/js/swiper.js"></script>
    <script>
        let swiper = null;
        iniciarSwiper()

        function iniciarSwiper() {
            if (swiper) {
                swiper.destroy();
            }
            swiper = new Swiper('.swiper', {
                // Optional parameters
                direction: 'horizontal',
                loop: true,

                // If we need pagination
                pagination: {
                    el: '.swiper-pagination',
                },

                // Navigation arrows
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },

                // And if we need scrollbar
                scrollbar: {
                    el: '.swiper-scrollbar',
                },
            });
        }
    </script>
@stop
