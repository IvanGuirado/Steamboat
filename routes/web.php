<?php

use App\Http\Controllers\AutentificacionController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CarritoController;
use App\Http\Controllers\InformacionController;
use App\Http\Controllers\DataController;
use App\Http\Controllers\PedidosController;
use App\Http\Controllers\IdiomaController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('home');
});
Route::get('home', HomeController::class, 'home');
Route::get('/quienesSomos', [InformacionController::class,'quienesSomos'])->name('quines_somos');
Route::get('/devolucion', [InformacionController::class,'devoluciones'])->name('devoluciones');
//PRODUCTO
Route::get('/buscar', [ProductController::class,'buscar'])->name('productos.buscar');
Route::get('/productos', [ProductController::class,'index'])->name('productos.index');
Route::get('/productos/create', [ProductController::class,'create'])->name('productos.create');
Route::post('/productos', [ProductController::class,'store'])->name('productos.store');
Route::delete('/productos/{id}', [ProductController::class,'destroy'])->name('productos.destroy');
Route::get('/productos/{id}', [ProductController::class,'show'])->name('productos.show');
Route::get('/productos/{id}/edit', [ProductController::class, 'edit'])->name('productos.edit');
Route::get('/productos/{id}/stock', [ProductController::class, 'stock'])->name('productos.stock');
Route::get('/admin', [ProductController::class,'list'])->name('productos.list');
Route::put('/productos/{id}', [ProductController::class, 'update'])->name('productos.update');
Route::put('/productos/{id}/stock', [ProductController::class, 'updateStock'])->name('productos.updateStock');


//USUARIO
Route::get('/registro',[AutentificacionController::class, 'registro'])->name('registro');
Route::get('/datos',[DataController::class, 'datos'])->name('datos');
Route::post('/datos',[DataController::class, 'datosUpdate'])->name('datos.update');

//CARRITO
Route::get('/carrito',[CarritoController::class, 'index'])->name('carrito');
Route::get('/carrito/list',[CarritoController::class, 'list'])->name('carrito.list');
Route::get('/carrito/json',[CarritoController::class, 'listJson'])->name('carrito.json');
Route::post('/carrito',[CarritoController::class, 'carritoCreate'])->name('carrito.create');
Route::get('/carrito/verificarUsuario',[CarritoController::class, 'verificarUsuario'])->name('verificar.usuario');
Route::post('/carrito/direccion',[CarritoController::class, 'direccionEnvio'])->name('carrito.direccion');
Route::post('/carrito/pagar',[CarritoController::class, 'pagar'])->name('pagar');
Route::post('/carrito/efectuarCompra',[CarritoController::class, 'efectuarCompra'])->name('efectuarCompra');
Route::post('/carrito/{id}',[CarritoController::class, 'carritoUpdate'])->name('carrito.update');
Route::delete('/carrito/{id}',[CarritoController::class, 'carritoDelete'])->name('carrito.delete');

//PEDIDOS
Route::get('/pedidos',[PedidosController::class, 'index'])->name('pedidos');
Route::get('/pedidos/{id}', [PedidosController::class,'show'])->name('pedidos.show');
Route::get('/pedidos/{id}/edit', [PedidosController::class, 'edit'])->name('pedidos.edit');
Route::post('/pedidos/{id}', [PedidosController::class, 'update'])->name('pedidos.update');
Route::delete('/pedidos/{id}', [PedidosController::class,'destroy'])->name('pedidos.destroy');

//LOGIN
Route::post('/registro/registrarse',[AutentificacionController::class, 'registrarse'])->name('registro.store');
Route::get('/login',[AutentificacionController::class, 'login'])->name('login');
Route::post('/login/autorizar',[AutentificacionController::class, 'autorizar'])->name('login.autorizar');
Route::get('/logout',[AutentificacionController::class, 'logout'])->name('logout');

//IDIOMAS
Route::get('/setIdioma/{lang}',[IdiomaController::class,'setIdioma'])->name('setLang');





