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

    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../css/inicio.css">

    <script src="../bootstrap/js/jquery.min.js"></script>
    <script src="../bootstrap/js/popper.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>

    <title>Yummyeat</title>
</head>
<body>
<div class="container-fluid">
    <div class="card-header">
        <header>
            <div class="row">
                <div class="col-9">
                    <h1>Bienvenidos a Yummyeat <?=$nombreCliente?></h1>
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
                                                <div class="col-md-6">
                                                    <label for="validationTooltip01">Nombre</label>
                                                    <input type="text" class="form-control" id="validationTooltip01" name="nombre" placeholder="Nombre" required>
                                                    <div class="valid-tooltip">
                                                        Looks good!
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="validationTooltip02">Apellidos</label>
                                                    <input type="text" class="form-control" id="validationTooltip02" name="apellidos" placeholder="Apelidos" required>
                                                    <div class="valid-tooltip">
                                                        Looks good!
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-6">
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
                                                <div class="col-md-6">
                                                    <label for="validationTooltip03">Dirección</label>
                                                    <input type="text" class="form-control" id="validationTooltip03" name="direccion" placeholder="Calle..." required>
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
                    <?php } ?>
                </div>
            </div>
        </header>
    </div>

    <div class="row text-center">
        <div class="col-12">
            <h2>Pide a domicilio rápido y sencillo</h2>
        </div>
    </div>

    <form action="restaurante-ubicacion.php" class="form-inline justify-content-center">
        <div class="form-group">
            <input type="text" class="form-control" name="ubicacion" placeholder="Madrid" required>
        </div>
        <button type="submit" class="btn btn-primary">Buscar</button>
    </form>

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
            <div class="col-12">
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
        </div>

        <div class="card-footer">
            <a href="../cliente/pedido-ver.php">Ver pedido</a>
        </div>

    </div>
</div>
</body>
</html>
