<?php
require_once "../_comunes/comunes-app.php";

$id = $_SESSION["id"];


$cliente = DAO::clienteObtenerPorId($id);

$nombre = $cliente->getNombre();
$apellidos = $cliente->getApellidos();
$telefono = $cliente->getTelefono();
$direccion = $cliente->getDireccion();
$localidad = $cliente->getLocalidad();
$email = $cliente->getEmail();

if (isset($_REQUEST["modificado"])){
    echo "<div class=\"alert alert-warning alert-dismissible fade show\" role=\"alert\">";
        echo "<strong>Hola $nombre!</strong> Su información personal ha sido modificada satisfactoriamente.";
        echo "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
         echo "<span aria-hidden=\"true\">&times;</span>";
        echo "</button>";
        echo " </div>";
}
?>
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

    <title>Perfil</title>
</head>
<body>
<h3>Información de <?=$nombre?> [<?=$email?>]</h3>
<form action="modificar-info-cliente.php" METHOD="post">
    <label style="font-weight: bold;">Nombre</label><br>
    <input type="text" name="nombre" value="<?=$nombre?>" ><br>
    <label style="margin-top: 10px; font-weight: bold;">Apellidos</label><br>
    <input type="text" name="apellidos" value="<?=$apellidos?>" ><br>
    <label style="margin-top: 10px; font-weight: bold;">Teléfono</label><br>
    <input type="tel" name="telefono" value="<?=$telefono?>" ><br>
    <label style="margin-top: 10px; font-weight: bold;">Dirección</label><br>
    <input type="text" name="direccion" value="<?=$direccion?>" ><br>
    <label style="margin-top: 10px; font-weight: bold;">Localidad</label><br>
    <input type="text" name="localidad" value="<?=$localidad?>" ><br>
    <input type="submit" name="submit" value="Modificar" class="btn btn-warning" style="margin-top: 10px">
</form>
<a href="../cliente/pedido-ver.php" class="btn btn-success btn-lg active" role="button" aria-pressed="true">Ver pedidos</a>
<a href="../sesion/cerrar-sesion.php" class="btn btn-danger btn-lg active" role="button" aria-pressed="true">Cerrar sesion</a>
</body>
</html>
