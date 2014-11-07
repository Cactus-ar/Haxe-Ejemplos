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
import haxe.ui.toolkit.containers.ListView;
import haxe.ui.toolkit.controls.HProgress;
import haxe.ui.toolkit.controls.Text;
import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.core.PopupManager;

import openfl.net.URLRequest;
import openfl.net.URLLoader;
import openfl.media.Sound;
import openfl.media.SoundChannel;
import Math;

/**
 * ...
 * @author gabriel
 */

class Main {
	static public function main() {
	
		var items = new Array<String>();
		
		Toolkit.theme = new GradientTheme();			//Tema de colores usado por HaxeUI
		Toolkit.init();
		Toolkit.openFullscreen(function (root:Root)
		{

// ------------- Variables --------------------------------------

			var sonido: Sound = new Sound();
			var canal: SoundChannel = new SoundChannel();
			var porcentual_1: Float = 0;
			var  porcentual_2: Float = 0;
			var posicion: Float = 0;
			
			
// ------------ Declaracion de Controles ---------------------
		
			var cajon:Box = new Box();
			cajon.x = 10;												//Punto de Origen x (abscisa o eje horizontal)
			cajon.y = 10;												//Punto de Origen y (origen o eje vertical)
			cajon.width = 420;										//Largo del cajon
			cajon.height = 300;									//Alto del cajón
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
			carga.disabled = true;
			
			var leyenda_1: Text = new Text();				//Simple etiqueta 1
			leyenda_1.x = 25;
			leyenda_1.y = 65;
			leyenda_1.style.fontSize = 15;
			leyenda_1.text = "Descargando:";
			
			var barra_1: HProgress = new HProgress();		//progreso de la descarga
			barra_1.x = 125;
			barra_1.y = 65;
			barra_1.width = 225;
			barra_1.min = 0;
			barra_1.max = 100;
			
			var leyenda_2: Text = new Text();				//Esta se va a modificar con codigo
			leyenda_2.x = 360;
			leyenda_2.y = 65;
			leyenda_2.style.fontSize = 15;
			leyenda_2.text = "100%";
			
			var divisor_1:Box = new Box();
			divisor_1.x = 10;
			divisor_1.y = 105;
			divisor_1.width = 420;
			divisor_1.height = 4;
			divisor_1.style.backgroundColor = 0x000000;
			
			var lista:ListView = new ListView();				//Lista de canciones
			lista.x = 25;
			lista.y = 118;
			lista.width = 200;
			lista.height = 150;
			lista.style.borderSize = 2;
			lista.style.borderColor = 0x000000;
			
			var remover:Button = new Button();	//Borra la lista completamente
			remover.x = 36;
			remover.y = 275;
			remover.text = "X";
			remover.style.fontBold = true;
			remover.style.fontSize = 10;
			remover.style.color = 0xFF0000;
			
			var reproducir:Button = new Button();	//Play
			reproducir.x = 81;
			reproducir.y = 275;
			reproducir.text = ">";
			reproducir.style.fontBold = true;
			reproducir.style.fontSize = 10;
			reproducir.disabled = true;
			
			var pausa:Button = new Button();	//Pausa
			pausa.x = 126;
			pausa.y = 275;
			pausa.text = "||";
			pausa.style.fontBold = true;
			pausa.style.fontSize = 10;
			pausa.disabled = true;
			
			var parar:Button = new Button();	//Stop
			parar.x = 171;
			parar.y = 275;
			parar.text = "▓";
			parar.style.fontBold = true;
			parar.style.fontSize = 10;
			parar.disabled = true;
			
			
			var barra_2: HProgress = new HProgress();		//progreso de la reproduccion
			barra_2.x = 245;
			barra_2.y = 120;
			barra_2.width = 100;
			barra_2.min = 0;
			barra_2.max = 100;
			
			
			var leyenda_3: Text = new Text();
			leyenda_3.style.fontSize = 15;
			leyenda_3.x = 360;
			leyenda_3.y = 120;
			
			
			
			
			
// ----------------- Eventos -------------------------

			carga.addEventListener(UIEvent.CLICK, function(e:UIEvent) {
				var largo:Int = direccion.text.length;		//Almacena el largo de la cadena
				var corte:String = direccion.text.substr(largo-4, largo - 1);	//almacena los ultimos 4 caracteres
				if (corte == ".mp3") {
					items.push(direccion.text);
					lista.dataSource.add ( { text: direccion.text.substr(largo-20, largo - 1) } );	//Agrega a la lista una cadena mas corta
					direccion.text = "";	//prepara para nueva entrada
					largo = 0;	corte = "";
					carga.disabled = true;	//desactiva el boton
					
					
				}else
					{
						PopupManager.instance.showSimple("Dirección Incorrecta", "Error", PopupButton.CANCEL);		//Popup declarando el error
						direccion.text = "";		//bora la cadena erronea
						carga.disabled = true;	//desactiva el boton
					}
				
			});
			
			direccion.addEventListener(UIEvent.CHANGE, function (e:UIEvent){
			carga.disabled = false;	//si existe una entrade de teclado, que se active el botón.
			});
			
			
			lista.addEventListener(UIEvent.DOUBLE_CLICK, function (e:UIEvent)	{
				
				var direurl:URLRequest = new URLRequest(items[lista.selectedIndex]);
				
				canal.stop();
				
				if (sonido.isBuffering){
					sonido.close(); }
				sonido = new Sound(direurl);
				reproducir.disabled = false;
				
			});
			
			remover.addEventListener(UIEvent.CLICK, function (e:UIEvent) {
				lista.dataSource.removeAll();			//Remueve todas las entradas de la lista
				while(items.length > 0) {        		//Remueve todos los items de la matriz
				items.pop();
				}
				
				canal.stop();
				
				if (sonido.isBuffering){
				sonido.close(); }
				
				posicion = 0;
				barra_1.pos = 0;
				barra_2.pos = 0;
				pausa.disabled = true;
				reproducir.disabled = true;
				
			});
			
			reproducir.addEventListener(UIEvent.CLICK, function (e:UIEvent) {
				
				canal = sonido.play(posicion);
				reproducir.disabled = true;
				pausa.disabled = false;
				parar.disabled = false;
				
			});
			
			pausa.addEventListener(UIEvent.CLICK, function (e:UIEvent) {
				posicion = canal.position;
				canal.stop();
				reproducir.disabled = false;
				pausa.disabled = true;
			});
			
			parar.addEventListener(UIEvent.CLICK, function (e:UIEvent)
			{
				canal.stop();
				posicion = 0 ;
				porcentual_2 = 0;
				barra_2.pos = 0;
				reproducir.disabled = false;
				pausa.disabled = true;
				
			});
			root.addEventListener(Event.ENTER_FRAME, function (e:Event) {
				
				porcentual_1 = ((sonido.bytesLoaded / sonido.bytesTotal) * 100);
				leyenda_2.text = Std.string(Std.int(porcentual_1)) + "%";
				barra_1.pos = porcentual_1;
				
				porcentual_2 = ((canal.position / sonido.length) * 100);
				barra_2.pos = porcentual_2;
				leyenda_3.text = Std.string(Std.int(porcentual_2)) + "%";
				
				
			});
			
			
			
			root.addChild(cajon);
			root.addChild(direccion);
			root.addChild(carga);
			root.addChild(leyenda_1);
			root.addChild(barra_1);
			root.addChild(leyenda_2);
			root.addChild(divisor_1);
			root.addChild(lista);
			root.addChild(remover);
			root.addChild(reproducir);
			root.addChild(pausa);
			root.addChild(leyenda_3);
			root.addChild(barra_2);
			root.addChild(parar);
			
		});
		
	}
	
}