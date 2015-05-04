package;


import openfl.Lib;
import openfl.display.Sprite;



/**
 * ...
 * @author Gabriel
 */

class Main extends Sprite
{
	
	private var Carga:Cargador;
	private var Inicio:Menu;
	
	
	public function new() 
	{
		
		
		
		super();
		Carga = new Cargador();
		Carga.Niveles(15);
		
		
		
		
		Inicio = new Menu();
		addChild(Inicio);
		
		
		
	}
}
