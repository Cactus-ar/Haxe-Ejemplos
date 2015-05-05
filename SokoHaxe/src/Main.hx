package;


import openfl.Lib;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.Event;



/**
 * ...
 * @author Gabriel
 */

class Main extends Sprite
{
	
	
	private var Inicio:Menu;
	private var Nivel_actual:Nivel;
	private var Tecla_usada:Array<Bool>;
	
	public function new() 
	{	
		super();
		Inicio = new Menu();
		addChild(Inicio);
		
		Nivel_actual = new Nivel();
		Nivel_actual.Dibujar();
		addChild(Nivel_actual);
	
		Tecla_usada = new Array<Bool>();
		stage.addEventListener(KeyboardEvent.KEY_DOWN, Tecla_Presionada);
		stage.addEventListener(KeyboardEvent.KEY_UP, Tecla_Soltada);
		this.addEventListener(Event.ENTER_FRAME, En_CadaCuadro);
		
	}
	
	private function En_CadaCuadro(evento:Event):Void {
		
	}	
	
	
	private function Tecla_Presionada(evento:KeyboardEvent):Void {
		Tecla_usada[evento.keyCode] = true;
		
		if (Tecla_usada[evento.keyCode])
		{
			
			if (Tecla_usada[37])
			{
			Nivel_actual.Personaje_Obj.x = Nivel_actual.Personaje_Obj.x -32;
			
			}
			if (Tecla_usada[39])
			{
			Nivel_actual.Personaje_Obj.x = Nivel_actual.Personaje_Obj.x +32;		
			}
			if (Tecla_usada[38])
			{
			Nivel_actual.Personaje_Obj.y = Nivel_actual.Personaje_Obj.y -32;		
			}
			if (Tecla_usada[40])
			{
			Nivel_actual.Personaje_Obj.y = Nivel_actual.Personaje_Obj.y +32;		
			}
			if (Tecla_usada[32]) 
			{
				Inicio.
			}
		}
	}
	
	private function Tecla_Soltada(evento:KeyboardEvent):Void {
		Tecla_usada[evento.keyCode] = false;
	}

}
