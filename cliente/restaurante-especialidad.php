<?php

require_once "../_comunes/comunes-app.php";

$especialidad = $_REQUEST["especialidad"];
$restaurantes = DAO::obtenerRestaurantePorEspecialidad($especialidad);

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

    <title><?=$especialidad?></title>
</head>
<body>
<h1>Jummyeat <?=$especialidad?></h1>

<table border="1">

    <tr>
        <th>Nombre</th>
        <th>Telefono</th>
        <th>direccion</th>
        <th>localidad</th>
        <th>email</th>
        <th>Especialidad</th>
    </tr>

    <?php foreach ($restaurantes as $restaurante) { ?>
        <tr>
            <td>
                <a href="restaurante-detalle.php?id=<?=$restaurante->getId()?>"><?=$restaurante->getNombre()?></a>
            </td>
            <td>
                <a><?=$restaurante->getTelefono()?></a>
            </td>
            <td>
                <a><?=$restaurante->getDireccion()?></a>
            </td>
            <td>
                <a><?=$restaurante->getLocalidad()?></a>
            </td>
            <td>
                <a><?=$restaurante->getEmail()?></a>
            </td>            <td>
                <a><?=$restaurante->getEspecialidad()?></a>
            </td>
        </tr>
    <?php } ?>

</table>


</body>
</html>