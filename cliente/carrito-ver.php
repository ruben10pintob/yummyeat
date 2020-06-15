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
    <link rel="stylesheet" href="../css/main.css">

    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

    <script src="../bootstrap/js/jquery.min.js"></script>
    <script src="../bootstrap/js/popper.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>

    <title>Carrito</title>
</head>
<body>

<?php require_once "header.php"?>

<div id="tabla">
<table class="table table-hover" style="margin-top: 150px">
    <tr>
        <td>Producto</td>
        <td>Precio Producto</td>
        <td>Unidades</td>
        <td>Precio Total Producto</td>
    </tr>
    <tr>
<?php
$precioTotalCarrito=0;
foreach ($carrito as $linea){

    $precioTotalProducto = $linea["UNIDADES"]*$linea["PRECIO_UNITARIO"];
    $precioTotalCarrito+=$precioTotalProducto;
    ?>

        <form action="modificar-unidades-carrito.php" name="FormularioCantidades">
                <input type="hidden" name="idPedido" value="<?=$linea["ID_PEDIDO"]?>">
                <input type="hidden" name="idProducto" value="<?=$linea["ID_PRODUCTO"]?>">
                <td><?=$linea["NOMBRE_PRODUCTO"]?></td>
                <td><?=$linea["PRECIO_UNITARIO"]?>€</td>
                <td><input id="cantidad" type="number" name="cantidad" value="<?=$linea["UNIDADES"]?>" min="1"></td>
                <td><?=$precioTotalProducto?>€</td>
                <td><button class="btn btn-warning btn-lg active" type="submit" value="Modificar" name="Modificar producto">Modificar Producto</td>
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
</div>
<form action="pedido-gestionar.php" method="post">
    <div class="form-group">
        <label for="direccionCliente">Direccion de envío</label>
        <input id="direccionCliente" name="direccionCliente"
               class="form-control" type="text"
               value="<?=$direccionCliente?>">
    </div>
    <button type="submit" class="btn btn-success mb-2">Confirmar pedido</button>
</form>
<a href="../cliente/inicio.php" class="btn btn-dark" style="margin-top: 20px" id="hover">Volver a la página de inicio</a>

<?php require_once "footer.php"?>
</body>

<script src="../js/envioFormulario.js"></script>
</html>


