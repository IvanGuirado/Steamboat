<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    protected $fillable = [
        'user_id',
        'total',
        'notas',
        'estado',
        'direccion_envio',
    ];

    public function usuario()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
