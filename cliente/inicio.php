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
    <script src="../bootstrap/bootstrap-4.5.0-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" href="../bootstrap/bootstrap-4.5.0-dist/css/bootstrap.css">

    <link rel="stylesheet" href="../css/inicio.css">
    <title>Yummyeat</title>
</head>
<body>
<div class="card-header">
<header>
    <div class="row">
        <div class="col-11">
            <h1>Bienvenidos a Yummyeat <?=$nombreCliente?></h1>
        </div>
        <div class="col-1">
            <a href="../sesion/inicio-sesion.php">Iniciar sesión</a>
            <a href="registrarse.php">Registrarse</a>
        </div>
    </div>
</header>
</div>
    <div class="container-fluid">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li><a href="#">Hamburguesas</a></li>
                    <li><a href="#">Pizzas</a></li>
                    <li><a href="#">Internacional</a></li>
                    <li><a href="#">Japonesa</a></li>
                </ul>
            </div>
        </nav>

        <div class="row">
            <div class="col-8">
                <h2>Restaurantes destacados</h2>

                <table border="1" class="table-striped">

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
                                <p><?=$restaurante->getTelefono()?></p>
                            </td>
                            <td>
                                <p><?=$restaurante->getDireccion()?></p>
                            </td>
                            <td>
                                <p href="restaurante-ubicacion.php"><?=$restaurante->getLocalidad()?></p>
                            </td>
                            <td>
                                <p><?=$restaurante->getEmail()?></p>
                            </td>            <td>
                                <p><?=$restaurante->getEspecialidad()?></p>
                            </td>
                        </tr>
                    <?php } ?>

                </table>
            </div>
            <div class="col-4">
                <h2>Restaurantes por localizacion</h2>
                <form action="restaurante-ubicacion.php" method="post">
                    <input type="text" name="ubicacion" placeholder="Introduzca su ubicacion">
                    <input type="submit" name="enviar" value="Enviar">
                </form>
            </div>
        </div>

        <div class="card-footer">
            <a href="../cliente/pedido-ver.php">Ver pedido</a>
            <a href="../sesion/cerrar-sesion.php">Cerrar sesion</a>
        </div>


</body>
</html>
