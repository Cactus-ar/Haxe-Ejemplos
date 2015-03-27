package;

import openfl.display.Sprite;
import openfl.display.Tilesheet;
import openfl.geom.Rectangle;
import openfl.Lib;
import openfl.display.BitmapData;
import Xml;
import haxe.xml.Fast;

import openfl.Assets;

/**
 * ...
 * @author Gabriel
 */

class Main extends Sprite 
{
	
	var archivo = Assets.getText("img/textpack.xml");
	var luliu = new Tilesheet(Assets.getBitmapData("img/textpack.png"));
	
	
	public function new() 
	{

		//Leer el archivo XML
		var contenido = Xml.parse(archivo);
		var fasta = new Fast(contenido.firstElement());
		var k_dato:Int = 0;
				
		for (k_dato in fasta.elements) 
		{
			var imagen = k_dato.att.n;
			var coorx = k_dato.att.x;
			var coory = k_dato.att.y;
			var largo = k_dato.att.w;
			var alto = k_dato.att.h;
		}
		
	
			
		super();
		trace("fin");
	
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
	}
}
