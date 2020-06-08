<?php

require_once "clases.php";
require_once "utilidades.php";

class DAO
{
    private static $pdo = null;

    private static function obtenerPdoConexionBD()
    {
        $servidor = "localhost";
        $identificador = "root";
        $contrasenna = "";
        $bd = "yummyeat"; // Schema
        $opciones = [
            PDO::ATTR_EMULATE_PREPARES => false, // Modo emulación desactivado para prepared statements "reales"
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // Que los errores salgan como excepciones.
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // El modo de fetch que queremos por defecto.
        ];

        try {
            $pdo = new PDO("mysql:host=$servidor;dbname=$bd;charset=utf8", $identificador, $contrasenna, $opciones);
        } catch (Exception $e) {
            error_log("Error al conectar: " . $e->getMessage());
            exit("Error al conectar" . $e->getMessage());
        }

        return $pdo;
    }

    private static function ejecutarConsulta(string $sql, array $parametros): array
    {
        if (!isset(self::$pdo)) self::$pdo = self::obtenerPdoConexionBd();

        $select = self::$pdo->prepare($sql);
        $select->execute($parametros);
        return $select->fetchAll();
    }

    private static function ejecutarActualizacion(string $sql, array $parametros): void
    {
        if (!isset(self::$pdo)) self::$pdo = self::obtenerPdoConexionBd();

        $actualizacion = self::$pdo->prepare($sql);
        $actualizacion->execute($parametros);
    }

    /**********************   CLIENTES   **********************/

    private static function crearClienteDesdeRs(array $rs): Cliente
    {
        return new Cliente($rs[0]["ID_CLIENTE"], $rs[0]["CODIGO_COOKIE"], $rs[0]["NOMBRE_CLIENTE"], $rs[0]["APELLIDOS_CLIENTE"],
            $rs[0]["TELEFONO_CLIENTE"], $rs[0]["DIRECCION_CLIENTE"], $rs[0]["LOCALIDAD"], $rs[0]["EMAIL_CLIENTE"],  $rs[0]["CONTRASENNA_CLIENTE"]);
    }

    public static function clienteObtenerPorEmailYContrasenna($email, $contrasenna): Cliente
    {
        $rs = self::ejecutarConsulta("SELECT * FROM cliente WHERE EMAIL_CLIENTE=? AND BINARY CONTRASENNA_CLIENTE=?",
            [$email, $contrasenna]);
        if ($rs) {
            return self::crearClienteDesdeRs($rs);
        } else {
            return null;
        }
    }

    public static function clienteObtenerPorEmailYCodigoCookie($email, $codigoCookie): Cliente
    {
        $rs = self::ejecutarConsulta("SELECT * FROM cliente WHERE EMAIL_CLIENTE=? AND BINARY CODIGO_COOKIE=?",
            [$email, $codigoCookie]);
        if ($rs) {
            return self::crearClienteDesdeRs($rs);
        } else {
            return null;
        }
    }

    public static function clienteObtenerPorId(int $id): Cliente
    {
        $rs = self::ejecutarConsulta("SELECT * FROM cliente WHERE ID_CLIENTE=?", [$id]);
        if ($rs) return self::crearClienteDesdeRs($rs);
        else return null;
    }

    public static function comprobarEmailUsado($email)
    {
        $rs = self::ejecutarConsulta("SELECT * FROM cliente WHERE EMAIL_CLIENTE = ?", [$email]);
        if ($rs) return 1;
        else return 0;
    }

    public static function clienteGuardarCodigoCookie(string $email, string $codigoCookie = null)
    {
        if ($codigoCookie != null)
        {
            self::ejecutarActualizacion("UPDATE cliente SET codigo_cookie = ? WHERE email_cliente = ?", [$codigoCookie, $email]);
        } else {
            self::ejecutarActualizacion("UPDATE cliente SET codigo_cookie = NULL WHERE email_cliente = ?", [$email]);
        }

    }

    public static function registrarNuevoCliente($nombre, $apellidos, $telefono, $direccion, $localidad, $email, $contrasenna)
    {
        if (self::comprobarEmailUsado($email) == 1){
            return 0;
        }else{
            self::ejecutarActualizacion("INSERT INTO cliente (NOMBRE_CLIENTE, APELLIDOS_CLIENTE, TELEFONO_CLIENTE, DIRECCION_CLIENTE, LOCALIDAD, EMAIL_CLIENTE, 
                                        CONTRASENNA_CLIENTE) VALUES (?,?,?,?,?,?,?)",[$nombre, $apellidos, $telefono, $direccion, $localidad, $email, $contrasenna]);
            return 1;
        }
    }

