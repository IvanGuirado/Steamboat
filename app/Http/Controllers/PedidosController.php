<?php

namespace App\Http\Controllers;

use App\Models\Pedido;
use App\Models\PedidoProducto;
use Illuminate\Http\Request;

class PedidosController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {

        $estado = $request->input('estado');
        if (!$estado)
            $pedidos = Pedido::paginate(12);
        else {
            $pedidos = Pedido::where('estado', "=", "%$estado%");
            $pedidos = $pedidos->paginate(12)->appends(['estado' => $estado]);
        }


        return view('pedidos.index', compact('pedidos'));
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $pedido = Pedido::findOrFail($id); // Assuming you have a Product model
        $productos = PedidoProducto::where("pedido_id", $id)->get();
        return view('pedidos.show', ['pedido' => $pedido, 'productos' => $productos]);
    }

    public function edit($id)
    {

        $pedido = Pedido::findOrFail($id);
        return view('pedidos.edit', ['pedido' => $pedido]);
    }



    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $pedido = Pedido::findOrFail($id);
        $pedido->direccion_envio = $request->input('direccion_envio');
        $pedido->estado = $request->input('estado');
        $pedido->notas = $request->input('notas');

        // Actualiza otros campos del producto según sea necesario
        $pedido->save();

        return redirect('/pedidos')->with('success', 'Pedido actualizado correctamente');
    }

    public function destroy($id)
    {
        $pedido = Pedido::findOrFail($id);
        $pedido->delete();
        return 'Pedido eliminado';
    }
    public function pedido(Request $request)
    {
        $productos = Pedido::paginate(25);
        return view('pedidos', compact('pedidos'));
    }
}
