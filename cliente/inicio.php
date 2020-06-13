<?php

require_once "../_comunes/comunes-app.php";



$restaurantesDestacados = DAO::obtenerRestaurantesDestacados();
$restaurantesEspecialidad = DAO::obtenerEspecialidadesRestaurante();

$nombreCliente = "";
$ubicacionClienteRegistrado = "Madrid";

if (haySesionIniciada()) {
    $id = $_SESSION["id"];
    $nombreCliente = $_SESSION["nombre"];
    $ubicacionClienteRegistrado = $_SESSION["localidad"];
    $restaurantesPorUbicacion = DAO::obtenerRestaurantePorUbicacion($ubicacionClienteRegistrado);
    $cantidadDeRestaurantes = sizeof($restaurantesPorUbicacion);
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

    <title>Yummyeat</title>
</head>
<body>

<?php require_once "../cliente/header.php";?>

<section id="hero">
    <div class="container">
        <div class="content-center text-center">
            <h1 class="mt-5">Dónde podemos encontrarte.</h1>
            <p>Haz que sea más fácil localizarte y buscar los restaurantes más cercanos.</p>
            <form action="restaurante-ubicacion.php" class="form-inline justify-content-center">
                <div class="form-group">
                    <input type="text" class="form-control" name="ubicacion" placeholder="<?=$ubicacionClienteRegistrado?>" required>
                </div>
                <button type="submit" class="btn btn-dark margin-left" id="hover">Buscar</button>
            </form>
        </div>
    </div>
</section>

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

<section>
    <div class="container-fluid">
        <div class="content-center text-center">
            <h2>¿Que te apetece comer hoy?</b></h2>
        </div>

        <div class="row">
            <?php foreach ($restaurantesEspecialidad as $especialidad) {?>
            <div class="col-md-4">
                <div class="restaurantes-cercanos-container">
                    <div class="restaurantes-cercanos-details">
                        <a href="#">
                            <h2><a></a><?=$especialidad?></h2>
                        </a>
                    </div>
                    <a href="restaurante-especialidad.php?especialidad=<?=$especialidad?>"><img src="../img/Especialidades/<?=$especialidad?>.jpg" class="img-fluid" alt="<?=$especialidad?>"></a>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</section>

<?php require_once "../cliente/footer.php";?>

</body>
</html>
