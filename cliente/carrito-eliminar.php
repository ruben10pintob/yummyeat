<?php
require_once "../_comunes/comunes-app.php";

$idPedido = $_REQUEST["idPedido"];
$idProducto = $_REQUEST["idProducto"];

DAO::eliminarTodasUnidadesProductoCarrito($idPedido, $idProducto);

redireccionar("carrito-ver.php");
?>