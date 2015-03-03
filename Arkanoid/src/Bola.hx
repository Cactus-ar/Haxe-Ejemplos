package;
import openfl.display.Sprite;

/**
 * ...
 * @author Gabriel
 */
class Bola extends Sprite
{

	public function new() 
	{
		super();
		this.graphics.beginFill(0xffffff);
		this.graphics.drawCircle(0, 0, 8);
		this.graphics.endFill();
	}
	
}