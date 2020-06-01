<?php

require_once "../_comunes/dao.php";
require_once "../_comunes/clases.php";

$idProducto= $_REQUEST["id"];
$restaurante = $_REQUEST["restaurante"];

$producto = DAO::obtenerDetallesProducto($idProducto);

$restaurante = DAO::restauranteObtenerPorId($restaurante);

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

    <title>Detalles del producto</title>
</head>
<body>
<h2><?=$restaurante->getNombre()?></h2>
<p><?=$producto->getNombre()?></p>
<p><?=$producto->getDescripcion()?></p>
<p><?=$producto->getPrecio()?></p>

<a href="carrito-annadir.php?id=<?=$producto->getId()?>&restaurante=<?=$restaurante?>&Unidades=1" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Añadir al carrito</a>
<a href="restaurante-detalle.php?id=<?=$restaurante?>" class="btn btn-info btn-lg active" role="button" aria-pressed="true">Volver al listado de productos</a>
</body>
</html>