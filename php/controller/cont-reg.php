<?php
    include '../modelos/usuario.php';
    $correo = $_POST["correo"];
    $password = $_POST["contrasenia"];
    $temp = new usuario($correo);

    $res = $temp -> reg_verifi($correo);
    if($res == 0){
        $res1 = $temp->insert_db($correo,$password);
        echo "Registro exitoso";
    }else{
        echo "Correo existente";
    }
?>