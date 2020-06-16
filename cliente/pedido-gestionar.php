<?php

require_once "../_comunes/comunes-app.php";

$idPedido = DAO::obtenerCarrito($_SESSION["id"]);
$direccionCliente = $_REQUEST["direccionCliente"];

DAO::realizarPedido($direccionCliente, $idPedido);

if (empty("$idPedido")){
    redireccionar("../cliente/inicio.php");
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

    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

    <script src="../bootstrap/js/jquery.min.js"></script>
    <script src="../bootstrap/js/popper.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>

    <title>Document</title>
</head>
<body>
<?php require_once "header.php"?>
<p style="margin-top: 100px">¡Gracias por pedir con nosotros!</p>
<p>En breves le enviaremos un correo con los detalles del pedido y la hora estimada de la entrega</p>
<a href="../cliente/pedido-ver.php" class="btn btn-dark btn-active" role="button" aria-pressed="true" style="margin-top: 100px">Ver pedidos</a>
<a href="../cliente/inicio.php" class="btn btn-dark btn-active" role="button" aria-pressed="true" style="margin-top: 100px">Volver a la página de inicio</a>
<?php require_once "footer.php"?>
</body>
</html>
