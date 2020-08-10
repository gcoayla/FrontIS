function mostrar(codigo) {
            if(codigo==1){
                $("#publicaciones-admin").css("display","block");
                $("#avisos-admin").css("display","none");
            }else{
                $("#publicaciones-admin").css("display","none");
                $("#avisos-admin").css("display","block");
            }
        };
$(document).ready(function() {
    $("#publicaciones-admin").css("display","block");
    $.ajax({
            type: "POST",
            url: 'php/controller/carga-avisos.php',
            data: $(this).serialize(),
            success: function(response)
            {
                $("#avisos").html(response);
           }
       });
    $('#publi-aviso').submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: 'php/controller/pub-avis.php',
            data: $(this).serialize(),
            success: function(response)
            {
                $("#caja-alerta").html(response);
           }
       });
     });
    
});