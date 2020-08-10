$(document).ready(function() {
    $('#form-login').submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: 'php/controller/cont-login.php',
            data: $(this).serialize(),
            success: function(response)
            {
                $("#caja-alerta").html(response);
                if($("#datos").attr("exito")==1){
                    document.cookie = "idsesion="+$("#datos").attr("codigo");
                   if($("#datos").attr("tipou")==0){
                        $(location).attr('href','index.html');
                    }else{
                        $(location).attr('href','admin.html');
                    }
                }else{
                    
                }
           }
       });
     });
    $('#form-registro').submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: 'php/controller/cont-reg.php',
            data: $(this).serialize(),
            success: function(response)
            {
                $("#caja-alerta").html(response);
                alert("Exito");
           }
       });
     });
});