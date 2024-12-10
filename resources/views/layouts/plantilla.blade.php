<!DOCTYPE html>
@php

    $lang = session()->get('lang');
    if ($lang) {
        //App::setLocale($lang);
    }

    $user = auth()->user();

    if ($user != null) {
        $lang = $user->language;
        //App::setLocale($user->language);
    }
@endphp
<html lang="{{ $lang ?? 'es' }}">

<head>

    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv=x-ua-compatible content="ie=edge">
    {!! seo($producto ?? null) !!}
    <link rel="stylesheet" href="/css\menu.css" type="text/css">
    <link rel="stylesheet" href="/css\login.css" type="text/css">
    <link rel="stylesheet" href="/css\pagination.css" type="text/css">
    <link rel="stylesheet" href="/css\edit.css" type="text/css">
    <link rel="stylesheet" href="/css\datos.css" type="text/css">
    <link rel="stylesheet" href="/css\direccion.css" type="text/css">
    <link rel="stylesheet" href="/css\devolucion.css" type="text/css">
    <link rel="stylesheet" href="/css\css_pedido\pedido.css" type="text/css">
    <link rel="stylesheet" href="/css\css_pedido\edit_pedido.css" type="text/css">
    <link rel="stylesheet" href="/css/idioma.css" type="text/css">
    @yield('head')
    <script src="https://kit.fontawesome.com/5d8f6b66f9.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
        window.CSRF_TOKEN = '{{ csrf_token() }}';
        window.lang = "{{ $lang ?? 'es' }}";
    </script>
    <title>@yield('title')</title>
</head>

