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

    // RESTAURANTES

    public static function obtenerRestaurantesDestacados(): array
    {
        $datos = [];
        $rs = self::ejecutarConsulta("SELECT * FROM restaurante WHERE DESTACADO_RESTAURANTE = 1 GROUP BY NOMBRE_RESTAURANTE ORDER BY NOMBRE_RESTAURANTE", []);

        foreach ($rs as $fila) {
            $restaurante = new Restaurante($fila["ID_RESTAURANTE"], $fila["NOMBRE_RESTAURANTE"], $fila["TELEFONO_RESTAURANTE"], $fila["DIRECCION_RESTAURANTE"],
                                           $fila["LOCALIDAD_RESTAURANTE"], $fila["EMAIL_RESTAURANTE"], $fila["ESPECIALIDAD_RESTAURANTE"],
                                           $fila["DESTACADO_RESTAURANTE"]);
            array_push($datos, $restaurante); // añadimos el restaurante al array que vamos a retornas
        }
        return $datos;
    }

}

