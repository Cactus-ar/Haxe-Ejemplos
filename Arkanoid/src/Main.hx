package;

import openfl.display.Sprite;
import openfl.events.Event;
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
	
	
		public function new() 
	{
		super();
		
		//Dibujo de La Interfaz y Mensajes
		Marco1.graphics.lineStyle (2, 0xff0000);
		Marco1.graphics.drawRect (0, 40, 490, 520);
		Marco1.x = 5;
		Marco1.y = 5;
		this.addChild(Marco1);
		
		//----------------------------------
		
		
		// Dibujo de la Plataforma
		Plataforma1 = new Plataforma();
		Plataforma1.x = Marco1.stage.height / 2 - 42;
		Plataforma1.y = 540;
		this.addChild(Plataforma1);
		//-------------------------
		
		
		// Dibujo de la Bola
		Bola1 = new Bola();
		Bola1.x = Marco1.stage.height / 2;
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
		
		
		this.addEventListener(Event.ENTER_FRAME, Mover_Bola);
		this.addEventListener(Event.ENTER_FRAME, Mover_Plataforma);
		this.addEventListener(Event.ENTER_FRAME, Golpear_Plataforma);
		this.addEventListener(Event.ENTER_FRAME, Golpear_Pared);
		
	}
	
	function Mover_Bola(e:Event) : Void {
	
		Bola1.x += Velocidad_Bola_x;
		Bola1.y += Velocidad_Bola_y;
		
		if (Bola1.x + (Bola1.width / 2) >= Marco1.width)
		{
			Bola1.x = Marco1.width - (Bola1.width / 2);
			Velocidad_Bola_x *= -1;
		}
		
		if (Bola1.x -(Bola1.width / 2) <= 5)
		{
			Bola1.x = 5 + (Bola1.width / 2);
			Velocidad_Bola_x *= -1;
		}
		
		if (Bola1.y -(Bola1.height / 2) <= 40)
		{
			Bola1.y = 40 + (Bola1.height / 2);
			Velocidad_Bola_y *= -1;
		}
		
	}
	
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
		if (Bola1.hitTestObject(Plataforma1))
		{
			Bola1.y  = (Plataforma1.y - (Plataforma1.height / 2)) - (Bola1.height / 2);
			Velocidad_Bola_y *= -1;
			
			if (Bola1.x < Plataforma1.x + (Plataforma1.width / 2))
			{
				trace("Izquierda"); //Izquierda
				Bola1.x = Bola1.x -5;
				return;
				
			}else 
			{
				trace ("Derecha"); //Derecha
				Bola1.x = Bola1.x +5;
				return;
			}
		}
	}
	
	function Golpear_Pared(e:Event):Void
	{
		
		for (i in 0...Pared.length)
		{
			if (Bola1.hitTestObject(Pared[i]))
			{
				
				if (Bola1.x < Pared[i].x - (Pared[i].width / 2))
				{
					Velocidad_Bola_x *= -1;
				}
				if (Bola1.x > Pared[i].x + (Pared[i].width / 2))
				{
					Velocidad_Bola_x *= -1;
				}else
				{
					Velocidad_Bola_y *= -1;
				}
				
				
				removeChild(Pared[i]);
				Pared.splice(i, 1);
				return;
				
			}
		
		}
		
	}
}
	
	
