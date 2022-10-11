<?php

$db = mysqli_connect("localhost", "root", "", "registros");

if (!$db) {
    echo "Error al conectar la base de datos";
}

$nombres = $_POST['nombres'];
$telefono = $_POST['telefono'];

$registro = $db->query("INSERT INTO clientes(nombres,telefono)VALUE ('" . $nombres . "', '" . $telefono . "')");