<?php

require_once "../_comunes/dao.php";
require_once "../_comunes/clases.php";

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

<table border="1">

    <tr>
        <th>CATEGORIA</th>

        <?php foreach ($categoriaProductos as $categorias) { ?>
    <tr>
        <td>
            <a href="restaurante-detalle.php?id=<?=$idRestaurante?>&categoria=<?=$categorias?>"><?=$categorias?></a>
        </td>
    </tr>
    <?php } ?>
    </tr>


</table>

<?php if (isset($_REQUEST["categoria"])) { ?>
<table border="1">

    <tr>
        <?php
            foreach ($productosPorCategoria as $producto) { ?>
                <td><?= $producto->getNombre() ?></td>
            <?php }
        }?>
    </tr>

</table>

</body>
</html>