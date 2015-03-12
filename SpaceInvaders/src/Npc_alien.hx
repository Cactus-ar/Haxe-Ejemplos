package;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
/**
 * ...
 * @author Gabriel
 */
class Npc_alien extends Sprite
{

	
	
	public function new() 
	{
		
		
		super();
		var lienzo:BitmapData = Assets.getBitmapData("img/alien1x.png");	
		this.graphics.beginBitmapFill(lienzo);
		this.graphics.drawRect(0, 0, 32, 32);
		
	}
	
}