# AQPet
AQPet es una plataforma web que facilita el proceso de adopción de mascotas de un refugio,
además de tener un sistema de interacción de usuarios
donde se puede realizar la publicación de mascotas perdidas
## Integrantes
- Aquise Santos, Angela
    -Modelo avisos y usuario
    -Controlador avisos y registro
- Chayña Batallanes , Josnick
    -Modelo adopciones y usuario
    -Controlador adopciones y login
- Coayla Zuñiga, Gonzalo Eduardo
    -Interfaces HTML
    -Estilos CSS
    -Archivos JavaScript
## Software necesario
- XAMPP v3.2.4 (Servidor Apache y BD)
## Pasos de ejecución
1. Realizar la instalación predeterminada de XAMPP v3.2.4 y ejecutar los servicios Apache y MySQL
2. Copiar el contenido del repositorio en la ruta /xampp/htdocs/AQPET
3. Ejecutar el query contenido en la carpeta BD para generar la base de datos
4. Ejecutar las inserciones contenidas en la carpeta BD
5. Abrir en el navegador la ruta localhost/AQPET/login.html
## Usuarios
La plataforma permite el acceso de dos tipos de usuarios
1. Usuario
Un usuario será cualquier persona que puede entrar a la web y revisar las publicaciones de adopciones y avisos de mascotas perdidas
2. Usuario registrado
Cuenta con las funciones de un usuario pero se le permite realizar una solicitud de adopción y puede publicar avisos de mascotas perdidas
3. Administrador
Gestiona las publicaciones y avisos, pudiendo crear, leer y borrar estas, además desempeña la función de aprobar de forma manual los avisos creados por los usuarios registrados 
## Arquitectura del proyecto
Este funciona bajo un patrón de arquitectura MVC
1. Vistas: Creadas con HTML, CSS, JAVASCRIPT y el framework JQuery, existen tres vistas principales:
    - Login o registro
    - Sección de usuario
    - Página de administración
2. Controlador: Funciona bajo PHP responde a cada petición generada por las vistas
3. Modelos: Tambien creados con PHP existen tres principalmente:
    -Usuario: Modela las acciones que puede realizar el usuario
    -Avisos: Modela las acciones que se realizan con los avisos, los comentarios de estos y su interacción con los usuarios
    -Adopción: Modela las acciones que se realizan con las adopciones y las solicitudes de adopción
## Estilos de programación
1. Trinity: Como se describió anteriormente la plataforma se basa en una arquitectura MVC
2. Things: Se utilizo programación orientada a objetos al momento de definir los modelos, teniendo solamente estos acceso a la base de datos.
    -Clase usuario
```
class usuario {
        private $tipo_usuario;
        private $correo;
        public function __CONSTRUCT($correon){
            $correo = $correon;
            $tipo_usuario = '0';
        }
        public function get_from_db($correo,$clave){
            $mycon = new mysqli("localhost","root","","aqpetdb");
            $query = "SELECT * FROM usuarios WHERE correo = '".$correo."' AND clave = '".$clave."';";
            $status = $mycon->query($query);
            return $status;
        }
        public function reg_verifi($correo){
            $mysqli = new mysqli("localhost","root","","aqpetdb");
            $correo;
            $query = "SELECT * FROM usuarios  WHERE correo='".$correo." '";
            $res = $mysqli->query($query);
            if ($res->num_rows > 0){ 
                return 1; 
            }else {return 0;
                }
        }
        public function insert_db($correo,$clave){
            $mysqli = new mysqli("localhost","root","","aqpetdb");
            date_default_timezone_set('America/Bogota');
            $hoy = date("Y-m-d");
            $query = "INSERT INTO usuarios (correo,clave,fechacreacion,tipousuario) VALUES ('".$correo."','".$clave."','".$hoy."',0);";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }
        }
    }
```
    -Clase Avisos
```
class avisos_model{
        private $titulo;
        private $mensaje;
        private $imagen1;
        private $activo;
        public function __construct(){
            $activo = '0';
        }
        public function get_aviso(){
            $mysqli = new mysqli("localhost","root","","aqpetdb");
            $query = "SELECT * FROM avisos WHERE activo=1;";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }else{
                return $res;
            }
        }
        public function get_comentario($idaviso){
            $mysqli = new mysqli("localhost","root","","aqpetdb");
            $query = "SELECT * FROM comentariosaviso WHERE idavisoc=".$idaviso.";";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }else{
                return $res;
            }
        }
    }
```
3. The One: Las funciones de los modelos llamadas desde los controladores funcionan bajo este principio, esperando los controladores hasta que el modelo retorne la ejecución de la función
    -Realizando un login
