package;
import openfl.display.Sprite;

/**
 * ...
 * @author Gabriel
 */
class Bloque extends Sprite
{

	public function new(Textura:UInt, CoordX:Int, CoordY:Int) 
	{
		super();
		this.graphics.beginFill(Textura);
		this.graphics.drawRoundRectComplex(CoordX+2, CoordY+2, 28, 28, 5, 5, 5, 5);
		this.graphics.endFill();
	}
	
}