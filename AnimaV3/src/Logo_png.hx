package;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.BitmapData;
import Std;

/**
 * ...
 * @author Gabriel
 */
class Logo_png extends Sprite
{

	
	var LogoBitmap: BitmapData;
	
	public function new() 
	{
		
		LogoBitmap = Assets.getBitmapData("img/logo-haxe.png");	
		super();
		this.graphics.beginBitmapFill(LogoBitmap);
		this.graphics.drawRect(0, 0, 50, 50);
		
	}
	
	public function Actualizar():Void
	{
		var escala:Int = Std.random(15);
		this.scaleX = escala;
		this.scaleY = escala;
		this.rotation = escala;
	}
	
}