```
include '../modelos/usuario.php';
    $correo = $_POST["usuario"];
    $password = $_POST["contrasenia"];
    $temp_user = new usuario($correo);
    $autorizacion = $temp_user->get_from_db($correo,$password);
```
## SOLID
1. Single Responsibility: Los modelos tienen cada uno la responsabilidad de manejar una tabla y sus tablas relacionadas de la base de datos, por ejemplo la clase usuario maneja el login y elregistro de estos:
```
class usuario {
        private $tipo_usuario;
        private $correo;
        public function __CONSTRUCT($correon){
            $correo = $correon;
            $tipo_usuario = '0';
        }
        public function get_from_db($correo,$clave){
            $mycon = new conectar();
            $mycon = $mycon->conexion();
            $query = "SELECT * FROM usuarios WHERE correo = '".$correo."' AND clave = '".$clave."';";
            $status = $mycon->query($query);
            return $status;
        }
        public function reg_verifi($correo){
            $mysqli = new conectar();
            $mysqli = $mysqli->conexion();
            $correo;
            $query = "SELECT * FROM usuarios  WHERE correo='".$correo." '";
            $res = $mysqli->query($query);
            if ($res->num_rows > 0){ 
                return 1; 
            }else {return 0;
                }
        }
        public function insert_db($correo,$clave){
            $mysqli = new conectar();
            $mysqli = $mysqli->conexion();
            date_default_timezone_set('America/Bogota');
            $hoy = date("Y-m-d");
            $query = "INSERT INTO usuarios (correo,clave,fecha_creacion,tipo_usuario) VALUES ('".$correo."','".$clave."','".$hoy."',0);";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }
        }
    }
```
2. Open-Closed : Nuestras clases pueden aceptar nuevas funcionalidades pero las ya existentes no se pueden modificar.

3. Interface Segregation : Nuestras clases contienen las funciones necesarias para cumplir plenamente sus roles para los que fueron diseñadas. 

## Domain-Driven Design
1. Lenguaje ubicuo: 

En la clase usuario tenemos:
- `get_from_db($correo,$clave)` nos devuelve los datos almacenados en la tabla usuarios.
- `reg_verifi($correo)` verifica si el dato enviado a la variable $correo existe en la base de datos.
- `insert_db($correo,$clave)` ingresa los datos ingresados en las variables a la base de datos.

En la clase avisos_model tenemos:
- `insert_aviso()` ingresamos los datos a la tabla avisos dentro de la base de datos.
- `insert_comentario()` ingresamos los datos a la tabla comentarios_aviso en la base de datos.
- `get_aviso()` nos devuelve los datos almacenados en la tabla avisos.
- `get_comentario($idaviso)` nos devuelve el comentario almacenado en la tabla comentarios_aviso, siempre que el dato enviado sea igual al id de la tabla avisos.

En la clase adopcion_model tenemos:
- `get_adopciones_activas()` no devuelve la informacion de las adopciones almacenada en la tabla en_adopcion que se encuentren activas.

2. Capas de la Arquitectura:

    -Interface de usuario: Son los archivos almacenados con la extencion .html, estas son todas las vistas de la pagina web.
    
    -Aplicación: Son los archivos con extencion .php almacenados en la carpeta controller.
    
    -Dominio: Son los archivos con extencion .php almacenados en la carpeta model, contienen las clases con sus respectivas funciones.
    
    -Infraestructura: Es la conexion de las vistas y controladores por medio de ajax.
    
3. Entidades : Los modelos creados están caracterizados por tener una caracteristica de inmutabilidad dado que una vez instanciados no podrán sufrir alguna alteración duarante su uso debido a que solo esta especializado en brindar respuestas de la base de datos y no contienen alguna otra funcionalidad que altera su estructura original y es por esto que no son heredados de alguna clase padre o estas mismas generen alguna sub clase para una especialización necesaria durante el funcionamiento.
```
<?php
    include 'conec.php';
    class avisos_model{
        private $titulo;
        private $mensaje;
        private $imagen1;
        private $activo;
        public function __construct(){
            $activo = '0';
        }
        public function insert_aviso(){
            $mysqli = new conectar();
            $mysqli = $mysqli->conexion();
            date_default_timezone_set('America/Bogota');
            $hoy = date("Y-m-d");
            $query = "INSERT INTO avisos (titulo, mensaje, imagen1, activo, fecha_creacion)
            VALUES ('".$titulo."','".$mensaje."','".$imagen1."', 0, '".$hoy."');";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }
        }
        public function insert_comentario(){
            $mysqli = new conectar();
            $mysqli = $mysqli->conexion();
            date_default_timezone_set('America/Bogota');
            $hoy = date("Y-m-d");
            $query = "INSERT INTO comentarios_aviso (comentario, ts_fecha_creacion)
            VALUES ('".$comentario."','".$hoy."');";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }
        }
        public function get_aviso(){
            $mysqli = new conectar();
            $mysqli = $mysqli->conexion();
            $query = "SELECT * FROM avisos WHERE activo=1;";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }else{
                return $res;
            }
        }
        public function get_comentario($idaviso){
            $mysqli = new mysqli("localhost","root","","aqpetdb");
            $query = "SELECT * FROM comentarios_aviso WHERE id_avisoc=".$idaviso.";";
            $res = $mysqli->query($query);
            if($res === FALSE){
                echo "Error: ".$mysqli->error;
            }else{
                return $res;
            }
        }
    }
?>
```
4. Servicios : Los controladores son independientes cada uno del resto y brindan distintas respuestas en tiempos diferidos de consultas específicas , dadas estás condiciones son fácilmente intercambiables entre unos para brindar diferentes respuestas a las consultas realizadas por los modelos que lo soliciten.
Estos son llamados por medio de AJAX desde el cliente como podemos ver:
```
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
```
