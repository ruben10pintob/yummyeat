<?php

require_once "../_comunes/comunes-app.php";

$idRestaurante = $_REQUEST["id"];

/*if (isset($_REQUEST["categoria"])) {
    $categoria = $_REQUEST["categoria"];
    $productosPorCategoria = DAO::obtenerProductosPorCategoria($categoria, $idRestaurante);
}*/

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
    <link rel="stylesheet" href="../css/main.css">

    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

    <script src="../bootstrap/js/jquery.min.js"></script>
    <script src="../bootstrap/js/popper.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <title><?=$restaurantePorId->getNombre()?></title>
</head>
<body>

<?php require_once "../cliente/header.php";?>

<h1 style="margin-top: 100px"><?=$restaurantePorId->getNombre()?></h1>
<h3>Información sobre el restaurante</h3>
<table class="table-hover" border="1">

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

    <table class="table-dark" border="1" width="50%" id="tabla">
    <?php foreach ($categoriaProductos as $categorias) { ?>
        <tr>
            <td><span><?=$categorias?></span><span class="offset-11"><ion-icon name="arrow-down-outline" id="<?=$categorias?>"></ion-icon></span>
            </td>
            <div id="contenedorProductos">
        <tr style="display: none" name="<?=$categorias?>">
            <th>Nombre</th>
            <th>Precio</th>
            <th>Unidades</th>
        </tr>
        <?php $productosPorCategoria = DAO::obtenerProductosPorCategoria($categorias, $idRestaurante);
        foreach ($productosPorCategoria as $producto) { ?>
            <form action="carrito-annadir.php?id=?&restaurante=?&Unidades=?" name="form1">
                <input type="hidden" value="<?=$producto->getId()?>" name="id">
                <input type="hidden" value="<?=$restaurantePorId->getId()?>" name="restaurante">

            <tr style="display: none" name="<?=$categorias?>">
                <td><a href="producto-detalle.php?id=<?=$producto->getId()?>&restaurante=<?=$restaurantePorId->getId()?>&categoria=<?=$categorias?>"  id="hover"><?= $producto->getNombre() ?></a></td>
                <td><?= $producto->getPrecio() ?>€</td>
                <td><input type="number" name="Unidades" value="1" min="1" placeholder="Unidades del producto" id="Unidades" ></td>
                <td><input type="submit" name="Enviar" value="Añadir al carrito" class="btn btn-black" id="hover"></td>
                </tr>
            </form>
        <?php } ?>
            </div>
        </tr>

    <?php } ?>
    </table>

<a href="../cliente/inicio.php" class="btn btn-dark" style="margin-top: 20px" id="hover">Volver a la página de inicio</a>
<?php require_once "../cliente/footer.php";?>

<script src="../js/desplegarProductos.js"></script>
</body>
</html>