<?php
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Header</title>
</head>
<body>
<nav class="navbar navbar-expand-lg fixed-top align-content-end">
    <div class="container">
        <h2 ><a href="../cliente/inicio.php" style="color: #212529">Yummyeat</a></h2>
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
                        <a href="../cliente/perfil-cliente.php" class="btn btn-info btn-lg active" role="button" aria-pressed="true">Perfil</a>
                    </li>
                    <li class="nav-item">
                        <a href="../sesion/cerrar-sesion.php" class="btn btn-danger btn-lg active" role="button" aria-pressed="true">Cerrar sesion</a>
                    </li>
                    <li  class="nav-item">
                        <a href="carrito-ver.php" class="btn btn-success btn-lg active" role="button" aria-pressed="true"><img src="../img/carrito.png" width="18" height="18""></a>
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
                                Se ve bien!
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="validationTooltip02">Apellidos</label>
                            <input type="text" class="form-control" id="validationTooltip02" name="apellidos" placeholder="Apelidos" required>
                            <div class="valid-tooltip">
                                Se ve bien!
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
                                    Por favor, escoja un solo nombre válido.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-8">
                            <label for="validationTooltip03">Dirección</label>
                            <input type="text" class="form-control" id="validationTooltip03" name="direccion" placeholder="Calle..." required>
                            <div class="invalid-tooltip">
                                Por favor, escriba una dirección válida.
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="validationTooltip03">Localidad</label>
                            <input type="text" class="form-control" id="validationTooltip03" name="localidad" placeholder="Madrid" required>
                            <div class="invalid-tooltip">
                                Por favor, escriba una localidad válida.
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
                                    Por favor, escoja un solo nombre válido.
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="validationTooltip05">Contraseña</label>
                            <input type="password" class="form-control" id="validationTooltip05" name="contrasenna" required>
                            <div class="invalid-tooltip">
                                Por favor, escriba una contraseña válida.
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
</body>
</html>
