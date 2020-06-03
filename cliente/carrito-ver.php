<?php

require_once "../_comunes/comunes-app.php";

$pedidoId = DAO::obtenerCarrito($_SESSION["id"]);
$precioCarrito = 0;
$carrito = DAO::obtenerDetalleCarrito($pedidoId);



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
<?php
foreach ($carrito as $linea){ ?>
    <tr>
        <th><?=$linea["NOMBRE_PRODUCTO"]?></th>
        <th><?=$linea["PRECIO_UNITARIO"]?>€</th>
        <th><?=$linea["UNIDADES"]?></th>
        <th><a href="carrito-eliminar.php?idPedido=<?=$linea["ID_PEDIDO"]?>&idProducto=<?=$linea["ID_PRODUCTO"]?>">Eliminar producto</a></th>
    </tr>
<?php } ?>


</table>
</body>
</html>
