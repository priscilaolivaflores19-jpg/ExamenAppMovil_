class Producto {
  final int id;
  final String nombre;
  final String descripcion;
  final String codigoBarras;
  final String categoria;
  final double precio;
  final int stock;
  final String proveedor;

  Producto({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.codigoBarras,
    required this.categoria,
    required this.precio,
    required this.stock,
    required this.proveedor,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: int.parse(json['id'].toString()),
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      codigoBarras: json['codigo_barras'],
      categoria: json['categoria'],
      precio: double.parse(json['precio'].toString()),
      stock: int.parse(json['stock'].toString()),
      proveedor: json['proveedor'],
    );
  }
}
