package  {
	//Librerias
	import flash.display.MovieClip;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import flash.events.MouseEvent;
	
	public class Nomina extends MovieClip{
		
		/*===================VARIABLES===============*/
		//Arrays donde se alamcenan los datos
		private var arrayNombre:Array = new Array();
		private var arrayEdad:Array = new Array();
		private var arraySexo:Array = new Array();
		private var arraySueldo:Array = new Array();
		private var arrayNum:Array = new Array();
		//resultados array
		private var arrayM18:Array = new Array();	//mujeres entre 18 y 20
		private var arrayH30:Array = new Array();	//hombres entre 30 y 35
		private var arrayTercera:Array = new Array();//tercera edad
		//variables para validacion
		private var n:String = "";		//validacion nombre
		private var e:int = 0;			//validacion edad
		private var su:Number = 0;		//validacion sueldo
		//otras variables
		private var aux:String="";		//guarda el valor del sexo que se haya pulsado	
		private var cont:int = 0;		//numero de empleados
		private var nom:Number = 0;	
		//contadores
		private var terceraM:int=0;
		private var terceraH:int=0;
		private var m18:int=0;
		private var h30:int=0;
		private var subM:int=0;
		private var subH:int=0;
		private var cantM:int=0;
		private var cantH:int=0;
		private var otrosM:int=0;
		private var otrosH:int=0;
		
		/*==============CONSTRUCTOR DE LA CLASE NOMINA===========*/
		public  function Nomina() {
			tweens();
			
		}
		
		//accede al formulario 
		public function tweens():void{
			// Animacion Logo
			var tweenLogo:Tween = new Tween(logo_mc,"x", Elastic.easeInOut,-150,379.40,2,true);
			//Animacion Materia
			var tweenM:Tween = new Tween(mat_txt,"x", Elastic.easeInOut,600,69,2,true);
			// Animacion Nombre
			var tweenN:Tween = new Tween(nom_txt,"y", Elastic.easeOut,-150,175.35,2,true);
			// Animacion Porfesor
			var tweenP:Tween = new Tween(prof_txt,"y", Elastic.easeInOut,550,199.45,2,true);
			btn_entrar.addEventListener(MouseEvent.CLICK,irFormulario);
		}
		
		public function irFormulario(event:MouseEvent):void{
			gotoAndStop(2);
			txt_edad.restrict="0-9";	//solo numeros en edad
			txt_ne.text = "No. emlpeado: "+(cont+1); //empelado actual
			btn_limpiar.addEventListener(MouseEvent.CLICK,limpiar);
			btn_reset.addEventListener(MouseEvent.CLICK,btnReset);
			btn_portada.addEventListener(MouseEvent.CLICK,irPortada);
			btn_nomina.addEventListener(MouseEvent.CLICK,irNomina);
			//validacion  solo un valor seleccionado en el checkbox 
			ch_mujer.addEventListener(MouseEvent.CLICK,clickHombre);
			ch_hombre.addEventListener(MouseEvent.CLICK,clickMujer);
			btn_sig.addEventListener(MouseEvent.CLICK,irDatos);
			
		}
		
		/*solicita los valores de los campos, asi mismo valida que sean valores validos
		personas mayores de 18 y menores de 99 , no numeros en el nombre, no letras en el sueldo
		que almenos una casilla del sexo este pulsada*/
		function irDatos(event:MouseEvent):void {
			//comprueba el numero de empleados si llega a 10 se oculta el boton.
			if(cont==10){
				//solo diez registros
				txt_ne.text="Limite alcanzado."; //coloca aviso 
				btn_sig.visible=false;		//oculta el boton sigiente
			}
			if(cont<10){		//comprueba la cantidad de empleados
				//captura datos de las cajas de texto
				n = txt_nombre.text
				su = Number(txt_sueldo.text);
				e = int(txt_edad.text);
				//validaciones
				if(n == "" || int(n)!= 0)
					//esta vacio o son solo numeros
					txt_valido.text = "Error Nombre";
				else {
					txt_valido.text = "";		//limpia el mensaje de error pues ya es un valor valido
					if(isNaN(e) || e<18 || e>99)
						//son letras o es menor a 18 años o mayor a 99
						txt_valido2.text = "Error Edad";
					else {
						txt_valido2.text = "";		//ya es un valor valido
						if(isNaN(su) || su == 0)
							//hay letras en el sueldo o esta vacio
							txt_valido3.text = "Error Sueldo";
						else {
							if(ch_mujer.selected == true || ch_hombre.selected == true){
								//a seleccionado algun sexo
								txt_valido4.text="";	//limpia mensaje de error pues ya hay un valor valido
								txt_valido3.text = "";	//limpa mensaje de error pues ya hay un valor valido
								//alamcena valores en los arrays
								arrayNombre.push(n);
								arrayEdad.push(e);
								arraySexo.push(aux);
								arraySueldo.push(su);
								arrayNum.push(cont+1);
								cont++;		//suma un empleado
								nom+=su;	//se agrega a la nomina
								if(cont<10)
									txt_ne.text = "No. emlpeado: "+(arrayNum[cont]+1); //empelado actual
								
								gotoAndStop(3);
								mostrar();
								btn_registro.addEventListener(MouseEvent.CLICK,irRegistro);
							} else
								//no a seleccionado ninguno de los sexos
								txt_valido4.text = "Error sexo";
								
						}//tercer ifelse
					}//segundo ifelse
				}//fin primer ifelse
			} else{
				btn_sig.visible=false;
				
				}
				
			
		}
		//regresa al registro
		function irRegistro(event:MouseEvent):void{
			gotoAndStop(2);
			txt_edad.restrict="0-9";	//solo numeros en edad
			txt_ne.text = "No. emlpeado: "+(cont+1); //empelado actual
			btn_limpiar.addEventListener(MouseEvent.CLICK,limpiar);
			btn_reset.addEventListener(MouseEvent.CLICK,btnReset);
			btn_portada.addEventListener(MouseEvent.CLICK,irPortada);
			btn_nomina.addEventListener(MouseEvent.CLICK,irNomina);
			//validacion  solo un valor seleccionado en el checkbox 
			ch_mujer.addEventListener(MouseEvent.CLICK,clickHombre);
			ch_hombre.addEventListener(MouseEvent.CLICK,clickMujer);
			btn_sig.addEventListener(MouseEvent.CLICK,irDatos);
		}
		
		public function mostrarFinal():void{
			//valores obtenidos de hombres
			txt_oh.text =otrosH.toString();
			txt_3.text = h30.toString()
			txt_th.text = terceraH.toString()
			txt_nh.text = cantH.toString()
			txt_subh.text =subH.toString()
			//valores obtenidos de mujeres
			txt_om.text =otrosM.toString();
			txt_1.text = m18.toString()
			txt_tm.text = terceraM.toString()
			txt_nm.text = cantM.toString()
			txt_subm.text =subM.toString()

			//valor total de nomina y cantidad total de empleados
			txt_nominafinal.text=String(nom);
			txt_numfinal.text=String(cont);

			//funcion en el frqme 3

		}
		public function mostrar():void{
			var auxd:Number=0;	//auxiliar para calular el desucento
			//imprime los valores recien capturados
			txt_rnombre.text =arrayNombre[cont-1];
			txt_redad.text =arrayEdad[cont-1];
			txt_rsexo.text =arraySexo[cont-1];
			txt_rsueldo.text =arraySueldo[cont-1];
			txt_rnum.text = arrayNum[cont-1];
			
			/*Condicion si se escogio mujer y cabe en el ranfo de 18 y 25 años */
			if(arraySexo[cont-1] == "Mujer" && arrayEdad[cont-1]>=18 && arrayEdad[cont-1]<=25){
				auxd=arraySueldo[cont-1]*1.15; 		//aplico el aumento del 15%
				//imprim o y redonde los valores
				txt_aumento.text="Aumento de: "+String(((arraySueldo[cont-1]*.15)*100)/100); 
				arrayM18[cont-1]=((auxd)*100)/100; //guardo el valor redondeado
				txt_total.text = String(arrayM18[cont-1]);	//mprimo el total junto con el amuento
				m18+=1;	//suma 1 pues es una mujer en ese rango de edad
				
			} else if(arraySexo[cont-1] == "Hombre" && arrayEdad[cont-1]>=30 && arrayEdad[cont-1]<=35){
				//verdadero: es hombre y tiene entee 30 y 35 años de edad
				auxd=arraySueldo[cont-1]*1.05; //aplico el aumento del .5%
				//imprimo y redondeo el aumento
				txt_aumento.text="Aumento de: "+String(((arraySueldo[cont-1]*.05)*100)/100);
				arrayH30[cont-1]=((auxd)*100)/100; //almaceno el valor enel array
				txt_total.text = String(arrayH30[cont-1]); //imprimo el sueldo con aumento 
				h30+=1; //cuento uno por que es hombre y esta en el rango de edad
			} else if(arrayEdad[cont-1]>=60){ //personas de la tercera edad
				auxd=arraySueldo[cont-1]*1.20;	//aplico aumento
				//imprimo aumento redondeado
				txt_aumento.text="Aumento de: "+String(((arraySueldo[cont-1]*.20)*100)/100);
				arrayTercera[cont-1]=((auxd)*100)/100; ///almaceno en el array
				txt_total.text = String(arrayTercera[cont-1]); //imprmo el total con aumento
				//sigiente condicion
				if(aux=="Hombre")
					//es un hombre de la tercera edad lo cuenta
					terceraH+=1;
				else if(aux=="Mujer")
					//mujer de la tercera edad la cuenta
					terceraM+=1;
			} else
				//en caso de no haber entrado en los rangos se imprime solo el sueldo sin ningun aumento
				txt_total.text = String(arraySueldo[cont-1]);

			//sigiente conducion
			if (aux=="Hombre"){ //para todos lo hombres
				subH+=su; //suma su sueldo a un total de puros hombres
				cantH+=1;// cuenta la cantidad de hombres
				if((arrayEdad[cont-1]>=18 && arrayEdad[cont-1]<30) || ((arrayEdad[cont-1]>35 && arrayEdad[cont-1]<60)) )
					//los otros hombres que no caben en el rango de edad
					otrosH+=1;
			} else { //si no es hombre tiene que ser mujer
				cantM+=1;	//cuenta la cantidad de mujeres
				subM+=su;	//un sbtotal de la nomina, solo mujers
				if(arrayEdad[cont-1]>25 && arrayEdad[cont-1]<60)
					//la cuanta si no esta en el rango de 18 a 25 años
					otrosM+=1;
			}

			
		}
	
		//funcion regresar portada
		function irPortada(event:MouseEvent):void{
			gotoAndStop(1);
		}
		
		//funcion ir a la nomina total
		function irNomina(event:MouseEvent):void{
			gotoAndStop(4);
			mostrarFinal();
			btn_registro2.addEventListener(MouseEvent.CLICK,irRegistro);
		}
	   
		//para el hombre
		function clickMujer(event:MouseEvent):void { 
			//si se clickeo la casilla de hombre la de mujer no debe estar seleccionada
			ch_mujer.selected = false;    
			aux = "Hombre"; 	//se pulso, asigna hombre
		}
		// para mujer
		function clickHombre(event:MouseEvent):void {
			//si se clickeo la casilla de mujer la de hombre no debe estar seleccionada
			ch_hombre.selected = false; 
			aux = "Mujer";		//se pulso, se asigna mujer
		}
		
		/*=======================LIMPIAR=========================*/
		//devuelve todo a su valor original
		public function limpiar(event:MouseEvent):void{
			ch_mujer.selected = false;
			ch_hombre.selected = false;
			txt_nombre.text="";
			txt_edad.text="";
			txt_sueldo.text="";
		}
		
		/*reset inicializa todos los valores,arreglos, 
		contadores, acumuladores a su estado original*/
		function btnReset(event:MouseEvent):void{
			txt_ne.text = "No. emlpeado: "+ 1; //INCIA CON EMPLEADO 1 OTRA VEZ	
			
			/*====================INCIALIZA VARIABLES NUEVAMENTE=======================*/
			//Arrays donde se alamcenan los datos
			arrayNombre = new Array();
			arrayEdad = new Array();
			arraySexo = new Array();
			arraySueldo = new Array();
			arrayNum = new Array();
			//resultados array
			arrayM18 = new Array();	//mujeres entre 18 y 20
			arrayH30 = new Array();	//hombres entre 30 y 35
			arrayTercera = new Array();//tercera edad
			//variables para validacion
			n = "";		//validacion nombre
			e = 0;			//validacion edad
			su = 0;		//validacion sueldo
			//otras variables
			aux="";		//guarda el valor del sexo que se haya pulsado	
			cont = 0;		//numero de empleados
			nom = 0;	//nomina la almacena
			//contadores
			terceraM=0;
			terceraH=0;
			m18=0;
			h30=0;
			subM=0;
			subH=0;
			cantM=0;
			cantH=0;
			otrosM=0;
			otrosH=0;
		}
		

	}
	
}
