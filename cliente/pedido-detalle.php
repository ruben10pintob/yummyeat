<?php

require_once "../_comunes/comunes-app.php";

$pedidoId = $_REQUEST["id"];
$precioCarrito = 0;
$pedido = DAO::obtenerDetallePedido($pedidoId);
$precioTotalPedido = 0;



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

    <title>Detalle del pedido</title>
</head>
<body>

<table class="table table-hover">
    <th>Producto</th>
    <th>Precio Producto</th>
    <th>Unidades</th>
    <th>Precio Total Producto</th>
    <?php
    $precioTotalPedido=0;
    foreach ($pedido as $linea){

        $precioTotalProducto = $linea["UNIDADES"]*$linea["PRECIO_UNITARIO"];
        $precioTotalPedido+=$precioTotalProducto;
        ?>
        <tr>

                <td><?=$linea["NOMBRE_PRODUCTO"]?></td>
                <td><?=$linea["PRECIO_UNITARIO"]?>€</td>
                <td><?=$linea["UNIDADES"]?></td>
                <td><?=$precioTotalProducto?>€</td>
        </tr>
    <?php } ?>

    <tr>
        <td class="font-weight-bold">Precio Total del Pedido</td>
        <td></td>
        <td></td>
        <td class="font-weight-bold"><?=$precioTotalPedido?>€</td>
    </tr>
</table>
<a href="../cliente/pedido-ver.php" class="btn btn-success btn-lg active" role="button" aria-pressed="true">Volver al listado de pedidos</a>
</body>
</html>
