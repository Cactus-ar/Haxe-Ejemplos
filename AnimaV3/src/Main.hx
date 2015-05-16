package;

import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.display.StageDisplayState;
import openfl.Lib;
import openfl.events.TimerEvent;
import openfl.utils.Timer;
import openfl.events.MouseEvent;


/**
 * ...
 * @author Gabriel
 */

class Main extends Sprite 
{

	
	var Prueba_1:Logo_png;
	var Prueba_2:Logo_svg;
	var boton_contenedor:Botonsvg;
	var Pantallfull:Bool;
	
	
	
	public function new() 
	{
		super();
		
		
		
		Prueba_1 = new Logo_png();
		Prueba_1.x = stage.x / 2;
		Prueba_1.y = stage.y /2;
		addChild(Prueba_1);
		
		Prueba_2 = new Logo_svg();
		Prueba_2.cacheAsBitmap = true;
		addChild(Prueba_2);
		
		boton_contenedor = new Botonsvg();
		boton_contenedor.buttonMode = true;		//Cambia el cursor a la Mano cuanto tiene el focus
		boton_contenedor.scaleX = 1;
		boton_contenedor.scaleY = 1;
		boton_contenedor.x = 600;
		boton_contenedor.y = 30;
		boton_contenedor.addEventListener( MouseEvent.CLICK, Pantalla_Completa);
		addChild(boton_contenedor);
		
		var timer = new Timer (1000);
        timer.addEventListener (TimerEvent.TIMER, timer_onTimer);
        timer.start ();
		
	}
	
	  private function timer_onTimer (event:TimerEvent):Void {

		Prueba_1.Actualizar();
		Prueba_2.x = stage.width - Prueba_2.x;
		Prueba_2.y = stage.height - Prueba_2.y;
		Prueba_2.scaleX = Prueba_1.scaleX;
		Prueba_2.scaleY = Prueba_1.scaleY;
		boton_contenedor.rotation = Std.random(5)  * 180 / Math.PI;

    }

	private function Pantalla_Completa(event:MouseEvent):Void
	{
		if (Pantallfull)
		{
			Pantallfull = false;
			Lib.current.stage.displayState = StageDisplayState.NORMAL;
			root.scaleX = 1.0;
			root.scaleY = 1.0;
			root.x = 0;
			root.y = 0;
			
		}
		else
		{
			Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			Pantallfull = true;
			
		}
	
	}
}
