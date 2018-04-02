package  {
	import flash.net.URLRequest;
	import flash.display.*;
	import flash.events.MouseEvent;


	public class Archivos extends MovieClip{
		var cargador:Loader;
		var url:URLRequest;
		var practica:String;
		public function Archivos(){
			// constructor code
			
		}

		public function obtenerCargar(p:String) {
			url = new URLRequest(p);
			cargador = new Loader()
			cargador.load(url);
			
		}
		
		public function regresarCarga():Loader{
			return cargador;
		
		}
		
		public function sig(evt:MouseEvent):int{
			var framemenu:int=0;
			
			//dependiendo del nombre de instancia indica al frame al cual ir
			if(evt.target.name == "btn_inicio"){
				framemenu=1;
			}
			if(evt.target.name == "btn_practicas"){
				framemenu=2;
				
			}	
			if(evt.target.name == "btn_juegos"){
				framemenu=3;
			}
			if(evt.target.name == "btn_multimedia"){
				framemenu=4;
			}
			if(evt.target.name == "btn_conclusiones"){
				framemenu=5;
			}
			
			return framemenu;
		}


	}
	
}