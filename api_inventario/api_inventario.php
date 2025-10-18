<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$conexion = new mysqli("localhost", "root", "", "inventario_tienda2");

if ($conexion->connect_error) {
    die(json_encode(["error" => "Error de conexión"]));
}

$accion = $_GET['accion'] ?? '';

if ($accion == 'obtener') {
    $result = $conexion->query("SELECT * FROM productos");
    $productos = [];
    while ($row = $result->fetch_assoc()) {
        $productos[] = $row;
    }
    echo json_encode($productos);
}

if ($accion == 'agregar') {
    $nombre = $_POST['nombre'];
    $descripcion = $_POST['descripcion'];
    $codigo_barras = $_POST['codigo_barras'];
    $categoria = $_POST['categoria'];
    $precio = $_POST['precio'];
    $stock = $_POST['stock'];
    $proveedor = $_POST['proveedor'];

    $conexion->query("INSERT INTO productos(nombre, descripcion, codigo_barras, categoria, precio, stock, proveedor)
                      VALUES('$nombre', '$descripcion', '$codigo_barras', '$categoria', '$precio', '$stock', '$proveedor')");
    echo json_encode(["success" => true]);
}

if ($accion == 'eliminar') {
    $id = $_GET['id'];
    $conexion->query("DELETE FROM productos WHERE id=$id");
    echo json_encode(["success" => true]);
}

if ($accion == 'actualizar') {
    $id = $_GET['id'];
    $nombre = $_POST['nombre'];
    $descripcion = $_POST['descripcion'];
    $categoria = $_POST['categoria'];
    $precio = $_POST['precio'];
    $stock = $_POST['stock'];
    $proveedor = $_POST['proveedor'];

    $conexion->query("UPDATE productos SET nombre='$nombre', descripcion='$descripcion', categoria='$categoria', precio='$precio', stock='$stock', proveedor='$proveedor' WHERE id=$id");
    echo json_encode(["success" => true]);
}
?>
