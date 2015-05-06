package;
import openfl.display.Sprite;

/**
 * ...
 * @author Gabriel
 */
class Personaje extends Sprite
{

	public function new(Textura:UInt, CoordX:Int, CoordY:Int) 
	{
		super();
		//la caja del personaje debe ser un poco mas pequeña para que no colisione instantaneamente
		this.graphics.beginFill(Textura);
		this.graphics.drawRoundRectComplex(CoordX+2, CoordY+2, 28, 28, 5, 5, 5, 5);
		this.graphics.endFill();
	}

}