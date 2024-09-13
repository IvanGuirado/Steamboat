<?php

namespace App\Http\Controllers;

use App\Models\Producto;
use Illuminate\Http\Request;
use App\Models\Carrito;
use App\Models\Pedido;
use App\Models\User;
use App\Models\PedidoProducto;
use App\Mail\ProductoEnviadoEmail;
use Illuminate\Support\Facades\Mail;


class CarritoController extends Controller
{
    public function index()
    {
        return view('carrito');
    }

    public function carritoCreate(Request $request)
    {

        $idProducto = $request->input("idProducto");
        $color = $request->input("color");
        $talla = $request->input("talla");
        $cantidad = $request->input("cantidad");
        $user = auth()->user();
        if (!$user) {
            return response()->json(['Mensaje' => 'Debes iniciar sesión'], 401);
        }

        $carrito = Carrito::where('id_user', $user->id)->where('id_producto', $idProducto)->where('talla', $talla)->where('color', $color)->first();
        if ($carrito) {
            $carrito->cantidad += $cantidad;
            $carrito->save();
        } else {
            Carrito::create(['id_producto' => $idProducto, 'id_user' => $user->id, 'cantidad' => $cantidad, "color" => $color, "talla" => $talla]);
        }
        return response()->json(['Mensaje' => 'Se ha añadido el producto al carrito'], 200);
    }


    public function list()
    {
        $user = auth()->user();
        if (!$user) {
            return response()->json(['Mensaje' => 'Debes iniciar sesión'], 401);
        }
        $data = Carrito::where('id_user', $user->id)->with('producto')->get();
        return view('carrito', compact('data'));
    }

    public function listJson()
    {
        $user = auth()->user();
        if (!$user) {
            return response()->json(['Mensaje' => 'Debes iniciar sesión'], 401);
        }
        $data = Carrito::where('id_user', $user->id)->with('producto')->get();
        return response()->json(['data' => $data->toArray()], 200);
    }

    public function carritoDelete($id)
    {
        $c = Carrito::findOrFail($id);
        $c->delete();
    }

    public function carritoUpdate(Request $request, $id)
    {
        $color = $request->input("color");
        $talla = $request->input("talla");
        $cantidad = $request->input("cantidad");
        $carrito = Carrito::findOrFail($id);
        $carrito->update(["color" => $color, "talla" => $talla, "cantidad" => $cantidad]);
        return response()->json(['Mensaje' => 'Carrito actualizado'], 200);
    }


    public function direccionEnvio()
    {
        $user = auth()->user();
        if (!$user) {
            abort(401, "Inicie sesión");
        }

        return view("direccion", ['user' => $user]);
    }


    public function pagar(Request $request)
    {

        $user = auth()->user();
        if (!$user) {
            abort(401, "Inicie sesión");
        }
        $direccion = [
            'address' => $request->address,
            'province' => $request->province,
            'pc' => $request->pc,
            'country' => $request->country,
            'city' => $request->city
        ];
        //Guardamos direccion de envio en datos de usuario
        if ($request->guardarDatos == 'on') {
            $user->update($direccion);
        }
        session(["direccion" => $direccion]);
        return view("pagar");
    }


    public function efectuarCompra()
    {
        $user = auth()->user();
        if (!$user) {
            abort(401, "Inicie sesión");
        }

        $idUser = $user->id;
        //pasar items del carrito actual a un nuevo pedido en la base de datos
        $data = Carrito::where('id_user', $idUser)->with('producto')->get();

        //Calculamos el total del pedido
        $total = 0;
        foreach ($data as $index => $item) {
            $producto = $item->producto;
            $total += $item->cantidad * $producto->precio;
        }

        //Obtenemos la direccion de envio del usuario
        $direccion_envio = session("direccion");
        $user->address = $direccion_envio["address"];
        $user->city = $direccion_envio["city"];
        $user->pc = $direccion_envio["pc"];
        $user->country = $direccion_envio["country"];
        $user->province = $direccion_envio["province"];

        $direccion_envio=$user->direccion();

        //Creamos el pedido
        $pedido = Pedido::create([
            "user_id" => $idUser,
            "total" => $total,
            "direccion_envio" => $direccion_envio

        ]);

        //Creamos los items del pedido
        foreach ($data as $index => $item) {
            $producto = $item->producto;
            PedidoProducto::create([
                "producto_id" => $producto->id,
                "pedido_id" => $pedido->id,
                "talla" => $item->talla,
                "color" => $item->color,
                "cantidad" => $item->cantidad,
                "precio_unidad" => $producto->precio

            ]);
        }

        //generar correo y enviarlo
        $pemail = new ProductoEnviadoEmail($user->name, $direccion_envio, $pedido->id);
        Mail::to($user->email)->send($pemail);
        //borrar carrito enviar correo 
        Carrito::where("id_user", $idUser)->delete();
        return view("pedidoRealizadoCorrectamente");
    }
}
