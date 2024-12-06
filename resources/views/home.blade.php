@extends('layouts.plantilla')

@section('title', 'home')

@section('head')
    <link rel="stylesheet" href="/css\home.css" type="text/css">
    <link rel="stylesheet" href="/css/swiper.css" type="text/css">
    <style>
        .swiper {
            width: 300px;
            height: 350px;
        }
    </style>
@stop

@section('content0')
    <div class="video-top">
        <video src="/video/horizontal.m4v" autoplay muted loop width="100%"></video>
    </div>
@endsection

@section('content1')
    <div class="productos_destacados">
        @foreach ($destacados as $producto)
            <a href="/productos/{{ $producto->id }}">
                <div class="imagen-estatica">
                    <div class="producto-imagen">
                        <img src="{{ $producto->imagen }}">
                    </div>

                    <div class="titulo">{{ $producto->nombre }}</div>
                </div>
                <div class="swiper">
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper">
                        <!-- Slides -->
                        <div class="swiper-slide"> <img src="/img/hombre.jpg" alt="camiseta"></div>
                        <div class="swiper-slide"> <img src="/img/black.JPG" alt="camiseta"></div>

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
            </a>
        @endforeach
    </div>
@endsection

@section('content2')
    <div class="seccion2">
        <div class="home-layout-box-3">
            <div class="menu-imgs">
                <div class="categoria">
                    <p>{{ __('SUDADERAS') }}</p>
                    <a href="/productos?categoria=sudaderas">
                        <button>{{ __('VER MÁS') }}</button>
                    </a>
                </div>
            </div>
        </div>
        <div class="home-layout-box-4">
            <div class="menu-imgs">
                <div class="categoria">
                    <p>{{ __('CAMISETAS') }}</p>
                    <a href="/productos?categoria=camisetas">
                        <button>{{ __('VER MÁS') }}</button>
                    </a>
                </div>
            </div>
        </div>
        <div class="home-layout-box-5">
            <div class="menu-imgs">
                <div class="categoria">
                    <p>{{ __('SUDADERAS CON CAPUCHA') }}</p>
                    <a href="/productos?categoria=hoodies">
                        <button>{{ __('VER MÁS') }}</button>
                    </a>
                </div>
            </div>
        </div>
        <div class="home-layout-box-6">
            <div class="menu-imgs">
                <div class="categoria">
                    <p>{{ __('GORRAS') }}</p>
                    <a href="/productos?categoria=gorras">
                        <button>{{ __('VER MÁS') }}</button>
                    </a>
                </div>
            </div>
        </div>
    </div>

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
@endsection
