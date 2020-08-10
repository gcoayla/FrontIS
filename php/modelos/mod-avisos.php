<?php
    //include 'conec.php';
    class avisos_model{
        private $titulo;
        private $mensaje;
        private $imagen1;
        private $activo;
        public function __construct(){
            $activo = '0';
        }
        public function insert_aviso(){
            $mysqli = new mysqli("localhost","root","","aqpetdb");
            date_default_timezone_set('America/Bogota');
            $hoy = date("Y-m-d");
            $query = "INSERT INTO avisos (titulo, mensaje, imagen1, activo, fechacreacion)
            VALUES ('".$titulo."','".$mensaje."','".$imagen1."', 0, '".$hoy."');";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }
        }
        public function insert_comentario(){
            $mysqli = new mysqli("localhost","root","","aqpetdb");
            date_default_timezone_set('America/Bogota');
            $hoy = date("Y-m-d");
            $query = "INSERT INTO comentariosaviso (comentario, tsfechacreacion)
            VALUES ('".$comentario."','".$hoy."');";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }
        }
        public function get_aviso(){
            $mysqli = new mysqli("localhost","root","","aqpetdb");
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
            $query = "SELECT * FROM comentariosaviso WHERE idavisoc=".$idaviso.";";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }else{
                return $res;
            }
        }
    }


?>