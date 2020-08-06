$(document).ready(function() {
    $('#form-login').submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: 'php/cont-login.php',
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
            url: 'php/cont-reg.php',
            data: $(this).serialize(),
            success: function(response)
            {
                $("#caja-alerta").html(response);
                ejecutar(); 
           }
       });
     });
});