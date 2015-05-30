package;

import openfl.display.Sprite;
import openfl.Lib;


/**
 * ... Ejemplo de varios métodos con tweens y la librería Actuate Nº2
 * @author Gabriel
 */

class Main extends Sprite 
{

	var Menu_Inicial:Fondo;
	
	public function new() 
	{
		super();
		Menu_Inicial = new Fondo();
		addChild(Menu_Inicial);		
	}
	
}
