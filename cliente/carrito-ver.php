<?php
require_once "../_comunes/dao.php";
require_once "../_comunes/clases.php";
require_once "../_comunes/comunes-app.php";
$pedidoId=DAO::obtenerCarrito($_SESSION["id"]);
$lineas = DAO::obtenerDetalleCarrito($pedidoId);
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

    <title>Carrito</title>
</head>
<body>
<table class="table">
    <th>Nombre del producto</th>
    <th>Descripcion del producto</th>
    <th>Categoria del producto</th>
    <th>Precio del producto</th>
<?
foreach ($lineas as $l){?>
    <tr>
        <td><?=$l[0]['NOMBRE_PRODUCTO']?></td>
        <td><?=$l[0]['DESCRIPCION_PRODUCTO']?></td>
        <td><?=$l[0]['CATEGORIA_PRODUCTO']?></td>
        <td><?=$l[0]['PRECIO_UNITARIO']?></td>
    </tr>

    <?}?>

</table>
</body>
</html>
