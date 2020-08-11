<?php
include '../modelos/mod-adop.php';
$modelo = new adopcion_model();
$res = $modelo->get_adopciones_activas();

echo('<h2>Adopta un compañero</h2>');
if($res->num_rows>0){
    
    while($row = $res->fetch_assoc()){
    echo('<div class="adopcion-box">
        <div class="adopcion-foto">
            <img src="images/adopcion/'.$row['imagen1'].'.jpg">
        </div>
        <h3 class="descr-adop">'.$row['descripcion'].'</h3>
        <div class="btn-adoptar" onclick="solicitar('.$row['id_en_adopcion'].')">SOLICITAR</div>
        </div>
    ');
}
}else{
    echo "<h6>No existen publicaciones</h6>";
}

?>