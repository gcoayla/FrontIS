<?php 
	class conectar{
		private $servidor="localhost";
		private $usuario="root";
		private $bd="aqpetdb";
		private $password="";

		public function conexion(){
			$mycon = new mysqli($servidor,$usuario,$password,$bd);
			return $mycon;
		}
	}	
 ?>