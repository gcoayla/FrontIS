$(document).ready(function() {
    $('#form-login').submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: 'php/insertar.php',
            data: $(this).serialize(),
            success: function(response)
            {
                $("#caja-alerta").html(response);
           }
       });
     });
    $('#form-registro').submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: 'php/cargaprop.php',
            data: $(this).serialize(),
            success: function(response)
            {
                $("#horario").html(response);
                ejecutar(); 
           }
       });
     });
});