import 'package:flutter/material.dart';
import '../models/producto.dart';
import '../services/inventario_service.dart';
import 'agregar_producto.dart';
import 'editar_producto.dart';
import 'detalle_producto.dart';

class ListaProductosPage extends StatefulWidget {
  const ListaProductosPage({super.key});

  @override
  State<ListaProductosPage> createState() => _ListaProductosPageState();
}

class _ListaProductosPageState extends State<ListaProductosPage> {
  final InventarioService _inventarioService = InventarioService();
  List<Producto> productos = [];

  @override
  void initState() {
    super.initState();
    cargarProductos();
  }

  Future<void> cargarProductos() async {
    final data = await _inventarioService.obtenerProductos();
    setState(() => productos = data);
  }

  Future<void> eliminarProducto(int id) async {
    await _inventarioService.eliminarProducto(id);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Producto eliminado')));
    cargarProductos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Productos')),
      body: productos.isEmpty
          ? const Center(child: Text('No hay productos registrados'))
          : ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final p = productos[index];
                return ListTile(
                  title: Text(p.nombre),
                  subtitle: Text('Precio: S/ ${p.precio} - Stock: ${p.stock}'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetalleProductoPage(producto: p),
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EditarProductoPage(producto: p),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => eliminarProducto(p.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AgregarProductoPage()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
