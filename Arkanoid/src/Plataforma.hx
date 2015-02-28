package;
import openfl.display.Sprite;

/**
 * ...
 * @author gabriel
 */
class Plataforma extends Sprite
{

	public function new() 
	{
		super();
		this.graphics.beginFill(0xeaff00);
		this.graphics.drawRoundRectComplex(0, 0, 85, 15, 5, 5, 5, 5);
		this.graphics.endFill();
	}
	
}