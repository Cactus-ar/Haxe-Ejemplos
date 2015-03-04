package;


import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.events.MouseEvent.CLICK;
import openfl.media.Sound;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

import openfl.Assets;
import openfl.Lib;




/**
 * ...
 * @author gabriel
 */

 

class Main extends Sprite 
{

	private var Plataforma1:Plataforma;
	private var Bola1:Bola;
	private var Ladrillos:Ladrillo;
	private var Marco1 = new Sprite();
	private var Velocidad_Bola_x: Int;
	private var Velocidad_Bola_y: Int;
	private var Pared = new Array<Ladrillo>();
	private var Pausa:Bool;
	
	private var Puntaje:TextField;
	private var MensajeInicial:TextField;
	private var Cantidad_Vidas: TextField;
	private var Mensaje_Final:TextField;
	
	private var Puntos:Int;
	private var Vidas:Int;
	private var velprex:Int;
	private var velprey:Int;
	

	private var Audio_Bola:Sound = new Sound();
	private var Audio_impacto: Sound = new Sound();
	
	
	
		public function new() 
	{
		super();
		
		Puntos = 0;
		Vidas = 3;
		
		Audio_Bola = Assets.getSound("audio/impacto.mp3");
		Audio_impacto = Assets.getSound("audio/rebote.mp3");
		
		//Dibujo de La Interfaz y Mensajes
		
		//Marco delimitador de zona de juego
		Marco1.graphics.lineStyle (2, 0xff0000);
		Marco1.graphics.drawRect (0, 40, 490, 520);
		Marco1.x = 5;
		Marco1.y = 5;
		this.addChild(Marco1);
		
		//Texto inicial
		var Formato1:TextFormat = new TextFormat("Verdana", 18, 0x169ffa, true);
		Formato1.align = TextFormatAlign.CENTER;
		MensajeInicial = new TextField();
		addChild(MensajeInicial);
		MensajeInicial.width = 500;
		MensajeInicial.y = 450;
		MensajeInicial.defaultTextFormat = Formato1;
		MensajeInicial.selectable = false;
		MensajeInicial.text = "Pausa / Click para continuar";
		
		//Marcador
		Puntaje = new TextField();
		addChild(Puntaje);
		Puntaje.width = 200;
		Puntaje.x = 20;
		Puntaje.y = 20;
		Puntaje.defaultTextFormat = Formato1;
		Puntaje.selectable = false;
		Puntaje.text = "Puntos: " + Std.string(Puntos);
		
		//Cantidad de Vidas
		Cantidad_Vidas = new TextField();
		addChild(Cantidad_Vidas);
		Cantidad_Vidas.width = 200;
		Cantidad_Vidas.x = 220;
		Cantidad_Vidas.y = 20;
		Cantidad_Vidas.defaultTextFormat = Formato1;
		Cantidad_Vidas.selectable = false;
		Cantidad_Vidas.text = "Vidas: " + Std.string(Vidas);
		//----------------------------------
		
		
		// Dibujo de la Plataforma
		Plataforma1 = new Plataforma();
		Plataforma1.x = Marco1.stage.height / 2 - 42; //Simplemente para Centrado
		Plataforma1.y = 540;
		this.addChild(Plataforma1);
		//-------------------------
		
		
		// Dibujo de la Bola
		Bola1 = new Bola();
		Bola1.x = Marco1.stage.height / 2;	//Centrado
		Bola1.y = 530;
		Velocidad_Bola_x = 5;
		Velocidad_Bola_y = -5;
		this.addChild(Bola1);
		//-----------------------
		
		//Dibujo de la Pared de Ladrillos
		
		var Coordy = 60;
		while (Coordy < 325)
		{
		var Coordx = 15;
		while (Coordx < 460)
		{
			Ladrillos = new Ladrillo();
			Ladrillos.x = Coordx;
			Ladrillos.y = Coordy;
			Pared.push(Ladrillos);
			this.addChild(Ladrillos);
			Coordx += 36;
		}
		Coordy += 16;
		}
		//-----------------------------
		Pausa = true;		//Juego pausado al comenzar
		Pausado(null);
		
		stage.addEventListener(MouseEvent.CLICK, Pausado);
		this.addEventListener(Event.ENTER_FRAME, Mover_Bola);
		this.addEventListener(Event.ENTER_FRAME, Mover_Plataforma);
		this.addEventListener(Event.ENTER_FRAME, Golpear_Plataforma);
		this.addEventListener(Event.ENTER_FRAME, Golpear_Pared);
		
		
	}
	
	
	function Pausado(e:MouseEvent): Void
	{
		if (Pausa == true) //Juego en Pausa
		{
				Pausa = false;
				MensajeInicial.alpha = 1;
				velprex = Velocidad_Bola_x;
				velprey = Velocidad_Bola_y;
				Velocidad_Bola_x = 0;
				Velocidad_Bola_y = 0;
				
				return;
		}
				Pausa = true;
				MensajeInicial.alpha = 0;
				Velocidad_Bola_x = velprex;
				Velocidad_Bola_y = velprey;
		
	}
	
