package;

import openfl.display.Sprite;
import openfl.display.Tilesheet;
import openfl.geom.Rectangle;
import openfl.Lib;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.events.Event;
import haxe.xml.Fast;





/**
 * ...
 * @author Gabriel
 */

class Main extends Sprite 
{
	
	var archivo = Assets.getText("img/textpack.xml");
	var Actor = new Tilesheet(Assets.getBitmapData("img/textpack.png"));
	var cuadros:Int = 0;
	

	
	
	public function new() 
	{

		//Leer el archivo XML
		var contenido = Xml.parse(archivo);
		var fasta = new Fast(contenido.firstElement());
		var k_dato:Int = 0;
				
		for (k_dato in fasta.elements) 
		{
			var imagen = k_dato.att.n;					//Nombre de la Imagen
			var coorx =  Std.parseFloat(k_dato.att.x);	//Posicion X
			var coory = Std.parseFloat(k_dato.att.y);	//Posicion y
			var largo = Std.parseFloat(k_dato.att.w);	//Largo
			var alto = Std.parseFloat(k_dato.att.h);	//Alto
			
			var rect:Rectangle = new Rectangle(coorx, coory, alto, largo);
			Actor.addTileRect(rect);
			
		}
		
		super();
		
		this.addEventListener(Event.ENTER_FRAME, CadaCuadro);

	}
	
	private function CadaCuadro(e:Event)
	{
		++cuadros;
		
		switch (cuadros) 
		{
		
		case 10 | 15: Actor.drawTiles(graphics, [150, 150, 0], false);
		case 15 | 20: Actor.drawTiles(graphics, [150, 150, 1], false);
		case 20 | 25: Actor.drawTiles(graphics, [150, 150, 2], false);
		case 25 | 30: Actor.drawTiles(graphics, [150, 150, 3], false);
		case 30 | 35: Actor.drawTiles(graphics, [150, 150, 2], false);
		case 35 | 40: Actor.drawTiles(graphics, [150, 150, 1], false);
		
		}
		
		if (cuadros > 45) cuadros = 0;
		
		
		
		
	}
	
}
