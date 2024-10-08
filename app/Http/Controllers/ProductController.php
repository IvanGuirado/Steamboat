<?php

namespace App\Http\Controllers;

use App\Models\Producto;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {

        $categoria = $request->input('categoria');
        if (!$categoria)
            $productos = Producto::paginate(12);
        else {
            $categorias = explode(',', $categoria);
            $productos = Producto::where('categoria', 'LIKE', "%{$categorias[0]}%");
            for ($i = 1; $i < count($categorias); $i++) {
                $productos = $productos->where('categoria', 'LIKE', "%{$categorias[$i]}%");
            }
            $productos = $productos->paginate(12)->appends(['categoria' => $categoria]);
        }


        return view('productos.index', compact('productos'));
    }
    public function buscar(Request $request)
    {

        $buscar = $request->input('buscar');
        $productos = Producto::where('nombre', 'LIKE', "%$buscar%")->orWhere('descripcion', 'LIKE', "%$buscar%")->orWhere('colores', 'LIKE', "%$buscar%")->orWhere('tallas', 'LIKE', "%$buscar%")->orWhere('categoria', 'LIKE', "%$buscar%")->paginate(12)->appends(['buscar' => $buscar]);
        return view('productos.buscar', compact('productos'));
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        
        return view('productos.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'nombre' => ['required', 'regex:/^[A-Za-z\sñáéíóúÁÉÍÓÚ]*$/', 'max:50'],
            'nombre_en' => ['required', 'regex:/^[A-Za-z\sñáéíóúÁÉÍÓÚ]*$/', 'max:50'],
            'colores' => ['required', 'regex:/^[,A-Za-z\sñáéíóúÁÉÍÓÚ]*$/', 'max:70'],
            'tallas' => ['required', 'regex:/^[,A-Za-z\s]*$/', 'max:20'],
            'descripcion' => ['required', 'max:200'],
            'descripcion_en' => ['required', 'max:200'],
            'imagen' => 'required|max:300000',
            'detalle' => ['required', 'max:999'],
            'detalle_en' => ['required', 'max:999'],
            'categoria' => ['required', 'max:100'],
            'precio' => ['required', 'regex:/^[0-9\s]*$/', 'numeric', 'min:10', 'max:999'],
            'stock' => ['required', 'numeric', 'min:0', 'max:999'],
        ]);
        $fileName = $request->file('imagen')->getClientOriginalName();
        $request->file('imagen')->move(public_path('uploads'), $fileName);
        $validatedData['imagen'] = "/uploads/$fileName";
        $producto = Producto::create($validatedData);

        return redirect()->route('productos.index')
            ->with('success', 'Product created successfully');
    }


    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $producto = Producto::findOrFail($id); // Assuming you have a Product model
        $categorias = explode(',', $producto->categoria);
        $relacion = Producto::whereNot('id', $producto->id)->where(function ($query) use ($categorias) {
            $query->where("categoria", 'LIKE', '%' . trim($categorias[0]) . '%');
            if ($categorias[1] ?? null) {
                $query = $query->orWhere("categoria", 'LIKE', '%' . trim($categorias[1]) . '%');
            }
            if ($categorias[2] ?? null) {
                $query = $query->orWhere("categoria", 'LIKE', '%' . trim($categorias[2]) . '%');
            }
        });
        
        return view('productos.show', ['producto' => $producto, 'relacionados' => $relacion->take(4)->get()]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {

        $producto = Producto::findOrFail($id);
        return view('productos.edit', ['producto' => $producto]);
    }



    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {

        $validatedData = $request->validate([
            'nombre' => ['required', 'regex:/^[A-Za-z\sñáéíóúÁÉÍÓÚ]*$/', 'max:50'],
            'colores' => ['required', 'regex:/^[,A-Za-z\sñáéíóúÁÉÍÓÚ]*$/', 'max:70'],
            'tallas' => ['required', 'regex:/^[,A-Za-z\s]*$/', 'max:20'],
            'descripcion' => ['required', 'max:200'],
            'imagen' => 'max:300000',
            'detalle' => ['required', 'max:999'],
            'categoria' => ['required', 'max:100'],
            'precio' => ['required', 'regex:/^[0-9\s]*$/', 'numeric', 'min:10', 'max:999'],
            'stock' => ['required', 'numeric', 'min:0', 'max:999'],
        ]);
        $producto = Producto::findOrFail($id);
        $producto->nombre = $request->input('nombre');
        $producto->colores = $request->input('colores');
        $producto->tallas = $request->input('tallas');
        $producto->descripcion = $request->input('descripcion');
        $producto->detalle = $request->input('detalle');
        $producto->categoria = $request->input('categoria');
        $producto->precio = $request->input('precio');
        $producto->stock = $request->input('stock');
        if ($request->imagen) {
            $fileName = $request->file('imagen')->getClientOriginalName();
            $request->file('imagen')->move(public_path('uploads'), $fileName);
            $producto->imagen = "/uploads/$fileName";
        }

        // Actualiza otros campos del producto según sea necesario
        $producto->save();

        return redirect('/productos')->with('success', 'Producto actualizado correctamente');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $producto = Producto::findOrFail($id);
        $producto->delete();
        return 'Producto eliminado';
    }

    public function stock(Request $request)
    {
        $productos = Producto::paginate(25);
        return view('productos.stock', compact('productos'));
    }
}
