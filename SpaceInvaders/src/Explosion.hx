package;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.BitmapData;
import openfl.display.Bitmap;

/**
 * ...
 * @author Gabriel
 */
class Explosion extends Sprite
{

	var Explosionbitmap: BitmapData;
	
	public function new() 
	{
		
		Explosionbitmap = Assets.getBitmapData("img/explosion.png");	
		super();
		this.graphics.beginBitmapFill(Explosionbitmap);
		this.graphics.drawRect(0, 0, 32, 36);
		
	}
	
}
