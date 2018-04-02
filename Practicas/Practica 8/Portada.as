package  {
	
	import flash.display.MovieClip;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	
	public class Portada extends MovieClip {
		
		public function Portada() {
			//instancias para llamar tween en la portada
			var poli_mcc:Tween = new Tween (poli_mc,"y",Bounce.easeOut,-100,25,4,true);
			var nombre_mcc:Tween = new Tween (nombre_mc,"x",None.easeOut,-300,60,2,true);
			var pra_mcc:Tween = new Tween (pra_mc,"x",None.easeOut,550,216,2,true);
			var hm_mcc:Tween = new Tween (hm_mc,"x",None.easeOut,-300,151,2,true);
			var siguiente_mcc:Tween = new Tween (continuar_btn,"y",Regular.easeInOut,410,213,2,true);
			var logo_mcc:Tween = new Tween (logo_mc,"y",Bounce.easeOut,500,262,3,true);
		}
	}
	
}
