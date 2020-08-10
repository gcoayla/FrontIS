<?php 
	class conectar{
		private $servidor="localhost";
		private $usuario="root";
		private $bd="crudpoo";
		private $password="";

		public function conexion(){
			$mycon = new mysqli("localhost","root","","aqpetdb");
			return $mycon;
		}
	}	
 ?>