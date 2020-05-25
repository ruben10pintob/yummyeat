<?php

require_once "../_comunes/dao.php";
require_once "../_comunes/clases.php";
require_once "../_comunes/utilidades.php";

$mensaje = "Registrarse como nuevo usuario";
$meta = "";


if (isset($_REQUEST["Registrarse"])){

$clienteNuevo = DAO::registrarNuevoCliente($_REQUEST["nombre"], $_REQUEST["apellidos"], $_REQUEST["telefono"], $_REQUEST["direccion"], $_REQUEST["email"], $_REQUEST["contrasenna"]);

    if ($clienteNuevo == 1){
        $mensaje = "Se ha registrado correctamente. Será redirigido a la página principal en unos instantes";
        $meta = "<meta http-equiv=\"refresh\" content=\"5;URL=../cliente/inicio.php\" />";
        //redireccionar("../cliente/inicio.php");
    }else{
        $mensaje = "El email utilizado ya esté en uso. Vuelva a intentarlo con otro email";
        $meta = "";
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
    <title>Registro Yummyeat</title>
</head>
<body>
<h1>Yummyeat</h1>
<h3><?=$mensaje?></h3>
<form action="registrarse.php" method="post">
    <label><b>Nombre </b></label><br /><input name="nombre" type="text" placeholder="Nombre"><br />
    <label><b>Apellidos </b></label><br /><input name="apellidos" type="text" placeholder="Apellidos"><br />
    <label><b>Teléfono </b></label><br /><input name="telefono" type="tel" placeholder="Telefono"><br />
    <label><b>Dirección</b></label><br /><input name="direccion" type="text" placeholder="Dirección"><br />
    <label><b>Email</b></label><br /><input name="email" type="email" placeholder="Email"><br />
    <label><b>Contraseña</b></label><br /><input type="password" name="contrasenna" placeholder="Contraseña"/><br />
    <br />
    <input type="Submit" value="Registrarse" name="Registrarse"/>
</form>
</body>
</html>
