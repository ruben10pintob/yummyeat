<?php
require_once "../_comunes/comunes-app.php";

$cantidad = $_REQUEST["cantidad"];
$idProducto = $_REQUEST["idProducto"];
$idPedido = $_REQUEST["idPedido"];

DAO::modificarUnidadesDelCarrito($idPedido,$idProducto,$cantidad);

redireccionar("carrito-ver.php");
?>