    public static function modificarInfoCliente($nombre, $apellidos, $telefono, $direccion, $localidad, $id)
    {
        self::ejecutarActualizacion("UPDATE cliente SET NOMBRE_CLIENTE=?,APELLIDOS_CLIENTE=?,TELEFONO_CLIENTE=?,DIRECCION_CLIENTE=?,LOCALIDAD=? WHERE ID_CLIENTE = ?", [$nombre, $apellidos, $telefono, $direccion, $localidad, $id]);
    }

    /**********************   RESTAURANTES   **********************/

    private static function crearListaDeRestaurante($rs) // Para crear los restaurantes y añadirlos a un array
    {
        $restaurantes = [];
        foreach ($rs as $fila) {
            $restaurante = new Restaurante($fila["ID_RESTAURANTE"], $fila["NOMBRE_RESTAURANTE"], $fila["TELEFONO_RESTAURANTE"], $fila["DIRECCION_RESTAURANTE"],
                $fila["LOCALIDAD_RESTAURANTE"], $fila["EMAIL_RESTAURANTE"], $fila["ESPECIALIDAD_RESTAURANTE"],
                $fila["DESTACADO_RESTAURANTE"]);
            array_push($restaurantes, $restaurante); // añadimos el restaurante al array que vamos a retornar
        }
        return $restaurantes;
    }

    public static function obtenerRestaurantesDestacados(): array
    {

        $rs = self::ejecutarConsulta("SELECT * FROM restaurante WHERE DESTACADO_RESTAURANTE = 1", []);

        $restaurantes = self::crearListaDeRestaurante($rs);

        return $restaurantes;
    }

    public static function obtenerRestaurantesSegunUbicacionCliente(String $ubicacionCliente): array
    {

        $rs = self::ejecutarConsulta("SELECT * FROM restaurante WHERE LOCALIDAD_RESTAURANTE = ?", [$ubicacionCliente]);

        $restaurantes = self::crearListaDeRestaurante($rs);

        return $restaurantes;
    }

    public static function obtenerRestaurantePorEspecialidad(String $especialidadRestaurante): array
    {

        $rs = self::ejecutarConsulta("SELECT * FROM restaurante WHERE ESPECIALIDAD_RESTAURANTE = ?", [$especialidadRestaurante]);

        $restaurantes = self::crearListaDeRestaurante($rs);

        return $restaurantes;
    }

    public static function restauranteObtenerPorId($id)
    {
        $rs = self::ejecutarConsulta("SELECT * FROM restaurante WHERE ID_RESTAURANTE = ?", [$id]);
        $restaurante = new Restaurante($rs[0]["ID_RESTAURANTE"], $rs[0]["NOMBRE_RESTAURANTE"], $rs[0]["TELEFONO_RESTAURANTE"],
                                       $rs[0]["DIRECCION_RESTAURANTE"], $rs[0]["LOCALIDAD_RESTAURANTE"], $rs[0]["EMAIL_RESTAURANTE"],
                                       $rs[0]["ESPECIALIDAD_RESTAURANTE"], $rs[0]["DESTACADO_RESTAURANTE"]);
        return $restaurante;
    }

    public static function obtenerRestaurantePorUbicacion($ubicacion)
    {
        $rs = self::ejecutarConsulta("SELECT * FROM restaurante WHERE LOCALIDAD_RESTAURANTE = ?", [$ubicacion]);

        $restaurantes = self::crearListaDeRestaurante($rs);

        return $restaurantes;

    }

    public static function obtenerEspecialidadesRestaurante(): array
    {
        $especialidades = [];
        $rs = self::ejecutarConsulta("SELECT * FROM restaurante GROUP by ESPECIALIDAD_RESTAURANTE", []);

        foreach ($rs as $fila) {
            $especialidad = $fila["ESPECIALIDAD_RESTAURANTE"];
            array_push($especialidades, $especialidad);
        }
        return $especialidades;
    }

    /**********************   PRODUCTOS   **********************/

