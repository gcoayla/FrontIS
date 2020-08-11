<?php 
	class conectar{
		private $servidor="localhost";
		private $usuario="root";
		private $bd="aqpetdb";
		private $password="";

		public function conexion(){
			$mycon = new mysqli($this->servidor,$this->usuario,$this->password,$this->bd);
			return $mycon;
		}
	}	
 ?>