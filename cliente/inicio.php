<?php

require_once "../_comunes/comunes-app.php";


$restaurantesDestacados = DAO::obtenerRestaurantesDestacados();
$restaurantesEspecialidad = DAO::obtenerEspecialidadesRestaurante();

$nombreCliente = "";
$ubicacionClienteRegistrado = "Madrid";

if (haySesionIniciada()) {
    $id = $_SESSION["id"];
    $nombreCliente = $_SESSION["nombre"];
    $ubicacionClienteRegistrado = $_SESSION["localidad"];
    $restaurantesPorUbicacion = DAO::obtenerRestaurantePorUbicacion($ubicacionClienteRegistrado);
    $cantidadDeRestaurantes = sizeof($restaurantesPorUbicacion);
}

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

    <script src="../bootstrap/js/jquery.min.js"></script>
    <script src="../bootstrap/js/popper.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>

    <title>Yummyeat</title>
</head>
<body>
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <h2>Yummyeat</h2>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <?php if (!haySesionIniciada()) { ?>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#iniciarsesion">Iniciar sesion</button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#registrarse">Registrarse</button>
                </li>
            </ul>
            <?php } else { ?>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="../sesion/cerrar-sesion.php" class="btn btn-danger btn-lg active" role="button" aria-pressed="true">Cerrar sesion</a>
                    </li>
                    <li>
                        <a href="carrito-ver.php"><img src="../img/carrito.png" width="40" height="40"></a>
                    </li>
                </ul>
            <?php } ?>
        </div>
    </div>
</nav>


<div class="modal fade" id="iniciarsesion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Inicia sesión</h5>
            </div>
            <div class="modal-body">
                <form action="inicio.php" method="post">
                    <div class="form-group">
                        <label for="email">Correo</label>
                        <input id="email" name="email"
                               class="form-control" type="email"
                               placeholder="Correo electrónico">
                    </div>
                    <div class="form-group">
                        <label for="contrasenna">Contraseña</label>
                        <input id="contrasenna" name="contrasenna"
                               class="form-control" type="password"
                               placeholder="Contraseña">
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1" name="recuerdame">
                        <label class="form-check-label" for="exampleCheck1">Recuérdame</label>
                    </div>
                    <button type="submit" class="btn btn-primary mb-2">Entrar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- VENTANAS EMERGENTES -->
<div class="modal fade" id="registrarse" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registrate gratis</h5>
            </div>
            <div class="modal-body">
                <form action="registrarse.php" method="post">
                    <div class="form-row">
                        <div class="col-md-4">
                            <label for="validationTooltip01">Nombre</label>
                            <input type="text" class="form-control" id="validationTooltip01" name="nombre" placeholder="Nombre" required>
                            <div class="valid-tooltip">
                                Looks good!
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="validationTooltip02">Apellidos</label>
                            <input type="text" class="form-control" id="validationTooltip02" name="apellidos" placeholder="Apelidos" required>
                            <div class="valid-tooltip">
                                Looks good!
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="validationTooltipUsername">Teléfono</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="validationTooltipUsernamePrepend">+34</span>
                                </div>
                                <input type="text" class="form-control" id="validationTooltipUsername" aria-describedby="validationTooltipUsernamePrepend" name="telefono" required>
                                <div class="invalid-tooltip">
                                    Please choose a unique and valid username.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-8">
                            <label for="validationTooltip03">Dirección</label>
                            <input type="text" class="form-control" id="validationTooltip03" name="direccion" placeholder="Calle..." required>
                            <div class="invalid-tooltip">
                                Please provide a valid city.
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="validationTooltip03">Localidad</label>
                            <input type="text" class="form-control" id="validationTooltip03" name="localidad" placeholder="Madrid" required>
                            <div class="invalid-tooltip">
                                Please provide a valid city.
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6">
                            <label for="validationTooltip04">Email</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="validationTooltipUsernamePrepend">@</span>
                                </div>
                                <input type="text" class="form-control" id="validationTooltipUsername" aria-describedby="validationTooltipUsernamePrepend" name="email" required>
                                <div class="invalid-tooltip">
                                    Please choose a unique and valid username.
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="validationTooltip05">Contraseña</label>
                            <input type="password" class="form-control" id="validationTooltip05" name="contrasenna" required>
                            <div class="invalid-tooltip">
                                Please provide a valid zip.
                            </div>
                        </div>
                    </div>
                    <br>
                    <button class="btn btn-primary" type="submit" name="Registrarse">Registrarse</button>
                </form>
            </div>
        </div>
    </div>
