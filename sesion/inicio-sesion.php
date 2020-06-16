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

    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../css/inicioSesion.css">

    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

    <script src="../bootstrap/js/jquery.min.js"></script>
    <script src="../bootstrap/js/popper.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
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


<div class="global-container">
    <div class="card login-form">
        <div class="card-body">
            <h3 class="card-title text-center">Inicia sesión</h3>
            <div class="card-text">
                <form action="../cliente/inicio.php" method="post">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Dirección de correo</label>
                        <input type="email" class="form-control form-control-sm" name="email" placeholder="Email@gmail.com">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Contraseña</label>
                        <input type="password" class="form-control form-control-sm" name="contrasenna" placeholder="Contraseña">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputRecuerdame">Recuérdame</label>
                        <input type="checkbox" class="form-control form-control-sm" name="recuerdame">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Iniciar Sesión</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
