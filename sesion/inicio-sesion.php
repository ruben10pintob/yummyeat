<?php

require_once "../_comunes/requireonces-comunes.php";

if(haySesionIniciada()) redireccionar("../cliente/inicio.php");

?>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="../bootstrap/bootstrap-4.5.0-dist/js/bootstrap.js"></script>
    <script src="../bootstrap/bootstrap-4.5.0-dist/js/popper.min.js"></script>
    <script src="../bootstrap/bootstrap-4.5.0-dist/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="../bootstrap/bootstrap-4.5.0-dist/css/bootstrap.css">
</head>

<body>

<?php
if (isset($_REQUEST["incorrecto"])) {
    echo "<p>Usuario o contraseña incorrectos.</p>";
}
if (isset($_REQUEST["SC"])) {
    redireccionar("../cliente/inicio.php");
    echo "<p>Ha salido correctamente. Su sesión está ahora cerrada.</p>";
}
?>

<h1>Iniciar sesión</h1>

<form action="../cliente/inicio.php" method="POST">
    <label><b>Email: </b></label><input name="email" type="email" placeholder="Email"><br />
    <label><b>Contraseña: </b></label><input type="password" name="contrasenna" placeholder="Contraseña"/><br />
    <label><b>Recuérdame</b></label><input type="checkbox" name="recuerdame" /><br />
    <br />
    <input type="Submit" value="Iniciar sesión" />
</form>

</body>
</html>
