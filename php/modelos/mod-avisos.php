<?php
    include 'conec.php';
    class avisos_model{
        private $titulo;
        private $mensaje;
        private $imagen1;
        private $activo;
        public function __construct(){
            $activo = '0';
        }
        public function insert_aviso(){
            $mysqli = new conectar();
            $mysqli = $mysqli->conexion();
            date_default_timezone_set('America/Bogota');
            $hoy = date("Y-m-d");
            $query = "INSERT INTO avisos (titulo, mensaje, imagen1, activo, fecha_creacion)
            VALUES ('".$titulo."','".$mensaje."','".$imagen1."', 0, '".$hoy."');";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }
        }
        public function insert_comentario(){
            $mysqli = new conectar();
            $mysqli = $mysqli->conexion();
            date_default_timezone_set('America/Bogota');
            $hoy = date("Y-m-d");
            $query = "INSERT INTO comentarios_aviso (comentario, ts_fecha_creacion)
            VALUES ('".$comentario."','".$hoy."');";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }
        }
        public function get_aviso(){
            $mysqli = new conectar();
            $mysqli = $mysqli->conexion();
            $query = "SELECT * FROM avisos WHERE activo=1;";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }else{
                return $res;
            }
        }
        public function get_comentario($idaviso){
            $mysqli = new mysqli("localhost","root","","aqpetdb");
            $query = "SELECT * FROM comentarios_aviso WHERE id_avisoc=".$idaviso.";";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }else{
                return $res;
            }
        }
    }


?>