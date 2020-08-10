<?php
$usuario = $_COOKIE['idsesion'];
$mysqli = new mysqli("localhost","root","","aqpetdb");
if ($mysqli -> connect_errno) {
    echo "Falló: " . $mysqli -> connect_error;
    exit();
}
$query = "SELECT * FROM enadopcion;";
$res = $mysqli->query($query);
echo('<h2>Adopta un compañero</h2>');
while($row = $res->fetch_assoc()){
    echo('<div class="adopcion-box">
        <div class="adopcion-foto">
            <img src="images/adopcion/'.$row['imagen1'].'.jpg">
        </div>
        <h3 class="descr-adop">'.$row['descripcion'].'</h3>
        <div class="btn-adoptar">SOLICITAR</div>
        </div>
    ');
}
?>