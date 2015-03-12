package;
import openfl.display.Sprite;

/**
 * ...
 * @author Gabriel
 */
class Misil extends Sprite
{

	public function new() 
	{
		super();
		
		this.graphics.beginFill(0xffffff);
		this.graphics.drawRoundRect(0, 0, 3, 6, 1, 1);
		this.graphics.endFill();
	}
	
}