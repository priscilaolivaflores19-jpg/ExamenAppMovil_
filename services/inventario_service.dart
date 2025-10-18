import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/producto.dart';

class InventarioService {
  final String baseUrl = "http://localhost/api_inventario/api_inventario.php";

  Future<List<Producto>> obtenerProductos() async {
    final response = await http.get(Uri.parse('$baseUrl?accion=obtener'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Producto.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener productos');
    }
  }

  Future<bool> agregarProducto(Map<String, dynamic> producto) async {
    final response = await http.post(
      Uri.parse('$baseUrl?accion=agregar'),
      body: producto,
    );
    return response.statusCode == 200;
  }

  Future<bool> actualizarProducto(int id, Map<String, dynamic> producto) async {
    final response = await http.post(
      Uri.parse('$baseUrl?accion=actualizar&id=$id'),
      body: producto,
    );
    return response.statusCode == 200;
  }

  Future<bool> eliminarProducto(int id) async {
    final response = await http.post(
      Uri.parse('$baseUrl?accion=eliminar&id=$id'),
    );
    return response.statusCode == 200;
  }
}
