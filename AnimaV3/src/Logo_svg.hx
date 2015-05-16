package;

import openfl.Assets;
import openfl.Lib;
import openfl.display.Sprite;
import openfl.display.Shape;
import format.SVG;

/**
 * Incluir la librería SVG en el project.xml (<haxelib name="svg" />)
 * @author Gabriel
 */
class Logo_svg extends Sprite
{
	var svg:SVG;
	var haxelogo:Shape;
	
	
	public function new()
	{
		super ();
        
		var svg = new SVG (Assets.getText ("img/logo-haxe.svg"));
		haxelogo = new Shape();
		svg.render(haxelogo.graphics, 0, 0, 50, 50);
		addChild(haxelogo);
	}
	
	
}