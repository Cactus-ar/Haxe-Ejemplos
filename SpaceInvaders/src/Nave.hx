package;
import openfl.display.Sprite;

/**
 * ...
 * @author Gabriel
 */
class Nave extends Sprite
{

	public function new() 
	{
		super();
		
		this.graphics.beginFill(0xffffff);
	
		this.graphics.drawRect (29, 4, 2, 2);
		this.graphics.drawRect (27, 6, 6, 6);
		this.graphics.drawRect (16, 12, 28, 4);
		this.graphics.drawRect (14, 16, 32, 6);

		
		
		this.graphics.endFill();
	}
	
}