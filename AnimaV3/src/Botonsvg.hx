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
class Botonsvg extends Sprite
{
	var svg:SVG;
	var Boton_svg:Shape;
	
	
	public function new()
	{
		super ();
        
		var svg = new SVG (Assets.getText ("img/boton.svg"));
		Boton_svg = new Shape();
		svg.render(Boton_svg.graphics, 0, 0, 30, 30);
		addChild(Boton_svg);
	}
	
	
}