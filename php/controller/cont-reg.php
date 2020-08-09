<?php
    include '../modelos/usuario.php';
    $correo = $_POST["correo"];
    $password = $_POST["contrasenia"];
    $temp = new usuario($correo);
    usuario.login_db($password);
    echo "gaaa";
?>