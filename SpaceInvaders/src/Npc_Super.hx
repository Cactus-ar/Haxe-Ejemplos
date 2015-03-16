package;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
/**
 * ...
 * @author Gabriel
 */
class Npc_Super extends Sprite
{

	var AlienBitmap: BitmapData;
	
	public function new() 
	{
		
		AlienBitmap = Assets.getBitmapData("img/enemyShip.png");	
		super();
		this.graphics.beginBitmapFill(AlienBitmap);
		this.graphics.drawRect(0, 0, 74, 36);
		
	}
	
}