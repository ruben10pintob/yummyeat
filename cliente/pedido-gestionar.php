<?php

require_once "../_comunes/comunes-app.php";

$idPedido = DAO::obtenerCarrito($_SESSION["id"]);
$direccionCliente = $_REQUEST["direccionCliente"];

DAO::realizarPedido($direccionCliente, $idPedido);

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<p>Gracias por pedir con nosotros</p>
<a href="inicio.php">Volver a inicio</a>
</body>
</html>