<body>
    <article>
        <header>
            <nav class="navegador-menu">
                <div class="ctn-nav">
                    <div class="nav-bar">
                        <div class="logo">
                            <a href="/home"><img src="/img/Logo Blanco.svg" alt="Steamboat" /></a>
                        </div>

                        <!-- Menú Móvil -->
                        <div class="menu-item"> <!-- Aquí está el menu-item -->
                            <div class="mobile-menu">
                                <label for="menu-toggle" class="menu-icon">
                                    <i class="fa fa-bars"></i>
                                </label>
                                <input type="checkbox" id="menu-toggle">
                                <div class="menu">
                                    <i class="fa-solid fa-xmark" id="close"></i>
                                    <ul>
                                        <li class="nav-tap hombre">
                                            <span class="dropdown-selector">{{ __('Hombre') }}</span>
                                            <i class="fa fa-chevron-right dropdown-selector" id="show-man"></i>
                                            <div class="dropdown-menu dropdown-menu-nav" id="hombreDropdown">
                                                <a
                                                    href="/productos?categoria=camisetas,hombre">{{ __('Camisetas') }}</a>
                                                <a
                                                    href="/productos?categoria=sudaderas,hombre">{{ __('Sudaderas') }}</a>
                                                <a href="/productos?categoria=hoodies,hombre">{{ __('Hoddies') }}</a>
                                                <a
                                                    href="/productos?categoria=banadores,hombre">{{ __('Bañadores') }}</a>
                                                <a
                                                    href="/productos?categoria=accesorios,hombre">{{ __('Accesorios') }}</a>
                                            </div>
                                        </li>

                                        <li class="nav-tap mujer">
                                            <span class="dropdown-selector">{{ __('Mujer') }}</span>
                                            <i class="fa fa-chevron-right dropdown-selector" id="show-woman"></i>
                                            <div class="dropdown-menu dropdown-menu-nav" id="mujerDropdown">
                                                <a
                                                    href="/productos?categoria=camisetas,mujer">{{ __('Camisetas') }}</a>
                                                <a
                                                    href="/productos?categoria=sudaderas,mujer">{{ __('Sudaderas') }}</a>
                                                <a href="/productos?categoria=hoodies,mujer">{{ __('Hoddies') }}</a>
                                                <a
                                                    href="/productos?categoria=banadores,mujer">{{ __('Bañadores') }}</a>
                                                <a
                                                    href="/productos?categoria=accesorios,mujer">{{ __('Accesorios') }}</a>
                                            </div>
                                        </li>
                                        <li class="nav-tap quienes"><a
                                                href="/quienesSomos"><span>{{ __('Quienes somos') }}</span></a></li>
                                        <li class="nav-tap ayuda"><span
                                                class="dropdown-selector">{{ __('Ayuda') }}</span>
                                            <i class="fa fa-chevron-right dropdown-selector" id="show-ayuda"></i>
                                            <div class="dropdown-menu dropdown dropdown-menu-nav" id="ayudaDropdown">
                                                <a href="/devolucion">{{ __('Cambios y devoluciones') }}</a>
                                                <a href="/guiaDeTallas">{{ __('Guía de tallas') }}</a>
                                            </div>
                                        </li>
                                        <!-- Idiomas para móvil -->
                                        <li class="nav-tap idiomas">
                                            <div class="language-bar-container">
                                                <ul class="idiomas">
                                                    <li><a href="?lang=es"
                                                            class="language-option">{{ __('Español') }}</a></li>
                                                    <li><a href="?lang=en"
                                                            class="language-option">{{ __('Inglés') }}</a></li>
                                                    <li><a href="?lang=fr"
                                                            class="language-option">{{ __('Francés') }}</a></li>
                                                </ul>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                                <div class="modal" id="backdrop"></div>
                            </div>
                        </div> <!-- Fin del menu-item para móvil -->

                        <!-- Menú de Escritorio -->
                        <div class="desktop-menu"> <!-- Menú de escritorio -->
                            <ul>
                                <li class="nav-tap hombre">
                                    <span class="dropdown-selector">{{ __('Hombre') }}</span>
                                    <div class="dropdown-menu dropdown-menu-nav" id="hombreDropdown">
                                        <a href="/productos?categoria=camisetas,hombre">{{ __('Camisetas') }}</a>
                                        <a href="/productos?categoria=sudaderas,hombre">{{ __('Sudaderas') }}</a>
                                        <a href="/productos?categoria=hoodies,hombre">{{ __('Hoddies') }}</a>
                                        <a href="/productos?categoria=banadores,hombre">{{ __('Bañadores') }}</a>
                                        <a href="/productos?categoria=accesorios,hombre">{{ __('Accesorios') }}</a>
                                    </div>
                                </li>

                                <li class="nav-tap mujer">
                                    <span class="dropdown-selector">{{ __('Mujer') }}</span>
                                    <div class="dropdown-menu dropdown-menu-nav" id="mujerDropdown">
                                        <a href="/productos?categoria=camisetas,mujer">{{ __('Camisetas') }}</a>
                                        <a href="/productos?categoria=sudaderas,mujer">{{ __('Sudaderas') }}</a>
                                        <a href="/productos?categoria=hoodies,mujer">{{ __('Hoddies') }}</a>
                                        <a href="/productos?categoria=banadores,mujer">{{ __('Bañadores') }}</a>
                                        <a href="/productos?categoria=accesorios,mujer">{{ __('Accesorios') }}</a>
                                    </div>
                                </li>
                                <li class="nav-tap quienes"><a
                                        href="/quienesSomos"><span>{{ __('Quienes somos') }}</span></a>
                                <li class="nav-tap ayuda"><span class="dropdown-selector">{{ __('Ayuda') }}</span>
                                    <i class="fa fa-chevron-right dropdown-selector" id="show-ayuda"></i>
                                    <div class="dropdown-menu dropdown dropdown-menu-nav" id="ayudaDropdown">
                                        <a href="/devolucion">{{ __('Cambios y devoluciones') }}</a>
                                        <a href="/guiaDeTallas">{{ __('Guía de tallas') }}</a>
                                    </div>
                                </li>
                                <!-- Idiomas para escritorio -->
                                <li class="nav-tap idiomas">
                                    <div class="language-bar-container">
                                        <ul class="idiomas"></ul>
                                    </div>
                                    <div>
                                        <section class="language" id="hover-dropdown">
                                            <!--<h2>Idioma</h2>-->
                                        </section>
                                        <section class="language" id="click-dropdown">
                                            <!--<h2>Click dropdown</h2>-->
                                        </section>
                                    </div>
                                </li>

                            </ul>
                        </div>

                        <!-- Elementos comunes (Carrito, Búsqueda, Usuario) -->
                        <div class="common-elements">
                            <!-- Carrito -->
                            <div class="shoppingcart-ctn menu-item" alt="carrito">
                                <div class="boton-carrito dropdown-selector">
                                    <div class="badge badge-empty"></div>
                                    <i class="fa fa-shopping-cart" id="cart-icon"></i>
                                </div>
                                <div class="burbuja" id="burbuja"></div>
                            </div>

                            <!-- Búsqueda -->
                            <div class="search menu-item">
                                <a href="#search-modal" class="fa fa-search" id="search-enlace"></a>
                                <div class="modal" id="search-modal">
                                    <div class="search-form-content">
                                        <a class="close" href="#">&times;</a>
                                        <form action="/buscar" id="Buscar" class="search-nav">
                                            <input type="search" name="buscar" class="search-data" required
                                                placeholder="{{ __('Buscar') }}">
                                            <input type="submit" value="{{ __('Buscar') }}" id="searchButton">
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- Usuario -->
                            <div class="user-menu-container">
                                <i class="fa-solid fa-user dropdown-selector" id="user-icon"></i>
                                <div class="dropdown-menu dropdown-menu-user dropdown" id="userDropdown">
                                    @guest
                                        <div class="user-container" alt="usuario">
                                            <a href="/login">{{ __('Iniciar sesión') }}</a>
                                        </div>
                                    @endguest
                                    @Auth
                                        <a href="/datos">{{ __('Perfil') }}</a>
                                        <a href="/logout">{{ __('Cerrar sesión') }}</a>
                                    </div>
                                @endAuth
                            </div>
                        </div>
                    </div>

                    <!-- Fin del menú de escritorio -->


                </div>
            </nav>
        </header>


        <div class="content">
            @yield('content0')
            @yield('content1')
            @yield('content2')
            @yield('content3')
        </div>
        <div class="off-canvas">
            <div class="off-canvas-header">
                <h4 class="off-canvas-title">
                    {{ __('CARRITO DE COMPRA') }}
                </h4>
                <div data-bs-dismiss="off-canvas" aria-label="Close">
                    <div class="icon-close"></div>
                </div>
            </div>
            <div class="off-canvas-body"></div>
        </div>
        <footer>
            <div class="footer-content">
                <div class="foot">
                    <div class="left_box">
                        <div class="social_cnt">
                            <div class="social">
                                <a href="#"><i class="fa fa-facebook-official" aria-hidden="true"
                                        alt="face"></i></a>
                                <a href="https://www.instagram.com/steamboat_brand" alt="instagram"><i
                                        class="fa fa-instagram" aria-hidden="true"></i></a>
                                <a href="#" alt="X"><i class="fa fa-x" aria-hidden="true"></i></a>
                                <a href="#" alt="linkedin"><i class="fa fa-linkedin"aria-hidden="true"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="center_box">
                        <div class="enlaces_cnt">
                            <h1>{{ __('ASISTENCIA') }}</h1>
                            <a href="#">{{ __('Envios') }}</a>
                            <a href="/#">{{ __('Cambios y Devoluciones') }}</a>
                            <a href="#">{{ __('Guía de tallas') }}</a>
                        </div>
                    </div>
                    <div class="right_box">
                        <div class="enlaces_cnt">
                            <h1>{{ __('TÉRMINOS Y POLÍTICA') }}</h1>
                            <a href="About.html">{{ __('Términos y condiciones') }}</a>
                            <a href="contacto.html">{{ __('Política de cookies') }}</a>
                            <a href="contacto.html">{{ __('Política de privacidad') }}</a>
                        </div>
                    </div>

                </div>

                <div class="last-footer">
                    <a href="#" class="copyright">{{ __('Copyright 2023. Steamboat') }}</a>
                </div>
        </footer>
        <!--SCRIPTS-->
        <script type="text/javascript" src="/js\app.js"></script>
        <script type="text/javascript" src="/js\carrito.js"></script>
        <script type="text/javascript" src="/js\stock.js" defer></script>
        <script src="js/vendor/sortable.js"></script>
        <script src="js/vendor/sortable.a11y.js"></script>
    </article>
</body>

</html>
