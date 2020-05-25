<?php

require_once "../_comunes/comunes-app.php";


$restaurantesDestacados = DAO::obtenerRestaurantesDestacados();
$nombreCliente = "";

if(isset($_SESSION["nombre"])) $nombreCliente = $_SESSION["nombre"];


?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Yummyeat</title>
</head>
<br>
<h1>Bienvenidos a Yummyeat <?=$nombreCliente?></h1>

<header>
    <a href="../sesion/inicio-sesion.php">Iniciar sesión</a>
    <a href="registrarse.php">Registrarse</a>
</header>

<h2>Restaurantes destacados</h2>

<table border="1">

    <tr>
        <th>Nombre</th>
        <th>Telefono</th>
        <th>direccion</th>
        <th>localidad</th>
        <th>email</th>
        <th>Especialidad</th>
    </tr>

    <?php foreach ($restaurantesDestacados as $restaurante) { ?>
        <tr>
            <td>
                <a href="restaurante-detalle.php?id=<?=$restaurante->getId()?>"><?=$restaurante->getNombre()?></a>
            </td>
            <td>
                <a><?=$restaurante->getTelefono()?></a>
            </td>
            <td>
                <a><?=$restaurante->getDireccion()?></a>
            </td>
            <td>
                <a><?=$restaurante->getLocalidad()?></a>
            </td>
            <td>
                <a><?=$restaurante->getEmail()?></a>
            </td>            <td>
                <a><?=$restaurante->getEspecialidad()?></a>
            </td>
        </tr>
    <?php } ?>

</table>

<h2>Restaurantes por especialidades</h2> </br>
<a href="restaurante-especialidad.php?especialidad=Hamburguesas">Hamburguesas</a></br>
<a href="restaurante-especialidad.php?especialidad=Pizzas">Pizzas</a></br>
<a href="restaurante-especialidad.php?especialidad=Internacional">Internacional</a></br>
<a href="restaurante-especialidad.php?especialidad=Japonesa">Japonesa</a></br>

<h2>Restaurantes por localizacion</h2>
<h3>Introduzca su ubicacion para buscar restaurantes cercanos</h3>
<form action="restaurante-ubicacion.php" method="post">
    <input type="text" name="ubicacion">
    <input type="submit" name="enviar" value="Enviar">
</form>

<a href="../cliente/pedido-ver.php">Ver pedido</a>
<a href="../sesion/cerrar-sesion.php">Cerrar sesion</a>


</body>
</html>
