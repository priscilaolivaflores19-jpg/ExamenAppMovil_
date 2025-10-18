import 'package:flutter/material.dart';
import '../models/producto.dart';
import '../services/inventario_service.dart';

class EditarProductoPage extends StatefulWidget {
  final Producto producto;
  const EditarProductoPage({super.key, required this.producto});

  @override
  State<EditarProductoPage> createState() => _EditarProductoPageState();
}

class _EditarProductoPageState extends State<EditarProductoPage> {
  final _formKey = GlobalKey<FormState>();
  final InventarioService _service = InventarioService();

  late TextEditingController nombre;
  late TextEditingController descripcion;
  late TextEditingController categoria;
  late TextEditingController precio;
  late TextEditingController stock;
  late TextEditingController proveedor;

  @override
  void initState() {
    super.initState();
    nombre = TextEditingController(text: widget.producto.nombre);
    descripcion = TextEditingController(text: widget.producto.descripcion);
    categoria = TextEditingController(text: widget.producto.categoria);
    precio = TextEditingController(text: widget.producto.precio.toString());
    stock = TextEditingController(text: widget.producto.stock.toString());
    proveedor = TextEditingController(text: widget.producto.proveedor);
  }

  void actualizarProducto() async {
    await _service.actualizarProducto(widget.producto.id, {
      'nombre': nombre.text,
      'descripcion': descripcion.text,
      'categoria': categoria.text,
      'precio': precio.text,
      'stock': stock.text,
      'proveedor': proveedor.text,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Producto actualizado correctamente')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Producto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nombre,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextFormField(
                controller: descripcion,
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
              TextFormField(
                controller: categoria,
                decoration: const InputDecoration(labelText: 'Categoría'),
              ),
              TextFormField(
                controller: precio,
                decoration: const InputDecoration(labelText: 'Precio'),
              ),
              TextFormField(
                controller: stock,
                decoration: const InputDecoration(labelText: 'Stock'),
              ),
              TextFormField(
                controller: proveedor,
                decoration: const InputDecoration(labelText: 'Proveedor'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: actualizarProducto,
                child: const Text('Actualizar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
