<?php

require_once "../_comunes/requireonces-comunes.php";
//require_once "../_comunes/dao.php";
//require_once "../_comunes/clases.php";
//require_once "../_comunes/utilidades.php";

$mensaje = "Registrarse como nuevo usuario";
$meta = "";


if (isset($_REQUEST["Registrarse"])){

$clienteNuevo = DAO::registrarNuevoCliente($_REQUEST["nombre"], $_REQUEST["apellidos"], $_REQUEST["telefono"],
    $_REQUEST["direccion"], $_REQUEST["localidad"], $_REQUEST["email"], $_REQUEST["contrasenna"]);

    if ($clienteNuevo == 1){
        //$mensaje = "Se ha registrado correctamente. Será redirigido a la página principal en unos instantes";
        //$meta = "<meta http-equiv=\"refresh\" content=\"5;URL=../cliente/inicio.php\" />";
        garantizarSesion();
        redireccionar("../cliente/inicio.php");
    }else{
        //$mensaje = "El email utilizado ya esté en uso. Vuelva a intentarlo con otro email";
        //$meta = "";
        redireccionar("../cliente/inicio.php");
    }

}
?>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <?=$meta?>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../css/main.css">

    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

    <script src="../bootstrap/js/jquery.min.js"></script>
    <script src="../bootstrap/js/popper.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>

    <title>Registro Yummyeat</title>
</head>
<body>

<div class="container">
    <h2><?=$mensaje?></h2>

    <form action="registrarse.php" method="post">
        <div class="form-row">
            <div class="col-md-4 mb-3">
                <label for="validationTooltip01">Nombre</label>
                <input type="text" class="form-control" id="validationTooltip01" name="nombre" placeholder="Nombre" required>
                <div class="valid-tooltip">
                    Looks good!
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <label for="validationTooltip02">Apellidos</label>
                <input type="text" class="form-control" id="validationTooltip02" name="apellidos" placeholder="Apelidos" required>
                <div class="valid-tooltip">
                    Looks good!
                </div>
            </div>
            <div class="col-md-4 mb-3">
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
            <div class="col-md-6 mb-3">
                <label for="validationTooltip03">Dirección</label>
                <input type="text" class="form-control" id="validationTooltip03" name="direccion" placeholder="Calle..." required>
                <div class="invalid-tooltip">
                    Please provide a valid city.
                </div>
            </div>
            <div class="col-md-3 mb-3">
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
            <div class="col-md-3 mb-3">
                <label for="validationTooltip05">Contraseña</label>
                <input type="password" class="form-control" id="validationTooltip05" name="contrasenna" required>
                <div class="invalid-tooltip">
                    Please provide a valid zip.
                </div>
            </div>
        </div>
        <button class="btn btn-primary" type="submit" name="Registrarse">Registrarse</button>
    </form>
</div>
</body>
</html>
