package;

import openfl.display.Sprite;
import openfl.Lib;

/**
 * ...
 * @author gabriel
 */

class Main extends Sprite 
{

	private var Plataforma1:Plataforma;
	
		public function new() 
	{
		super();
		Plataforma1 = new Plataforma();
		Plataforma1.x = 200;
		Plataforma1.y = 540;
		this.addChild(Plataforma1);
		
	}

}
