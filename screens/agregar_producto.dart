import 'package:flutter/material.dart';
import '../services/inventario_service.dart';

class AgregarProductoPage extends StatefulWidget {
  const AgregarProductoPage({super.key});

  @override
  State<AgregarProductoPage> createState() => _AgregarProductoPageState();
}

class _AgregarProductoPageState extends State<AgregarProductoPage> {
  final _formKey = GlobalKey<FormState>();
  final InventarioService _service = InventarioService();

  final TextEditingController nombre = TextEditingController();
  final TextEditingController descripcion = TextEditingController();
  final TextEditingController codigoBarras = TextEditingController();
  final TextEditingController categoria = TextEditingController();
  final TextEditingController precio = TextEditingController();
  final TextEditingController stock = TextEditingController();
  final TextEditingController proveedor = TextEditingController();

  void guardarProducto() async {
    if (_formKey.currentState!.validate()) {
      await _service.agregarProducto({
        'nombre': nombre.text,
        'descripcion': descripcion.text,
        'codigo_barras': codigoBarras.text,
        'categoria': categoria.text,
        'precio': precio.text,
        'stock': stock.text,
        'proveedor': proveedor.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Producto agregado correctamente')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Producto')),
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
                controller: codigoBarras,
                decoration: const InputDecoration(
                  labelText: 'Código de Barras',
                ),
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
                onPressed: guardarProducto,
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
