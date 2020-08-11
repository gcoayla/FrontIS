<?php
    include 'conec.php';
    class adopcion_model{
        private $id;
        private $descripcion;
        private $imagen;
        public function get_adopciones_activas(){
            $mysqli = new conectar();
            $mysqli = $mysqli->conexion();
            $query = "SELECT * FROM en_adopcion WHERE activo = 1;";
            $res = $mysqli->query($query);
            return $res;
        }
    }
?>