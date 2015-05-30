package;
import openfl.display.Sprite;

/**
 * ...
 * @author Gabriel
 */
class Copo_Nieve extends Sprite
{

	public function new() 
	{
		
		var radio_copo:Float = 5 + Math.random () * 5;
		
		super();
		
		this.graphics.beginFill (0xFFFFFF);
		this.graphics.drawCircle (0, 0, radio_copo);
		this.alpha = 0.2 + Math.random () * 0.6;
		
	}
	
}