<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PedidoProducto extends Model
{
    protected $table="pedidos_productos";
    protected $fillable = [
        'producto_id',
        'pedido_id',
        'talla',
        'color',
        'cantidad',
        'precio_unidad',
    ];

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'producto_id');

    }

    public function pedido()
    {
        return $this->belongsTo(Pedido::class, 'pedido_id');
        
    }
    
}