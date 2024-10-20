<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use RalphJSmit\Laravel\SEO\Support\HasSEO;
use RalphJSmit\Laravel\SEO\Support\SEOData;


class Producto extends Model
{
    use HasSEO;
    use HasFactory;
    protected $fillable = [
        'id',
        'imagen',
        'nombre',
        'nombre_en',
        'descripcion',
        'descripcion_en',
        'detalle',
        'detalle_en',
        'categoria',
        'precio',

    ];
    // 
public function getDynamicSEOData(): SEOData
{
    return new SEOData(
        title: $this->nombre,
        description: $this->descripcion,
        author: "Steamboat",
        image:$this->imagen,
    );
}
}
