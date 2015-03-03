package;
import openfl.display.Sprite;
/**
 * ...
 * @author Gabriel
 */
 
class Ladrillo extends Sprite
{

	public function new() 
	{
		super();
		this.graphics.beginFill(Std.random(1000)*0x169ffa);
		this.graphics.drawRoundRectComplex(0, 0, 35, 15, 5, 5, 5, 5);
		this.graphics.endFill();
	}
	
}