<?php
include 'conec.php';
    class usuario {
        private $tipo_usuario;
        private $correo;
        public function __CONSTRUCT($correon){
            $correo = $correon;
            $tipo_usuario = '0';
        }
        public function get_from_db($correo,$clave){
            $mycon = new conectar();
            $mycon = $mycon->conexion();
            $query = "SELECT * FROM usuarios WHERE correo = '".$correo."' AND clave = '".$clave."';";
            $status = $mycon->query($query);
            return $status;
        }
        public function reg_verifi($correo){
            $mysqli = new conectar();
            $mysqli = $mysqli->conexion();
            $correo;
            $query = "SELECT * FROM usuarios  WHERE correo='".$correo." '";
            $res = $mysqli->query($query);
            if ($res->num_rows > 0){ 
                return 1; 
            }else {return 0;
                }
        }
        public function insert_db($correo,$clave){
            $mysqli = new conectar();
            $mysqli = $mysqli->conexion();
            date_default_timezone_set('America/Bogota');
            $hoy = date("Y-m-d");
            $query = "INSERT INTO usuarios (correo,clave,fechacreacion,tipousuario) VALUES ('".$correo."','".$clave."','".$hoy."',0);";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }
        }
    }
    
?>
