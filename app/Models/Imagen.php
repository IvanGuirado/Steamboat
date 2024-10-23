<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use RalphJSmit\Laravel\SEO\Support\HasSEO;
use RalphJSmit\Laravel\SEO\Support\SEOData;


class Imagen extends Model
{public $timestamps = false;
    protected $table ='imagenes_producto';
    protected $fillable = [
        'id',
        'id_producto',
        'color',
        'imagen',
        'orden',

    ];
    
}
