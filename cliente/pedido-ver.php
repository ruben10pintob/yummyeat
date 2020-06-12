<?php

require_once "../_comunes/comunes-app.php";
$pedidos = DAO::obtenerPedidosCliente($_SESSION["id"]);
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
    <title>Pedidos</title>
</head>
<body>
<?php require_once "header.php"?>
<h1 style="margin-top: 100px">Listado de pedidos</h1>

<table class="table table-hover">

    <tr>
        <th>Código de pedido</th>
        <th>Dirección de envío</th>
        <th>Fecha de confirmación</th>
    </tr>

    <?php foreach ($pedidos as $pedido) {?>
        <?php $date = date_create($pedido["FECHA_PEDIDO_REALIZADO"]);
         date_format($date, 'd-m-Y H:i:s');?>
        <tr>
            <td>
                <?=$pedido["NUMERO_PEDIDO"]?>
            </td>
            <td>
                <?=$pedido["DIRECCION_ENTREGA"]?>
            <td>
                <?=date_format($date, 'd-m-Y H:i:s')?>
            </td>
            <td>
                <a href='pedido-detalle.php?id=<?=$pedido["NUMERO_PEDIDO"]?>' class="btn btn-dark btn-lg active" role="button" aria-pressed="true">Ver detalle del pedido</a>
            </td>
        </tr>
    <?php } ?>

</table>
<a href="../cliente/inicio.php" class="btn btn-dark btn-lg active" role="button" aria-pressed="true">Volver a la página de inicio</a>
<?php require_once "footer.php"?>
</body>
</html>
