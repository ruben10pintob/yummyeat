<?php

require_once "dao.php";
require_once "clases.php";
require_once "utilidades.php";

function sessionStartSiNoLoEsta()
{
    if(!isset($_SESSION)) {
        session_start();
    }
}
if (isset($_REQUEST['email'])){
    $cliente = DAO::clienteObtenerPorEmailYContrasenna($_REQUEST['email'], $_REQUEST['contrasenna']);
}

