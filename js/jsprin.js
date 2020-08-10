function solicitar(codigo) {
            var parametros = {
                "codigo" : codigo
            };
            $.ajax({
                    data:  parametros,
                    url:   'php/controller/solicitar.php', 
                    type:  'post',
                    success:  function (response) {
                            alert(response);
                    }
            });
        };
$(document).ready(function() {
    $.ajax({
            type: "POST",
            url: 'php/controller/cont-avisos.php',
            data: $(this).serialize(),
            success: function(response)
            {
                $("#avisos").html(response);
           }
       });
    $.ajax({
            type: "POST",
            url: 'php/controller/cont-adop.php',
            data: $(this).serialize(),
            success: function(response)
            {
                $("#adopciones").html(response);
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
    $('.form-coment').submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: 'php/controller/coment-avis.php',
            data: $(this).serialize(),
            success: function(response)
            {
                location.reload();
           }
       });
     });
});