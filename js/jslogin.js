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