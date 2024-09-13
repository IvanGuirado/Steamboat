<?php

namespace Database\Seeders;

use App\Models\Producto;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        for ($i = 1; $i <= 200; $i++) {
            $data = $this->generateRandomData();
            Producto::create($data);
        }
    }

    private function generateRandomData()
    {
        $faker = \Faker\Factory::create();
        $categorias = ['Hombre', 'Mujer', 'Camisetas', 'Verano', 'Invierno', 'sudaderas','gorras'];
        $categoria=$faker->randomElement($categorias) . ',' . $faker->randomElement($categorias);
        return [
            'nombre' => $faker->text(10), 'categoria' => $categoria,
            'descripcion' => $faker->paragraph(1), 'precio' => $faker->numberBetween(5,50), 'detalle' => $faker->text(20), 'imagen' => $faker->imageUrl(500, 500, $categoria)
        ];
    }
}
