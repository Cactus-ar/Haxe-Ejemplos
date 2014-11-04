package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;

import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.themes.GradientTheme;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.containers.Box;
import haxe.ui.toolkit.controls.TextInput;
import haxe.ui.toolkit.controls.Button;

/**
 * ...
 * @author gabriel
 */

class Main {
	static public function main(){
		
		Toolkit.theme = new GradientTheme();
		Toolkit.init();
		Toolkit.openFullscreen(function (root:Root)
		{
		
			var cajon:Box = new Box();
			cajon.x = 10;												//Punto de Origen x (abscisa o eje horizontal)
			cajon.y = 10;												//Punto de Origen y (origen o eje vertical)
			cajon.width = 420;										//Largo del cajon
			cajon.height = 170;									//Alto del cajón
			cajon.style.backgroundColor = 0xFFFFFF;	//Color de Fondo (blanco en este caso)
			cajon.style.borderSize = 3;							//Grosor en pixels del borde
			cajon.style.borderColor = 0x000000;			//Color del borde (negro)
			cajon.style.cornerRadius = 4;						//Redondeo de las esquinas (en pixels)
			
			var direccion:TextInput = new TextInput();
			direccion.x = 25;
			direccion.y = 25;
			direccion.width = 300;
			direccion.style.fontSize = 15;						//Tamaño de la tipografía
			direccion.text	= "Agregar";							//Texto a mostrar inicialmente
			
			var carga:Button = new Button();
			carga.x = 350;
			carga.y = 25;
			carga.text = "Cargar";								//Etiqueta del boton
			
			root.addChild(cajon);
			root.addChild(direccion);
			root.addChild(carga);
		});
		
			
	}
	
}