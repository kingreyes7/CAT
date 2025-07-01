<?php
// 1. Datos de conexión
$host = "localhost";
$user = "root"; // Usuario por defecto en XAMPP
$password = ""; // Contraseña vacía por defecto en XAMPP
$database = "mi_basedatos"; // Tu nombre real de base de datos

// 2. Conectar
$conn = new mysqli($host, $user, $password, $database);

// 3. Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Ahora tu script sigue validando credenciales...
?>
