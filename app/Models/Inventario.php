<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use RalphJSmit\Laravel\SEO\Support\HasSEO;
use RalphJSmit\Laravel\SEO\Support\SEOData;


class Inventario extends Model
{
    protected $table ='inventario';
    protected $fillable = [
        'id_producto',
        'talla',
        'color',
        'cantidad',

    ];
    
}
