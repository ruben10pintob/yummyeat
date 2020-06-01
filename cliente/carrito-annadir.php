<?php
require_once "../_comunes/dao.php";
require_once "../_comunes/clases.php";
require_once "../_comunes/comunes-app.php";
$idProducto = $_REQUEST["id"];
$idCliente = $_SESSION["id"];
$unidades = $_REQUEST["Unidades"];
$precio = DAO::obtenerPrecioProducto($idProducto);
$restaurante = $_REQUEST["restaurante"];

if(DAO::obtenerCarrito($idCliente) != null){
    $carrito = DAO::obtenerCarrito($idCliente);
    DAO::annadirProductoCarrito($carrito, $idProducto, $unidades, $precio);
}else{
    DAO::crearNuevoCarrito($idCliente, $restaurante);
    $carrito = DAO::obtenerCarrito($idCliente);
    DAO::annadirProductoCarrito($carrito, $idProducto, $unidades, $precio);
}

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap-reboot.css">

    <script src="../bootstrap/js/jquery.min.js"></script>
    <script src="../bootstrap/js/popper.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>

    <title>Yummyeat</title>
</head>
<body>
<h3>Su producto ha sido añadido correctamente</h3>
<a href="../cliente/restaurante-detalle.php?id=<?=$restaurante?>" class="btn btn-info btn-lg active" role="button" aria-pressed="true">Volver al listado de productos</a>
</body>
</html>
