package;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.KeyboardEvent;
import openfl.events.Event;


/**
 * ...
 * @author Gabriel
 */

class Main extends Sprite 
{
	private var Nave1:Nave;
	private var Alien1:Npc_alien;
	private var Misil1:Misil;
	private var Permite_disparo:Bool;
	private var Tecla_usada:Array<Bool>;
	private var velocidad:Int;
	private var Disparo:Bool;
	private var Invasion = new Array<Npc_alien>();
	
	public function new() 
	{
		super();
		
		Permite_disparo = true;
		Disparo = false;
		
		
		
		Nave1 = new Nave();
		Nave1.x = 200;
		Nave1.y = 450;
		velocidad = 3;
		this.addChild(Nave1);
		
		//-----------

		var Coordy = 60;
		while (Coordy < 250)
		{
			var Coordx = 15;
			while (Coordx < 370)
			{
				Alien1 = new Npc_alien();
				Alien1.x = Coordx;
				Alien1.y = Coordy;
				Invasion.push(Alien1);
				this.addChild(Alien1);
				Coordx += 36;
			}		
			Coordy += 40;
		}
			
		
		
		
		Misil1 = new Misil();
		this.addChild(Misil1);
		
		
		//Teclado
		Tecla_usada = new Array<Bool>();
		stage.addEventListener(KeyboardEvent.KEY_DOWN, Tecla_Presionada);
		stage.addEventListener(KeyboardEvent.KEY_UP, Tecla_Soltada);
		
		
		// Loop
		this.addEventListener(Event.ENTER_FRAME, En_CadaCuadro);
		
		
		
	}
	
	private function En_CadaCuadro(evento:Event):Void {
		
		if (Disparo == true) 
		{
			Misil1.y = Misil1.y -6;
			Permite_disparo = false;
			Misil1.alpha = 1;
			Impacto();
			
			if (Misil1.y <= 1)
			{
				Misil1.alpha = 0;
				Permite_disparo = true;
				Disparo = false;
			}
			
		}
		
		if (Tecla_usada[37]) {	//Movimiento hacia la Izquierda
			
			Nave1.x -= velocidad;
			if (Nave1.x <= 0) {
			Nave1.x = 0;	
			}
		}
		if (Tecla_usada[39]) {	//Movimiento hacia la Derecha
			
			if ((Nave1.x + Nave1.width) >= 380) {
			Nave1.x = 380 -Nave1.width;	
			}
			
			Nave1.x += velocidad;
		}
		if (Tecla_usada[32]) {	//Disparo (espacio)
			
			if (Permite_disparo == true)
			{
				
				Misil1.x = Nave1.x + 28;
				Misil1.y = 460;
				Disparo = true;
			}
		}
	
			
	}
	
	private function Impacto()
	{
		
		for (i in 0...Invasion.length) //Recorremos el Array
		{
			if (Invasion[i] != null)
			{
				if (Misil1.hitTestObject(Invasion[i])) //Si existe colision con un marciano
				{
					removeChild(Invasion[i]); //Removemos el marciano impactado de la escena	
					Invasion.splice(i, 1); // y del Array
					Misil1.alpha = 0;
					Disparo = false;
					Permite_disparo = true;
				
				}
			}
		}
		
		
	}
	
	private function Tecla_Presionada(evento:KeyboardEvent):Void {
		Tecla_usada[evento.keyCode] = true;
	}
	
	private function Tecla_Soltada(evento:KeyboardEvent):Void {
		Tecla_usada[evento.keyCode] = false;
	}
}
