<?php

require_once "../_comunes/comunes-app.php";

$idProducto= $_REQUEST["id"];
$idRestaurante = $_REQUEST["restaurante"];
$categoria = $_REQUEST["categoria"];

$producto = DAO::obtenerDetallesProducto($idProducto);

$restaurante = DAO::restauranteObtenerPorId($idRestaurante);

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


    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

    <script src="../bootstrap/js/jquery.min.js"></script>
    <script src="../bootstrap/js/popper.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>

    <title>Detalle del producto</title>
</head>
<body>
<h2 style="color: black"><?=$restaurante->getNombre()?></h2>
<p style="color: black"><?=$producto->getNombre()?></p>
<p style="color: black"><?=$producto->getDescripcion()?></p>
<p style="color: black"><?=$producto->getPrecio()?></p>

<form action="carrito-annadir.php?id=?&restaurante=?&Unidades=?" method="post">
    <input type="hidden" value="<?=$idProducto?>" name="id">
    <input type="hidden" value="<?=$idRestaurante?>" name="restaurante">
    <input type="number" name="Unidades" value="1" min="1" placeholder="Unidades del producto" id="Unidades">
    <input type="submit" name="Enviar" value="Añadir al carrito" class="btn btn-dark" id="hover">
</form>

<a href="../cliente/restaurante-detalle.php?id=<?=$idRestaurante?>&categoria=<?=$categoria?>" class="btn btn-dark" style="margin-top: 20px">Volver al listado de productos</a>
</body>
</html>
