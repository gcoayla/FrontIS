function solicitar(codigo) {
            var parametros = {
                "codigo" : codigo
            };
            $.ajax({
                    data:  parametros,
                    url:   'php/solicitar.php', 
                    type:  'post',
                    success:  function (response) {
                            alert(response);
                    }
            });
        };
$(document).ready(function() {
    $.ajax({
            type: "POST",
            url: 'php/carga-avisos.php',
            data: $(this).serialize(),
            success: function(response)
            {
                $("#avisos").html(response);
           }
       });
    $.ajax({
            type: "POST",
            url: 'php/carga-pub.php',
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
            url: 'php/pub-avis.php',
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
            url: 'php/coment-avis.php',
            data: $(this).serialize(),
            success: function(response)
            {
                location.reload();
           }
       });
     });
});