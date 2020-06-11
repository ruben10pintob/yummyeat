<?php

require_once "../_comunes/comunes-app.php";

$idCarrito = DAO::obtenerCarrito($_SESSION["id"]);
$precioCarrito = 0;
$carrito = DAO::obtenerDetalleCarrito($idCarrito);
$direccionCliente = $_SESSION["direccionCliente"];



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

<table class="table table-hover">
    <th>Producto</th>
    <th>Precio Producto</th>
    <th>Unidades</th>
    <th>Precio Total Producto</th>
<?php
$precioTotalCarrito=0;
foreach ($carrito as $linea){

    $precioTotalProducto = $linea["UNIDADES"]*$linea["PRECIO_UNITARIO"];
    $precioTotalCarrito+=$precioTotalProducto;
    ?>
    <script>
        function cargar_pagina() {
            alert("Hola");
        }
        document.getElementById("prueba").addEventListener("click", cargar_pagina);
    </script>
    <a id="prueba" href="#">Prueba</a>
    <tr>
        <form action="modificar-unidades-carrito.php" name="form1">
            <input type="hidden" name="idPedido" value="<?=$linea["ID_PEDIDO"]?>">
            <input type="hidden" name="idProducto" value="<?=$linea["ID_PRODUCTO"]?>">
            <td><?=$linea["NOMBRE_PRODUCTO"]?></td>
            <td><?=$linea["PRECIO_UNITARIO"]?>€</td>
            <td><input type="number" name="cantidad" value="<?=$linea["UNIDADES"]?>"></td>
            <td><?=$precioTotalProducto?>€</td>
            <td><input type="submit" name="Modificar" value="Modificar Unidades" class="btn btn-warning btn-lg active" role="button" aria-pressed="true"></td>
        </form>
        <td><a href="carrito-eliminar.php?idPedido=<?=$linea["ID_PEDIDO"]?>&idProducto=<?=$linea["ID_PRODUCTO"]?>" class="btn btn-danger btn-lg active" role="button" aria-pressed="true">Eliminar Producto</a></td>
    </tr>
<?php } ?>

    <tr>
        <td class="font-weight-bold">Precio Total del Carrito</td>
        <td></td>
        <td></td>
        <td class="font-weight-bold"><?=$precioTotalCarrito?>€</td>
    </tr>
</table>

<form action="pedido-gestionar.php" method="post">
    <div class="form-group">
        <label for="direccionCliente">Direccion de envío</label>
        <input id="direccionCliente" name="direccionCliente"
               class="form-control" type="text"
               value="<?=$direccionCliente?>">
    </div>
    <button type="submit" class="btn btn-primary mb-2">Confirmar pedido</button>
</form>
</body>
<script src="../js/envioFormulario.js"></script>
</html>

