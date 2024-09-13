<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Carrito extends Model
{
    use HasFactory;
    protected $table = 'carrito';
    protected $fillable = [
        'id_user',
        'id_producto',
        'color',
        'talla',
        'cantidad',
    ];

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'id_producto');
    }
}
