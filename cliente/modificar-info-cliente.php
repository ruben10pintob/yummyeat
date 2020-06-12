<?php
require_once "../_comunes/comunes-app.php";

 $id = $_SESSION["id"];
 $nombre = $_REQUEST["nombre"];
 $apellidos = $_REQUEST["apellidos"];
 $telefono = $_REQUEST["telefono"];
 $direccion = $_REQUEST["direccion"];
 $localidad = $_REQUEST["localidad"];

DAO::modificarInfoCliente($nombre, $apellidos, $telefono, $direccion, $localidad, $id);

redireccionar("../cliente/inicio.php");


?>
