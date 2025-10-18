<?php
$host = "localhost";
$dbname = "inventario_tienda2"; // nombre exacto de tu base de datos
$username = "root"; // usuario de XAMPP
$password = ""; // sin contraseña normalmente

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode([
        "status" => "error",
        "message" => "Error de conexión: " . $e->getMessage()
    ]);
    exit;
}
?>

