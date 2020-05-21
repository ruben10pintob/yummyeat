<?php

require_once "../_comunes/comunes-app.php";

destruirSesionYCookies($_SESSION["email"]);

redireccionar("../cliente/inicio.php");

?>