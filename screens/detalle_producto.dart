import 'package:flutter/material.dart';
import '../models/producto.dart';

class DetalleProductoPage extends StatelessWidget {
  final Producto producto;
  const DetalleProductoPage({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(producto.nombre)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Descripción: ${producto.descripcion}'),
              Text('Código de barras: ${producto.codigoBarras}'),
              Text('Categoría: ${producto.categoria}'),
              Text('Precio: S/ ${producto.precio}'),
              Text('Stock: ${producto.stock}'),
              Text('Proveedor: ${producto.proveedor}'),
            ],
          ),
        ),
      ),
    );
  }
}
