package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
    import fl.transitions.easing.*; 
    import fl.transitions.TweenEvent;
    import fl.transitions.Tween;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	public class Movimientos extends MovieClip{
		private var timer:Timer;
		public function Movimientos() {
			// constructor code
			var t=new Tween(mc_logo,"y",None.easeOut,-200,mc_logo.y,3,true);
			var t1=new Tween(mc_bien,"y",None.easeOut,-200,mc_bien.y,3,true);
			var t2=new Tween(mc_poli,"y",None.easeOut,-200,mc_poli.y,3,true);
			var t3=new Tween(txt_pract,"y",None.easeOut,-200,txt_pract.y,3,true);
			var t4=new Tween(mc_nombre,"y",None.easeOut,-200,mc_nombre.y,3,true);
			var t5=new Tween(mc_hm,"y",None.easeOut,-200,mc_hm.y,3,true);
			var t6=new Tween(btn_inicio,"y",None.easeOut,-200,btn_inicio.y,3,true);
			var t7=new Tween(btn_juegos,"y",None.easeOut,-200,btn_juegos.y,3,true);
			var t8=new Tween(btn_practicas,"y",None.easeOut,-200,btn_practicas.y,3,true);
			var t9=new Tween(btn_conclusiones,"y",None.easeOut,-200,btn_conclusiones.y,3,true);
			var t10=new Tween(btn_multimedia,"y",None.easeOut,-200,btn_multimedia.y,3,true);
		}
		
		
	}
	
}