    private static function crearListaDeProductos($rs) // Para crear los productos y añadirlos a un array
    {
        $productos = [];
        foreach ($rs as $fila) {
            $producto = new Producto($fila["ID_PRODUCTO"], $fila["NOMBRE_PRODUCTO"], $fila["DESCRIPCION_PRODUCTO"],
                $fila["CATEGORIA_PRODUCTO"], $fila["PRECIO_PRODUCTO"]);
            array_push($productos, $producto); // añadimos el producto al array que vamos a retornar
        }
        return $productos;
    }

    public static function obtenerProductosRestaurante($id): array
    {

        $rs = self::ejecutarConsulta("SELECT p.ID_PRODUCTO, p.NOMBRE_PRODUCTO, p.DESCRIPCION_PRODUCTO, p.CATEGORIA_PRODUCTO, p.PRECIO_PRODUCTO 
                                           FROM producto p, restaurante r, producto_restaurante pr WHERE p.ID_PRODUCTO = pr.ID_PRODUCTO 
                                           AND r.ID_RESTAURANTE = pr.ID_RESTAURANTE AND r.ID_RESTAURANTE = ? GROUP BY p.NOMBRE_PRODUCTO",[$id]);
        $productos = self::crearListaDeProductos($rs);
        return $productos;
    }

    public static function obtenerCategoriaProductosPorRestaurante($idRestaurante): array
    {
        $categorias = [];
        $rs = self::ejecutarConsulta("SELECT p.CATEGORIA_PRODUCTO FROM producto p, restaurante r, producto_restaurante pr WHERE p.ID_PRODUCTO = pr.ID_PRODUCTO 
                                           AND r.ID_RESTAURANTE = pr.ID_RESTAURANTE AND r.ID_RESTAURANTE = ? GROUP BY p.CATEGORIA_PRODUCTO", [$idRestaurante]);

        foreach ($rs as $fila) {
            $categoria = $fila["CATEGORIA_PRODUCTO"];
            array_push($categorias, $categoria);
        }

        return $categorias;

    }

    public static function obtenerProductosPorCategoria($categoria, $idRestaurante): array
    {
        $rs = self::ejecutarConsulta("SELECT p.ID_PRODUCTO, p.NOMBRE_PRODUCTO, p.DESCRIPCION_PRODUCTO, p.CATEGORIA_PRODUCTO, p.PRECIO_PRODUCTO 
                                           FROM producto p, restaurante r, producto_restaurante pr WHERE p.ID_PRODUCTO = pr.ID_PRODUCTO AND 
                                           r.ID_RESTAURANTE = pr.ID_RESTAURANTE AND p.CATEGORIA_PRODUCTO = ? AND r.ID_RESTAURANTE = ?",[$categoria, $idRestaurante]);

        $productos = self::crearListaDeProductos($rs);

        return $productos;
    }

    public  static function obtenerDetallesProducto($id)
    {
        $rs = self::ejecutarConsulta("SELECT * FROM producto WHERE ID_PRODUCTO = ?", [$id]);
        $producto = new Producto($rs[0]["ID_PRODUCTO"], $rs[0]["NOMBRE_PRODUCTO"], $rs[0]["DESCRIPCION_PRODUCTO"],
            $rs[0]["CATEGORIA_PRODUCTO"], $rs[0]["PRECIO_PRODUCTO"]);

        return $producto;
    }

    public static function obtenerPrecioProducto($idProducto){
        $rs = self::ejecutarConsulta("SELECT * FROM PRODUCTO WHERE ID_PRODUCTO = ?", [$idProducto]);
        $precio = $rs[0]["PRECIO_PRODUCTO"];
        return $precio;
    }



    //CARRITO

    public static function crearNuevoCarrito($cliente, $restaurante){
        self::ejecutarActualizacion("INSERT INTO PEDIDO (ID_RESTAURANTE, ID_CLIENTE) VALUES (?,?)", [$restaurante,$cliente]);
    }

    public static function obtenerIdPedido($idCliente){
        $rs = self::ejecutarConsulta("SELECT * FROM pedido WHERE ID_CLIENTE = ? ORDER by NUMERO_PEDIDO DESC",[$idCliente]);
        return $rs[0]["NUMERO_PEDIDO"];
    }

    public static function annadirProductoCarrito($pedido, $producto, $unidades, $precio){
        self::ejecutarActualizacion("INSERT INTO LINEA (ID_PEDIDO, ID_PRODUCTO, UNIDADES, PRECIO_UNITARIO) VALUES (?,?,?,?)", [$pedido, $producto, $unidades, $precio]);
    }


    public static function obtenerCarrito($clienteId)
    {

        $rsPedidoId = self::ejecutarConsulta(
            "SELECT * FROM linea INNER JOIN pedido ON linea.ID_PEDIDO = pedido.NUMERO_PEDIDO WHERE ID_CLIENTE=? AND FECHA_PEDIDO_REALIZADO IS null",
            [$clienteId]
        );
        if ($rsPedidoId == null){
            return null;
        }else{
            $pedidoID = $rsPedidoId[0]["ID_PEDIDO"];
            return $pedidoID;
        }

    }

    public static function obtenerDetalleCarrito($pedidoId)
    {
         $rs = self::ejecutarConsulta("SELECT l.ID_PRODUCTO, l.ID_PEDIDO, l.PRECIO_UNITARIO, p.NOMBRE_PRODUCTO, l.UNIDADES, p.DESCRIPCION_PRODUCTO FROM LINEA l, PRODUCTO p WHERE l.ID_PRODUCTO = p.ID_PRODUCTO AND ID_PEDIDO = ?", [$pedidoId]);
         return $rs;
    }

    public static function comprobarSiExisteProducto($productoId, $pedidoId)
    {
        $rs = self::ejecutarConsulta("SELECT * FROM linea WHERE ID_PRODUCTO = ? AND ID_PEDIDO = ?",[$productoId,$pedidoId]);
        return $rs;
    }

    public static function modificarUnidades($unidadesNuevas,$productoId, $pedidoId)
    {
        $rs = self::ejecutarConsulta("SELECT UNIDADES FROM linea WHERE ID_PRODUCTO = ? AND ID_PEDIDO = ?",[$productoId,$pedidoId]);
        foreach ($rs as $linea){
            $unidadesNuevas+= $linea["UNIDADES"];
        }
        self::ejecutarActualizacion("UPDATE linea SET UNIDADES=? WHERE ID_PEDIDO=? AND ID_PRODUCTO=?",[$unidadesNuevas,$pedidoId,$productoId]);
    }

    public static function eliminarTodasUnidadesProductoCarrito($idPedido, $idProducto)
    {
        self::ejecutarActualizacion("DELETE FROM `linea` WHERE ID_PEDIDO = ? AND ID_PRODUCTO = ?",[$idPedido, $idProducto]);
    }

    public static function modificarUnidadesDelCarrito($idPedido, $idProducto, $unidades)
    {
        self::ejecutarActualizacion("UPDATE linea SET UNIDADES = ? WHERE ID_PEDIDO = ? AND ID_PRODUCTO = ?", [$unidades, $idPedido, $idProducto]);
    }


    //PEDIDOS
    public static function obtenerPedidosCliente($idCliente)
    {

        $rsPedidos = self::ejecutarConsulta("SELECT pedido.NUMERO_PEDIDO, pedido.ID_RESTAURANTE, pedido.DIRECCION_ENTREGA, pedido.PRECIO_PEDIDO, pedido.FECHA_PEDIDO_REALIZADO FROM pedido, cliente WHERE pedido.ID_CLIENTE=cliente.ID_CLIENTE AND pedido.ID_CLIENTE=? AND pedido.FECHA_PEDIDO_REALIZADO IS NOT NULL", [$idCliente]);
        return $rsPedidos;

    }

    public static function realizarPedido($direccionEntrega, $numeroPedido)
    {
        $fecha = obtenerFecha();

        self::ejecutarActualizacion("UPDATE pedido SET DIRECCION_ENTREGA = ?, FECHA_PEDIDO_REALIZADO = ? WHERE pedido.NUMERO_PEDIDO = ?"
                                        ,[$direccionEntrega, $fecha, $numeroPedido]);
    }

    public static function obtenerDetallePedido($idPedido)
    {
        $rs = self::ejecutarConsulta("SELECT l.ID_PRODUCTO, l.ID_PEDIDO, l.PRECIO_UNITARIO, p.NOMBRE_PRODUCTO, l.UNIDADES, p.DESCRIPCION_PRODUCTO FROM LINEA l, PRODUCTO p WHERE l.ID_PRODUCTO = p.ID_PRODUCTO AND ID_PEDIDO = ?", [$idPedido]);
        return $rs;
    }

}



