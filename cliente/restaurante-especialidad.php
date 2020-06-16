<?php

require_once "../_comunes/comunes-app.php";


$especialidad = $_REQUEST["especialidad"];
$localidades = DAO::obtenerUbicacionesRestaurante();
//$restaurantes = DAO::obtenerRestaurantePorEspecialidad($especialidad);

if (haySesionIniciada()) {
    $localidadClienteRegistrado = $_SESSION["localidad"];
    $restauranteEspecialidUbicacionCliente = DAO::obtenerRestaurantesPorEspecialidadYUbicacion($localidadClienteRegistrado, $especialidad);
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

    <title><?=$especialidad?></title>
</head>
<body>
<?php require_once "header.php"?>

<?php if (haySesionIniciada() && empty($restauranteEspecialidUbicacionCliente)) {?>

    <div style="margin-top: 100px" id="botones">
        <h1>En estos momentos no hay retaurantes de <?=$especialidad?> en <?=$localidadClienteRegistrado?></h1>
        <a href="../cliente/inicio.php" class="btn btn-dark" style="margin-top: 20px" id="hover">Volver a la página de inicio</a>
        <a href="#" class="btn btn-dark" style="margin-top: 20px" id="hover" name="DesplegarRestaurantes">Ver restaurante de <?=$especialidad?> en otras localidades</a>
    </div>

    <?php foreach ($localidades as $fila) {
    $restaurantesPorEspecialidadUbicacion = DAO::obtenerRestaurantesPorEspecialidadYUbicacion($fila, $especialidad);

if (!empty($restaurantesPorEspecialidadUbicacion)) { ?>

<section style="display: none" id="restaurantesOcultos">
    <div class="container-fluid">
        <div class="content-center text-center">
            <h2>Restaurantes en <?=$fila?></b></h2>
        </div>

        <div class="row">
            <?php foreach ($restaurantesPorEspecialidadUbicacion as $restaurante) {?>
                <div class="col-md-4">
                    <div class="restaurantes-cercanos-container">
                        <a href="restaurante-detalle.php?id=<?=$restaurante->getId()?>"><img src="../img/Restaurantes/<?=$restaurante->getNombre()?>.jpg" class="img-fluid" alt="<?=$restaurante->getNombre()?>"></a>
                        </figure>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</section>
<?php   }
    }?>

<?php } else if (haySesionIniciada() && !empty($restauranteEspecialidUbicacionCliente)) {?>

<h1 class="text-center" style="margin-top: 100px"><?=$especialidad?></h1>

    <section>
        <div class="container-fluid">
            <div class="content-center text-center">
                <h2>Restaurantes en <?=$localidadClienteRegistrado?></b></h2>
            </div>

            <div class="row">
                <?php foreach ($restauranteEspecialidUbicacionCliente as $restaurante) {?>
                    <div class="col-md-4">
                        <div class="restaurantes-cercanos-container">
                            <a href="restaurante-detalle.php?id=<?=$restaurante->getId()?>"><img src="../img/Restaurantes/<?=$restaurante->getNombre()?>.jpg" class="img-fluid" alt="<?=$restaurante->getNombre()?>"></a>
                            </figure>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </section>

<?php } else { ?>

<?php foreach ($localidades as $fila) {
    $restaurantesPorEspecialidadUbicacion = DAO::obtenerRestaurantesPorEspecialidadYUbicacion($fila, $especialidad);

if (!empty($restaurantesPorEspecialidadUbicacion)) { ?>

<section>
    <div class="container-fluid">
        <div class="content-center text-center">
            <h2>Restaurantes en <?=$fila?></b></h2>
        </div>

        <div class="row">
            <?php foreach ($restaurantesPorEspecialidadUbicacion as $restaurante) {?>
                <div class="col-md-4">
                    <div class="restaurantes-cercanos-container">
                        <a href="restaurante-detalle.php?id=<?=$restaurante->getId()?>"><img src="../img/Restaurantes/<?=$restaurante->getNombre()?>.jpg" class="img-fluid" alt="<?=$restaurante->getNombre()?>"></a>
                        </figure>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</section>
<?php   }
    }
}?>

<?php require_once "footer.php" ?>

<script src="../js/desplegarRestaurantesPorEspecialidad.js"></script>
</body>
</html>