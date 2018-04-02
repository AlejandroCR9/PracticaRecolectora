package  {
	//Se importan las siguientes librerias para el uso de formato de video, Tween y Funciones.
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
    import fl.transitions.easing.*; 
    import fl.transitions.TweenEvent;
    import fl.transitions.Tween;

	//Se inicia la clase principal de nuestra práctica.
	public class Main extends MovieClip{
		//Se declaran variable privadas para el formato de video.
		private var vid:String = "rata.flv";
		private var v:simpleFlv = new simpleFlv();
		private var pa:Boolean = false;
		
		//Función Main para declarar la variable Mov para los movimientos con Tween en cada uno
		//de los simbolos del fotograma 1, la portada.
		public function Main(){
			
			var Mov:Tween;
			Mov=new Tween(f1barra_mc,"y",Back.easeOut,-80,35,2,true);
			Mov=new Tween(practica_txt,"y",Regular.easeOut,-80,13,1,true);
			Mov=new Tween(int_txt,"x",Bounce.easeOut,500,73,3,true);
			Mov=new Tween(carrera_txt,"x",Regular.easeOut,400,73,2,true);
			Mov=new Tween(profesor_txt,"x",Regular.easeOut,400,73,2,true);
			Mov=new Tween(materia_txt,"x",Regular.easeOut,400,73,3,true);
			Mov=new Tween(grupo_txt,"x",Regular.easeOut,400,73,3,true);
			Mov=new Tween(logo_mc,"z",Regular.easeOut,-700,0,3,true);
			Mov=new Tween(btn_Siguiente,"y",Bounce.easeIn,600,430,3,true);
			Mov=new Tween(izq_mc,"y",Regular.easeOut,800,366.65,2,true);
			Mov=new Tween(der_mc,"y",Regular.easeOut,-500,366.65,2,true);
			
			//Se activa el botón para realizar la funcion irMenu.
			btn_Siguiente.addEventListener(MouseEvent.CLICK, irMenu);
		}
		//Funcion publica donde se activaran los botones del fotograma 2, que son los que nos dirigira
		//hacia los videos.
		public function irMenu(event:MouseEvent){
			//Cambiando al fotograma 2.
			gotoAndStop(2);
			btn_vid1.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid2.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid3.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid4.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid5.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid6.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid7.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid8.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid9.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid10.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		//Función para iniciar con la reproducción del video de acuerdo al botón presionado.
		//Mostrando mediante un texto dinamico cada uno de los titulos.
		//Activando los botones para pausar y regresar.
		public function onClick(evt:MouseEvent){
			if(evt.target.name == "btn_vid1"){
				vid = "Videos Sonic/Diseño.mp4";
				gotoAndStop(3);
				Reproducir();
				mostrar_vid.text = "Introducción sobre la interfaz";
				btn_Menu.addEventListener(MouseEvent.CLICK, vMenu);
				btn_pause.addEventListener(MouseEvent.CLICK, Pause);
			}	
			if(evt.target.name == "btn_vid2"){
				vid = "Videos Sonic/Fotograma1y2.mp4";
				gotoAndStop(3);
				Reproducir();
				mostrar_vid.text = "Desarrollo lógico de la portada e instrucciones";
				btn_Menu.addEventListener(MouseEvent.CLICK, vMenu);
				btn_pause.addEventListener(MouseEvent.CLICK, Pause);
			}
			if(evt.target.name == "btn_vid3"){
				vid = "Videos Sonic/Registros.mp4";
				gotoAndStop(3);
				Reproducir();
				mostrar_vid.text = "Videos Sonic/Area de registro de los jugadores";
				btn_Menu.addEventListener(MouseEvent.CLICK, vMenu);
				btn_pause.addEventListener(MouseEvent.CLICK, Pause);
			}
			if(evt.target.name == "btn_vid4"){
				vid = "Videos Sonic/Timers.mp4";
				gotoAndStop(3);
				Reproducir();
				mostrar_vid.text = "Explicación de los timers en el juego";
				btn_Menu.addEventListener(MouseEvent.CLICK, vMenu);
				btn_pause.addEventListener(MouseEvent.CLICK, Pause);
			}
			if(evt.target.name == "btn_vid5"){
				vid = "Videos Sonic/GenerarPlataformas.mp4";
				gotoAndStop(3);
				Reproducir();
				mostrar_vid.text = "Desarrollo de plataformas aleatorias";
				btn_Menu.addEventListener(MouseEvent.CLICK, vMenu);
				btn_pause.addEventListener(MouseEvent.CLICK, Pause);
			}
			if(evt.target.name == "btn_vid6"){
				vid = "Videos Sonic/Saltar.mp4";
				gotoAndStop(3);
				Reproducir();
				mostrar_vid.text = "Metodo para el salto del jugador";
				btn_Menu.addEventListener(MouseEvent.CLICK, vMenu);
				btn_pause.addEventListener(MouseEvent.CLICK, Pause);
			}
			if(evt.target.name == "btn_vid7"){
				vid = "Videos Sonic/Caida.mp4";
				gotoAndStop(3);
				Reproducir();
				mostrar_vid.text = "El desarrollo de la caida";
				btn_Menu.addEventListener(MouseEvent.CLICK, vMenu);
				btn_pause.addEventListener(MouseEvent.CLICK, Pause);
			}
			if(evt.target.name == "btn_vid8"){
				vid = "Videos Sonic/Fondo.mp4";
				gotoAndStop(3);
				Reproducir();
				mostrar_vid.text = "Movimiento del fondo";
				btn_Menu.addEventListener(MouseEvent.CLICK, vMenu);
				btn_pause.addEventListener(MouseEvent.CLICK, Pause);
			}
			if(evt.target.name == "btn_vid9"){
				vid = "Videos Sonic/Jefe.mp4";
				gotoAndStop(3);
				Reproducir();
				mostrar_vid.text = "Desarrollo del Jefe EggMan";
				btn_Menu.addEventListener(MouseEvent.CLICK, vMenu);
				btn_pause.addEventListener(MouseEvent.CLICK, Pause);
			}
			if(evt.target.name == "btn_vid10"){
				vid = "Videos Sonic/Resultados.mp4";
				gotoAndStop(3);
				Reproducir();
				mostrar_vid.text = "Desarrollo de los resultados del juego";
				btn_Menu.addEventListener(MouseEvent.CLICK, vMenu);
				btn_pause.addEventListener(MouseEvent.CLICK, Pause);
			}
		}
		
		//Función para desarrollar la acción del botón Pausar/Retormar.
		public function Pause(ev:MouseEvent){
			if(pa == false){
				v._stream.pause();
				pa = true;
			}else{
				v._stream.resume();
				pa = false;
			}
		}
		
		//Funcion para ir al fotograma 2 y remover el video reproducido.
		//Se volveran a activar los botones del fotograma 2.
		public function vMenu(event:MouseEvent){
			v._stream.pause();
			removeChild(v);
			gotoAndStop(2);
			v = new simpleFlv();
			btn_vid1.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid2.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid3.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid4.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid5.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid6.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid7.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid8.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid9.addEventListener(MouseEvent.CLICK, onClick);
			btn_vid10.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		//Función para iniciar con la reproducción del video y mandarlo a una posicion del escenario.
		public function Reproducir(){
			v.playMyFlv(vid);
			v.y = 77;
			v.x = 60;
			addChild(v);
		}
	}
	
}
