<?php
    include '../modelos/usuario.php';
    //echo "raaa";
    $correo = $_POST["usuario"];
    $password = $_POST["contrasenia"];
    $temp_user = new usuario($correo);
    $autorizacion = $temp_user->get_from_db($correo,$password);
    if ($autorizacion->num_rows > 0){
        while ($row = $autorizacion->fetch_assoc()){
            $tipou=$row['tipousuario'];
            $codigo=$row['idusuario'];
            echo "<div id='datos' exito='1' tipou='".$tipou."' codigo='".$codigo."'>Logeando</div>";
        }
    } else {
        echo "<div id='datos' exito='0'>Datos erroneos</div>";
    }
?>