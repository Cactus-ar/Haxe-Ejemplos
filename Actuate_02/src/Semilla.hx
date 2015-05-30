package;
import openfl.display.Sprite;
import openfl.display.BitmapData;
import openfl.Assets;
/**
 * ...
 * @author Gabriel
 */
class Semilla extends Sprite
{
	var Semilla_Png = Assets.getBitmapData("img/_semilla.png");
	
	public function new() 
	{
		super();
		this.graphics.beginBitmapFill(Semilla_Png);
		this.graphics.drawRect(0, 0, 32, 66);
		this.graphics.endFill();
		this.cacheAsBitmap = true;
		this.graphics.endFill();
	}
	
}