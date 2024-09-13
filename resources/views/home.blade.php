@extends('layouts.plantilla')

@section('title', 'home')

@section('content1')
    <div class="wrapper_home">
        <div class="seccion1">
            <div class="home-layout-box-1">
                <div class="menu-imgs">
                    <div class="categoria">
                        <p>{{__("NOVEDADES")}}</p>
                        <a href="/productos?categoria=verano">
                            <button>{{__("VER")}}</button>
                        </a>
                    </div>
                </div>
            </div>
            <!--<div class="home-layout-box-2">
                <div class="menu-imgs">
                    <div class="categoria">
                        <a href="/productos?categoria=invierno">
                            <button>INVIERNO</button>
                        </a>
                    </div>
                </div>
            </div>-->
        </div>
    @endsection
    @section('content2')
            <div class="seccion2">
                <div class="home-layout-box-3">
                    <div class="menu-imgs">
                        <div class="categoria">
                            <p>{{__("SUDADERAS")}}</p>
                            <a href="/productos?categoria=sudaderas">
                                <button>{{__("VER MÁS")}}</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="home-layout-box-4">
                    <div class="menu-imgs">
                        <div class="categoria">
                            <p>{{__("CAMISETAS")}}</p>
                            <a href="/productos?categoria=camisetas">
                                <button>{{__("VER MÁS")}}</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="home-layout-box-5">
                    <div class="menu-imgs">
                        <div class="categoria">
                            <p>{{__("SUDADERAS CON CAPUCHA")}}</p>
                            <a href="/productos?categoria=hoodies">
                                <button>{{__("VER MÁS")}}</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="home-layout-box-6">
                    <div class="menu-imgs">
                        <div class="categoria">
                            <p>{{__("GORRAS")}}</p>
                            <a href="/productos?categoria=gorras">
                                <button>{{__("VER MÁS")}}</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
    @endsection
