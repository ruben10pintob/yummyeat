<?php

    trait Identificable // Para los objetos que tengan id
    {
        protected $id;

        public function getId()
        {
            return $this->id;
        }

        public function setId($id)
        {
            $this->id = $id;
        }
}

    class Restaurante
    {
        use Identificable;

        private $nombre;
        private $telefono;
        private $direccion;
        private $localidad;
        private $email;
        private $especialidad;
        private $destacado;

        public function __construct($id, $nombre, $telefono, $direccion, $localidad, $email, $especialidad, $destacado)
        {
            $this->setId($id);
            $this->setNombre($nombre);
            $this->setTelefono($telefono);
            $this->setDireccion($direccion);
            $this->setLocalidad($localidad);
            $this->setEmail($email);
            $this->setEspecialidad($especialidad);
            $this->setDestacado($destacado);
        }

        public function getNombre()
        {
            return $this->nombre;
        }

        public function setNombre($nombre)
        {
            $this->nombre = $nombre;
        }

        public function getTelefono()
        {
            return $this->telefono;
        }

        public function setTelefono($telefono)
        {
            $this->telefono = $telefono;
        }

        public function getDireccion()
        {
            return $this->direccion;
        }

        public function setDireccion($direccion)
        {
            $this->direccion = $direccion;
        }

        public function getLocalidad()
        {
            return $this->localidad;
        }

        public function setLocalidad($localidad)
        {
            $this->localidad = $localidad;
        }

        public function getEmail()
        {
            return $this->email;
        }

        public function setEmail($email)
        {
            $this->email = $email;
        }

        public function getEspecialidad()
        {
            return $this->especialidad;
        }

        public function setEspecialidad($especialidad)
        {
            $this->especialidad = $especialidad;
        }

        public function getDestacado()
        {
            return $this->destacado;
        }

        public function setDestacado($destacado)
        {
            $this->destacado = $destacado;
        }


    }

    class Cliente
    {
        use Identificable;

        private $codigoCookie;
        private $nombre;
        private $apellidos;
        private $telefono;
        private $direccion;
        private $email;
        private $contrasenna;

        public function __construct($id, $nombre, $codigoCookie, $apellidos, $telefono, $direccion, $email, $contrasenna)
        {
            $this->setId($id);
            $this->setNombre($nombre);
            $this->setCodigoCookie($codigoCookie);
            $this->setApellidos($apellidos);
            $this->setTelefono($telefono);
            $this->setDireccion($direccion);
            $this->setEmail($email);
            $this->setContrasenna($contrasenna);
        }

        public function getCodigoCookie()
        {
            return $this->codigoCookie;
        }

        public function setCodigoCookie($codigoCookie)
        {
            $this->codigoCookie = $codigoCookie;
        }

        public function getNombre()
        {
            return $this->nombre;
        }

        public function setNombre($nombre)
        {
            $this->nombre = $nombre;
        }

        public function getApellidos()
        {
            return $this->apellidos;
        }

        public function setApellidos($apellidos)
        {
            $this->apellidos = $apellidos;
        }

        public function getTelefono()
        {
            return $this->telefono;
        }

        public function setTelefono($telefono)
        {
            $this->telefono = $telefono;
        }

        public function getDireccion()
        {
            return $this->direccion;
        }

        public function setDireccion($direccion)
        {
            $this->direccion = $direccion;
        }

        public function getEmail()
        {
            return $this->email;
        }

        public function setEmail($email)
        {
            $this->email = $email;
        }

        public function getContrasenna()
        {
            return $this->contrasenna;
        }

        public function setContrasenna($contrasenna)
        {
            $this->contrasenna = $contrasenna;
        }
    }

    class Producto
    {
        use Identificable;

        private $nombre;
        private $descripcion;
        private $categoria;
        private $precio;

        public function __construct($id, $nombre, $categoria, $descripcion, $precio)
        {
            $this->setId($id);
            $this->setNombre($nombre);
            $this->setCategoria($categoria);
            $this->setDescripcion($descripcion);
            $this->setPrecio($precio);
        }

        public function getNombre()
        {
            return $this->nombre;
        }

        public function setNombre($nombre)
        {
            $this->nombre = $nombre;
        }

        public function getDescripcion()
        {
            return $this->descripcion;
        }

        public function setDescripcion($descripcion)
        {
            $this->descripcion = $descripcion;
        }

        public function getCategoria()
        {
            return $this->categoria;
        }

        public function setCategoria($categoria)
        {
            $this->categoria = $categoria;
        }

        public function getPrecio()
        {
            return $this->precio;
        }

        public function setPrecio($precio)
        {
            $this->precio = $precio;
        }


    }