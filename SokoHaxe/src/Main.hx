package;


import openfl.Lib;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.utils.Object;



/**
 * ...
 * @author Gabriel
 */

class Main extends Sprite
{
	
	
	private var Inicio:Menu;
	private var Nivel_actual:Nivel;
	private var Tecla_usada:Array<Bool>;
	private var Movimiento_Anterior_x:Float;
	private var Movimiento_Anterior_y:Float;
	private var Movimiento_Direccion:String;
	private var Copia_Bloques: Array<Bloque>;
	private var Copia_Bloques_fini: Array<Bloque>;
	private	var previoX:Float;
	private var previoY:Float;
	private var Puntero:Int;
	
	private var Flagi:Int = 0;
	
	
	public function new() 
	{	
		super();
		
		
		
		//Inicio = new Menu();
		//addChild(Inicio);
	

	
		
		Tecla_usada = new Array<Bool>();
		Copia_Bloques = new Array<Bloque>();
		stage.addEventListener(KeyboardEvent.KEY_DOWN, Tecla_Presionada);
		stage.addEventListener(KeyboardEvent.KEY_UP, Tecla_Soltada);
		this.addEventListener(Event.ENTER_FRAME, En_CadaCuadro);
		Nuevo_Juego();
	}
	
	private function En_CadaCuadro(evento:Event):Void {
		
	}	
	
	public function Nuevo_Juego()
	{
//		Nivel_actual.removeChild(this);
		Nivel_actual = new Nivel();
		Nivel_actual.Dibujar(3); //pasamos el nivel
		addChild(Nivel_actual);		
	}
	
	
	private function Tecla_Presionada(evento:KeyboardEvent):Void {
		Tecla_usada[evento.keyCode] = true;
		
		if (Tecla_usada[evento.keyCode])
		{
			
			Movimiento_Anterior_x = Nivel_actual.Personaje_Obj.x;
			Movimiento_Anterior_y = Nivel_actual.Personaje_Obj.y;
			
			if (Tecla_usada[37])
			{
			Nivel_actual.Personaje_Obj.x = Nivel_actual.Personaje_Obj.x -32;
			Movimiento_Direccion = "Izquierda";
			}
			if (Tecla_usada[39])
			{
			Nivel_actual.Personaje_Obj.x = Nivel_actual.Personaje_Obj.x +32;
			Movimiento_Direccion = "Derecha";
			}
			if (Tecla_usada[38])
			{
			Nivel_actual.Personaje_Obj.y = Nivel_actual.Personaje_Obj.y -32;
			Movimiento_Direccion = "Arriba";
			}
			if (Tecla_usada[40])
			{
			Nivel_actual.Personaje_Obj.y = Nivel_actual.Personaje_Obj.y +32;
			Movimiento_Direccion = "Abajo";
			}
			if (Tecla_usada[32]) //Menu
			{
				root.alpha = 1;
				//Inicio.visible = true;
			}
		Colisiones();
		Nivel_Completo();
		//guardar coordenadas para el undo
		}
	}
	
	private function Tecla_Soltada(evento:KeyboardEvent):Void {
		Tecla_usada[evento.keyCode] = false;
	}

	private function Colisiones():Void
	{
		for (i in 0...Nivel_actual.Nivel_Actual_Pared.length) //Personaje pega contra la pared
		{
			if (Nivel_actual.Personaje_Obj.hitTestObject(Nivel_actual.Nivel_Actual_Pared[i]))
			{
				Nivel_actual.Personaje_Obj.x = Movimiento_Anterior_x;
				Nivel_actual.Personaje_Obj.y = Movimiento_Anterior_y;
				
			}
		}
		
		for (i in 0...Nivel_actual.Nivel_Actual_Bloques.length) //Personaje pega contra las cajas
		{
						
			if (Nivel_actual.Personaje_Obj.hitTestObject(Nivel_actual.Nivel_Actual_Bloques[i]))
			{
				previoX = Nivel_actual.Nivel_Actual_Bloques[i].x;
				previoY = Nivel_actual.Nivel_Actual_Bloques[i].y;
				Copia_Bloques = Nivel_actual.Nivel_Actual_Bloques.slice(0, Nivel_actual.Nivel_Actual_Bloques.length);
				Copia_Bloques.remove(Nivel_actual.Nivel_Actual_Bloques[i]);
				Puntero = i;

				switch (Movimiento_Direccion) 
				{	
					case "Izquierda":
						Nivel_actual.Nivel_Actual_Bloques[i].x = Nivel_actual.Nivel_Actual_Bloques[i].x -32;
						
					case "Derecha":
						Nivel_actual.Nivel_Actual_Bloques[i].x = Nivel_actual.Nivel_Actual_Bloques[i].x +32;
						
					case "Arriba":
						Nivel_actual.Nivel_Actual_Bloques[i].y = Nivel_actual.Nivel_Actual_Bloques[i].y -32;
						
					case "Abajo":
						Nivel_actual.Nivel_Actual_Bloques[i].y = Nivel_actual.Nivel_Actual_Bloques[i].y +32;
						
				}
				
				Colision_2(Puntero);
			}
			
		}
		
	}
	private function Colision_2(Puntero:Int):Void
	{
		for (j in 0...Nivel_actual.Nivel_Actual_Pared.length) //Cajas contra Pered
		{
			if (Nivel_actual.Nivel_Actual_Bloques[Puntero].hitTestObject(Nivel_actual.Nivel_Actual_Pared[j]))
			{
				Nivel_actual.Nivel_Actual_Bloques[Puntero].x = previoX;
				Nivel_actual.Nivel_Actual_Bloques[Puntero].y = previoY;
				Nivel_actual.Personaje_Obj.x = Movimiento_Anterior_x;
				Nivel_actual.Personaje_Obj.y = Movimiento_Anterior_y;
				return;
			}
		}
		for (k in 0...Copia_Bloques.length) //Bloque contra Bloque
		{
			if (Nivel_actual.Nivel_Actual_Bloques[Puntero].hitTestObject(Copia_Bloques[k]))
			{
			Nivel_actual.Nivel_Actual_Bloques[Puntero].x = previoX;
			Nivel_actual.Nivel_Actual_Bloques[Puntero].y = previoY;
			Nivel_actual.Personaje_Obj.x = Movimiento_Anterior_x;
			Nivel_actual.Personaje_Obj.y = Movimiento_Anterior_y;
			}
		}
		Copia_Bloques.splice(0, Copia_Bloques.length); //Borramos la copia del Array
		
		
	}
	
	private function Nivel_Completo():Void
	{
		Copia_Bloques_fini = Nivel_actual.Nivel_Actual_Bloques.slice(0, Nivel_actual.Nivel_Actual_Bloques.length);
		
		
		for (k in 0...Nivel_actual.Nivel_Actual_Objetivos.length)
		{
			for (l in 0...Nivel_actual.Nivel_Actual_Bloques.length)
			{
				if (Nivel_actual.Nivel_Actual_Bloques[l].hitTestObject(Nivel_actual.Nivel_Actual_Objetivos[k]))
				{
					Copia_Bloques_fini.remove(Nivel_actual.Nivel_Actual_Bloques[l]);
					trace (Copia_Bloques_fini.length);
					if (Copia_Bloques_fini.length == 0)
					{
						trace("FIN");
					}
					
				}
				
			}
			
		}	
		Copia_Bloques_fini.splice(0, Copia_Bloques.length); //Borramos la copia del Array
	}
}