	function Intentos():Void 
	{
		Cantidad_Vidas.text = "Vidas: " + Std.string(Vidas);
		Bola1 = new Bola();
		Bola1.x = Marco1.stage.height / 2;	//Centrado
		Bola1.y = 530;
		Velocidad_Bola_x = 5;
		Velocidad_Bola_y = -5;
		this.addChild(Bola1);
		Pausa = true;
		Pausado(null);
		
		if (Vidas == 0) //Si ha llegado a cero..termina el juego
		{
		var Formato1:TextFormat = new TextFormat("Verdana", 38, 0xfa1616, true);
		Formato1.align = TextFormatAlign.CENTER;
		Mensaje_Final = new TextField();
		addChild(Mensaje_Final);
		Mensaje_Final.width = 500;
		Mensaje_Final.y = 250;
		Mensaje_Final.defaultTextFormat = Formato1;
		Mensaje_Final.selectable = false;
		Mensaje_Final.text = "GAME OVER";
		this.removeChild(Bola1);
		this.removeChild(Plataforma1);
		}
	}
	
	function Mover_Bola(e:Event) : Void
	{
		Bola1.x += Velocidad_Bola_x;
		Bola1.y += Velocidad_Bola_y;
		
		if (Bola1.x + (Bola1.width / 2) >= Marco1.width) //Rudimentaria detección de Borde Derecho
		{
			Bola1.x = Marco1.width - (Bola1.width / 2);
			Velocidad_Bola_x *= -1;
		}
		
		if (Bola1.x -(Bola1.width / 2) <= 5) //Rudimentaria detección de Borde Izquierdo
		{
			Bola1.x = 5 + (Bola1.width / 2);
			Velocidad_Bola_x *= -1;
		}
		
		if (Bola1.y -(Bola1.height / 2) <= 40) //Rudimentaria detección de Borde Superior
		{
			Bola1.y = 40 + (Bola1.height / 2);
			Velocidad_Bola_y *= -1;
		}
		
		if (Bola1.y +(Bola1.height / 2) >= 550) //Si pasa este rango es que la bola cayó
		{
			Vidas --;
			this.removeChild(Bola1);
			Intentos();
		}
		
	}
	
	// El eje X del mouse hace todo el trabajo aquí. Simplemente delimitamos los bordes
	// izquierdo y derecho para que no se vaya de la plantalla.
	
	function Mover_Plataforma(e:Event): Void
	{

		Plataforma1.x = mouseX;
		if (Plataforma1.x <= 5)
		{
			Plataforma1.x = 7;
		}
		if (Plataforma1.x >= Marco1.width - Plataforma1.width)
		{
			Plataforma1.x = Marco1.width - Plataforma1.width;
		}
		
	}

	
	function Golpear_Plataforma(e:Event): Void
	{
		if (Bola1.hitTestObject(Plataforma1)) // Si la bolita pega contra la plataforma = true
		{
			Audio_Bola.play();
			Bola1.y  = (Plataforma1.y - (Plataforma1.height / 2)) - (Bola1.height / 2);
			Velocidad_Bola_y *= -1; // Cambia el sentido de orientación
			
			if (Bola1.x < Plataforma1.x + (Plataforma1.width / 2))
			{
				//Izquierda
				Bola1.x -= Velocidad_Bola_x -5;
				return;
				
			}else 
			{
				//Derecha
				Bola1.x += Velocidad_Bola_x +5;
				return;
			}
		}
	}
	
	function Golpear_Pared(e:Event):Void
	{
		
		for (i in 0...Pared.length) //Recorremos el Array
		{
			if (Bola1.hitTestObject(Pared[i])) //Si existe colision con la bolita
			{
				Audio_impacto.play();
				if (Bola1.x < Pared[i].x - (Pared[i].width / 2))
				{
					Velocidad_Bola_x *= -1; //Colisión desde la Izquierda
				}
				if (Bola1.x > Pared[i].x + (Pared[i].width / 2))
				{
					Velocidad_Bola_x *= -1; //Colisión desde la Derecha
				}else
				{
					Velocidad_Bola_y *= -1; //Colisión desde arriba o Abajo
				}
				
				
				removeChild(Pared[i]); //Removemos el ladrillo impactado de la escena
				Pared.splice(i, 1); // y del Array
				Puntos ++;
				Puntaje.text = "Puntos: " + Std.string(Puntos);
				return;
				
			}
		
		}
		
	}
}
	
	
