<?php
    //include 'conec.php';
    class usuario {
        private $tipo_usuario;
        private $correo;
        public function __CONSTRUCT($correon){
            $correo = $correon;
            $tipo_usuario = '0';
        }
        public function get_from_db($correo,$clave){
            $mycon = new mysqli("localhost:3307","root","","aqpetdb");
            $query = "SELECT * FROM usuarios WHERE correo = '".$correo."' AND clave = '".$clave."';";
            $status = $mycon->query($query);
            return $status;
            
        }
        public function login_db($correo,$clave){
            //$conex = $mysqli
            $query = "INSERT INTO usuarios (correo,clave) VALUES '".$correo."','".$clave."';";
            if(mysqli.query($query) === FALSE){
                echo "Error: ".$mysqli->error;
            }
        }
    }
    
?>
