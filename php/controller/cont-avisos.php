<?php
    include '../modelos/mod-avisos.php';
    $temp = new avisos_model();

    $res = $temp ->get_aviso();
    if($res->num_rows>0){
        while ($row = $res->fetch_assoc()){
            $idaviso = $row['id_aviso'];
            $titulo = $row ['titulo'];
            $mensaje = $row['mensaje'];
            $imagen = $row['imagen1'];
            echo '<div class="aviso-box">
            <div class="aviso-foto">
                <img src="images/avisos/'.$imagen.'.jpg">
            </div>
            <h3 class="tit-avis">'.$titulo.'</h3>
            <p class="descr-avis">'.$mensaje.'</p>
            <h6>Comentarios:</h6>';
        }
        $res1 = $temp ->get_comentario();
        if($res1->num_rows=0){
            while($row = $res1->fetch_assoc()){
                $comentario = $row['comentario'];
                echo '<div class="comentario"><p>'.$comentario.'</p></div>';
            }
        }else{
            echo "<h6>No existen comentarios</h6>";
        }
        echo '<form class="form-coment" method="post">
            <h6>Deja un comentario</h6>
            <input type="number" name="codigo-pub" value="'.$idaviso.'" style="display: none">
            <input type="text" name="coment-form" class="coment-form" required>
            <input type="submit" class="coment-sub">
            </form>
         </div>';
    }else{
        echo "<h6>No se encontraron resultados</h6>";
    }

?>
