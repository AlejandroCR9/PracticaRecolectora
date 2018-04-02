package  {
	//Importación para el direccionamiento de los videos, utilización de funciones, Timer y el uso de Tween.
	import flash.display.Sprite;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.media.Video;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.NetStatusEvent;
	import flash.utils.Timer;
	import fl.transitions.easing.*; 
    import fl.transitions.TweenEvent;
     import fl.transitions.Tween;
	
	//Desarrollo de la clase donde se estaran declaran las variable para los videos.
	public class simpleFlv extends Sprite{
		private var _video:Video;
		public var _stream:NetStream;
		private var _playbackTime:TextField;
		private var _duration:uint;
		private var _timer:Timer;
		public var _sprite:Sprite;
		
		//Creacion del timer para dar el conteo de la reproducción.
		public function simpleFlv() {
			_duration = 0;
			_sprite=new Sprite();
			_playbackTime = new TextField();
			_playbackTime.autoSize = TextFieldAutoSize.LEFT;
			_playbackTime.y = -17;
			_playbackTime.x = 20;
			_playbackTime.text = "Buffering ...";
			
			_timer = new Timer(1000);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			_timer.start();
		}

		//Función pública para retomar el direccionamiento del video.
		public function playMyFlv(flvUrl){
			_video = new Video();
			
			var connection:NetConnection = new NetConnection();
			connection.connect(null);
			
			_stream = new NetStream(connection);
			_stream.play(flvUrl);
			
			var Client:Object = new Object();
			Client.onMetaData = onMetaData;
			_stream.client = Client;
			_video.attachNetStream(_stream);
			
			_stream.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			
			addChild(_video);
		}
		
		//Función para determinar la duracion.
		private function onMetaData(data:Object){
			_duration = data.duration;
		}
		
		//Función donde se le asignara el tamaño del video.		
		private function onNetStatus(e:NetStatusEvent){
			_video.width = 740;
			_video.height = 420;
			_video.x=100;
			_video.y=50;
		}
		
		//Función privada timer que nos realizara el conteo del video.
		private function onTimer(t:TimerEvent){
			if(_duration > 0 && _stream.time > 0){
				_playbackTime.text = Math.round(_stream.time) + " / " + Math.round(_duration);
			}
		}
		
	}
	
}
