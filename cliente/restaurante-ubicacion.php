<?php

require_once "../_comunes/dao.php";
require_once "../_comunes/clases.php";

$ubicacion = $_REQUEST["ubicacion"];
$restaurantesPorUbicacion = DAO::obtenerRestaurantePorUbicacion($ubicacion);
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
<?php require_once "../cliente/header.php"?>

<h2>Has buscado restaurantes en <?=$ubicacion?></h2>

<section>
    <?php if (haySesionIniciada()) { ?>
        <div class="container-fluid">
            <div class="content-center text-center">
                <h2>Restaurantes cerca de ti.</b></h2>
            </div>

            <div class="row">
                <?php foreach ($restaurantesPorUbicacion as $restaurante) {?>
                    <div class="col-md-4">
                        <div class="restaurantes-cercanos-container">
                            <a href="restaurante-detalle.php?id=<?=$restaurante->getId()?>"><img src="../img/Restaurantes/<?=$restaurante->getNombre()?>.jpg" class="img-fluid" alt="<?=$restaurante->getNombre()?>"></a>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    <?php } ?>
</section>

<?php require_once "../cliente/footer.php"?>

</body>
</html>
