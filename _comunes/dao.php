<?php

require_once "clases.php";

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

    // CLIENTES

    public static function clienteObtenerPorEmailYContrasenna($email, $contrasenna): Cliente
    {
        $rs = self::ejecutarConsulta("SELECT * FROM cliente WHERE EMAIL_CLIENTE=? AND BINARY CONTRASENNA=?",
            [$email, $contrasenna]);
        if ($rs) {
            return self::crearClienteDesdeRs($rs);
        } else {
            return null;
        }
    }

    private static function crearClienteDesdeRs(array $rs): Cliente
    {
        return new Cliente($rs[0]["ID_CLIENTE"], $rs[0]["CODIGO_COOKIE"], $rs[0]["NOMBRE_CLIENTE"], $rs[0]["APELLIDOS_CLIENTE"], $rs[0]["TELEFONO_CLIENTE"], $rs[0]["DIRECCION_CLIENTE"], $rs[0]["EMAIL_CLIENTE"],  $rs[0]["CONTRASENNA"]);
    }

    public static function clienteObtenerPorId(int $id): Cliente
    {
        $rs = self::ejecutarConsulta("SELECT * FROM cliente WHERE ID_CLIENTE=?", [$id]);
        if ($rs) return self::crearClienteDesdeRs($rs);
        else return null;
    }

    // RESTAURANTES

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

}

