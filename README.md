# AQPet
AQPet es una plataforma web que facilita el proceso de adopción de mascotas de un refugio,
además de tener un sistema de interacción de usuarios
donde se puede realizar la publicación de mascotas perdidas
## Integrantes
- Aquise Santos, Angela
- Chayña Batallanes , Josnick
- Coayla Zuñiga, Gonzalo Eduardo
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

