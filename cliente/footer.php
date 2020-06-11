<?php

$restaurantesEspecialidad = DAO::obtenerEspecialidadesRestaurante();

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Footer</title>
</head>
<body>
<footer class="page-footer font-small pt-4" style="background-color: #3e4551">

    <!-- Footer Links -->
    <div class="container text-center text-md-left" style="color: white">

        <!-- Grid row -->
        <div class="row">

            <!-- Grid column -->
            <div class="col-md-4 mx-auto">

                <!-- Content -->
                <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Yummyeat</h5>
                <p>Página web dedicada a descubrir nuevos restaurantes en los que pedir a domicilio. A disfrutar!</p>

            </div>
            <!-- Grid column -->

            <hr class="clearfix w-100 d-md-none">

            <!-- Grid column -->
            <div class="col-md-2 mx-auto">

                <!-- Links -->
                <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Especialidades</h5>

                <ul class="list-unstyled">
                    <?php foreach ($restaurantesEspecialidad as $especialidd) {?>
                    <li>
                        <a href="restaurante-especialidad.php?<?=$especialidd?>"><?=$especialidd?></a>
                    </li>
                    <?php } ?>
                </ul>

            </div>
            <!-- Grid column -->

            <hr class="clearfix w-100 d-md-none">

            <!-- Grid column -->
            <div class="col-md-2 mx-auto">

                <!-- Links -->
                <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Sobre Nosotros</h5>

                <ul class="list-unstyled">
                    <li>
                        <a href="../cliente/quienes-somos.php">Quiénes somos</a>
                    </li>
                    <li>
                        <a href="../cliente/politica-de-privacidad.php">Política de Privacidad</a>
                    </li>
                    <li>
                        <a href="../cliente/terminos.php">Términos y Condiciones</a>
                    </li>
                    <li>
                        <a href="../cliente/politica-de-cookies.php">Política de Cookies</a>
                    </li>
                </ul>

            </div>
            <!-- Grid column -->

            <hr class="clearfix w-100 d-md-none">

            <!-- Grid column -->
            <div class="col-md-2 mx-auto">

                <!-- Links -->
                <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Redes Sociales</h5>

                <ul class="list-unstyled">
                    <li>
                        <a href="#">Instagram</a>
                    </li>
                    <li>
                        <a href="#">Twitter</a>
                    </li>
                    <li>
                        <a href="#">Facebook</a>
                    </li>
                    <li>
                        <a href="#">Gmail</a>
                    </li>
                </ul>

            </div>
            <!-- Grid column -->

        </div>
        <!-- Grid row -->

    </div>
    <!-- Footer Links -->

    <hr>


    <!-- Copyright -->
    <div class="footer-copyright text-center py-3" style="color: white">© 2020 Copyright:
        <a href="https://mdbootstrap.com/"> Yummyeat.com</a>
    </div>
    <!-- Copyright -->

</footer>

</body>
</html>