</div>

<section id="hero">
    <div class="container">
        <div class="content-center">
            <h1 class="mt-5">Dónde podemos encontrarte.</h1>
            <p>Haz que sea más fácil localizarte y buscar los restaurantes más cercanos.</p>
            <form action="restaurante-ubicacion.php" class="form-inline justify-content-center">
                <div class="form-group">
                    <input type="text" class="form-control" name="ubicacion" placeholder="<?=$ubicacionClienteRegistrado?>" required>
                </div>
                <button type="submit" class="btn btn-primary">Buscar</button>
            </form>
        </div>
    </div>
</section>

<section>
    <?php if (haySesionIniciada()) { ?>
    <div class="container-fluid">
        <div class="content-center">
            <h2>Restaurantes cerca de ti.</b></h2>
        </div>

        <div class="row">
            <?php foreach ($restaurantesPorUbicacion as $restaurante) {?>
            <div class="col-md-4">
                <div class="restaurantes-cercanos-container">
                    <div class="restaurantes-cercanos-details">
                        <a href="#">
                            <h2><a></a><?=$restaurante->getNombre()?></h2>
                        </a>
                    </div>
                    <a href="restaurante-detalle.php?id=<?=$restaurante->getId()?>"><img src="../img/<?=$restaurante->getNombre()?>.jpg" class="img-fluid" alt="<?=$restaurante->getNombre()?>"></a>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
    <?php } ?>
</section>

<section>
    <div class="container-fluid">
        <div class="content-center">
            <h2>Que te apetece comer hoy.</b></h2>
        </div>

        <div class="row">
            <?php foreach ($restaurantesEspecialidad as $especialidad) {?>
            <div class="col-md-4">
                <div class="restaurantes-cercanos-container">
                    <div class="restaurantes-cercanos-details">
                        <a href="#">
                            <h2><a></a><?=$especialidad?></h2>
                        </a>
                    </div>
                    <a href="restaurante-especialidad.php?especialidad=<?=$especialidad?>"><img src="../img/<?=$especialidad?>.jpg" class="img-fluid" alt="<?=$especialidad?>"></a>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</section>
<!--
<div class="container-fluid">
    <div class="card-header">
        <header>
            <div class="row">
                <div class="col-9">
                    <h1>Bienvenido a Yummyeat <?=$nombreCliente?></h1>
                </div>
                <div class="col-3">
                    <?php if (!haySesionIniciada()) { ?>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#iniciarsesion">Iniciar sesion</button>
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#registrarse">Registrarse</button>

                        <div class="modal fade" id="iniciarsesion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Inicia sesión</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form action="inicio.php" method="post">
                                            <div class="form-group">
                                                <label for="email">Correo</label>
                                                <input id="email" name="email"
                                                       class="form-control" type="email"
                                                       placeholder="Correo electrónico">
                                            </div>
                                            <div class="form-group">
                                                <label for="contrasenna">Contraseña</label>
                                                <input id="contrasenna" name="contrasenna"
                                                       class="form-control" type="password"
                                                       placeholder="Contraseña">
                                            </div>
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="exampleCheck1" name="recuerdame">
                                                <label class="form-check-label" for="exampleCheck1">Recuérdame</label>
                                            </div>
                                            <button type="submit" class="btn btn-primary mb-2">Entrar</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="registrarse" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Registrate gratis</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form action="registrarse.php" method="post">
                                            <div class="form-row">
                                                <div class="col-md-4">
                                                    <label for="validationTooltip01">Nombre</label>
                                                    <input type="text" class="form-control" id="validationTooltip01" name="nombre" placeholder="Nombre" required>
                                                    <div class="valid-tooltip">
                                                        Looks good!
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="validationTooltip02">Apellidos</label>
                                                    <input type="text" class="form-control" id="validationTooltip02" name="apellidos" placeholder="Apelidos" required>
                                                    <div class="valid-tooltip">
                                                        Looks good!
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="validationTooltipUsername">Teléfono</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="validationTooltipUsernamePrepend">+34</span>
                                                        </div>
                                                        <input type="text" class="form-control" id="validationTooltipUsername" aria-describedby="validationTooltipUsernamePrepend" name="telefono" required>
                                                        <div class="invalid-tooltip">
                                                            Please choose a unique and valid username.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-8">
                                                    <label for="validationTooltip03">Dirección</label>
                                                    <input type="text" class="form-control" id="validationTooltip03" name="direccion" placeholder="Calle..." required>
                                                    <div class="invalid-tooltip">
                                                        Please provide a valid city.
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="validationTooltip03">Localidad</label>
                                                    <input type="text" class="form-control" id="validationTooltip03" name="localidad" placeholder="Madrid" required>
                                                    <div class="invalid-tooltip">
                                                        Please provide a valid city.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <label for="validationTooltip04">Email</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="validationTooltipUsernamePrepend">@</span>
                                                        </div>
                                                        <input type="text" class="form-control" id="validationTooltipUsername" aria-describedby="validationTooltipUsernamePrepend" name="email" required>
                                                        <div class="invalid-tooltip">
                                                            Please choose a unique and valid username.
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="validationTooltip05">Contraseña</label>
                                                    <input type="password" class="form-control" id="validationTooltip05" name="contrasenna" required>
                                                    <div class="invalid-tooltip">
                                                        Please provide a valid zip.
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            <button class="btn btn-primary" type="submit" name="Registrarse">Registrarse</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php } else { ?>
                        <a href="../sesion/cerrar-sesion.php" class="btn btn-danger btn-lg active" role="button" aria-pressed="true">Cerrar sesion</a>
                        <a href="../cliente/pedido-ver.php" class="btn btn-danger btn-lg active" role="button" aria-pressed="true">Ver pedidos</a>
                        <a href="carrito-ver.php"><img src="../img/5367202ad4dd11725544cb3008049f96-shoppingcart-icono-plana.png" width="40" height="40"></a>
                    <?php } ?>
                </div>
            </div>
        </header>
    </div>

    <div class="jumbotron big-banner">
        <div class="row">
            <div class="col-3"><h3>Que te gustaría hoy</h3></div>
        </div>

        <div class="row">
            <div class="col-3">
                <table class="table table-hover">
                    <tbody>
                    <?php foreach ($restaurantesEspecialidad as $especialidad) { ?>
                    <tr>
                        <th scope="row"><a href="restaurante-especialidad.php?especialidad=<?=$especialidad?>"><?=$especialidad?></a></th>
                    </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-4">
        <form action="restaurante-ubicacion.php" class="form-inline justify-content-center">
            <div class="form-group">
                <input type="text" class="form-control" name="ubicacion" placeholder="<?=$ubicacionClienteRegistrado?>" required>
            </div>
            <button type="submit" class="btn btn-primary">Buscar</button>
        </form>
            </div>
        </div>
            <div class="row text-center">
                <div class="col-4"><p>Pide a domicilio rápido y sencillo</p></div>
            </div>





    <?php  if (haySesionIniciada()) { ?>

        <div class="row text-center">
            <div class="col-12"><h2>Restaurantes en <?=$ubicacionClienteRegistrado?></h2></div>
        </div>
        <div class="row">

            <?php foreach ($restaurantesPorUbicacion as $restaurante) {?>
            <div class="col-4 text-center"><a href="restaurante-detalle.php?id=<?=$restaurante->getId()?>"><?=$restaurante->getNombre()?></a></div>
            <?php }?>
        </div>

             <?php } ?>


    <?php if (!haySesionIniciada()) { ?>
        <div class="row text-center">
            <div class="col-12">
                <h2>Restaurantes Destacados</h2>
            </div>
        </div>

        <div class="row">
            <div class="col-3">
                <!-- Aqui quiero poner una imagen y en el otro lado de la tabla tambien para que quede mejor
            </div>

        <div class="col-6">
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
        </div>
<?php } ?>
    </div>
</div>
-->
</body>
</html>