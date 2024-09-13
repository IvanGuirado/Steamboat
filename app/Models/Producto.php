<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'imagen',
        'nombre',
        'nombre_en',
        'colores',
        'tallas',
        'descripcion',
        'descripcion_en',
        'detalle',
        'detalle_en',
        'categoria',
        'precio',
        'stock',

    ];
}
