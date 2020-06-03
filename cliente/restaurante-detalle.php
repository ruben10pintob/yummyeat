<?php

require_once "../_comunes/comunes-app.php";

$idRestaurante = $_REQUEST["id"];

if (isset($_REQUEST["categoria"])) {
    $categoria = $_REQUEST["categoria"];
    $productosPorCategoria = DAO::obtenerProductosPorCategoria($categoria, $idRestaurante);
}

$restaurantePorId = DAO::restauranteObtenerPorId($idRestaurante);
$productosRestaurante = DAO::obtenerProductosRestaurante($idRestaurante);
$categoriaProductos = DAO::obtenerCategoriaProductosPorRestaurante($idRestaurante);




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

    <title><?=$restaurantePorId->getNombre()?></title>
</head>
<body>
<h1>Yummyeat <?=$restaurantePorId->getNombre()?></h1>
<table border="1">

    <tr>
        <th>Telefono</th>
        <th>Direccion</th>
        <th>Localidad</th>
        <th>Email</th>
        <th>Especialidad</th>
    </tr>

        <tr>
            <td>
                <a><?=$restaurantePorId->getTelefono()?></a>
            </td>
            <td>
                <a><?=$restaurantePorId->getDireccion()?></a>
            </td>
            <td>
                <a><?=$restaurantePorId->getLocalidad()?></a>
            </td>
            <td>
                <a><?=$restaurantePorId->getEmail()?></a>
            </td>
            <td>
                <a><?=$restaurantePorId->getEspecialidad()?></a>
            </td>
        </tr>


</table>

<h2>Menú y especialidades del restaurante</h2>
<div class="row">
    <?php foreach ($categoriaProductos as $categorias) { ?>
        <div class="col-3">
            <a href="restaurante-detalle.php?id=<?=$idRestaurante?>&categoria=<?=$categorias?>"><?=$categorias?></a>
        </div>
    <?php } ?>
</div>

</table>

<?php if (isset($_REQUEST["categoria"])) { ?>
<table border="1">

    <th><?=$categoria?></th>
        <?php
            foreach ($productosPorCategoria as $producto) { ?>

                <tr>
                    <td><a href="producto-detalle.php?id=<?=$producto->getId()?>&restaurante=<?=$restaurantePorId->getId()?>" ><?= $producto->getNombre() ?></a></td>
                    <td><?= $producto->getPrecio() ?></td>
                    <td><a href="../cliente/carrito-annadir.php?id=<?=$producto->getId()?>&restaurante=<?=$restaurantePorId->getId()?>&Unidades=1" class="btn btn-dark btn-lg active" role="button" aria-pressed="true">Añadir al carrito</a></td>
                </tr>
            <?php }
        }?>


</table>

</body>
</html>