package;

import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.FPS;
import openfl.system.System;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.Assets;
import openfl.display.Tilesheet;
import openfl.geom.Rectangle;
import openfl.Lib;
import openfl.events.TimerEvent;
import openfl.utils.ByteArray;
import openfl.events.Event;
import openfl.utils.Timer;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Gabriel
 * 
 * Click del mouse para activar/desactivar el timer
 */

class Main extends Sprite 
{
	var fps:FPS = new FPS(10, 10);
	var memsistema:Float;
	var Formato_Texto:TextFormat = new TextFormat("Verdana", 10, 0xedf505, false);
	var memusada:TextField;
	var cantidad:TextField;
	var Marco1 = new Sprite();
	var Conjunto:BitmapData = Assets.getBitmapData("img/SabanaItems.png");
	var Imagenes:Tilesheet = new Tilesheet(Assets.getBitmapData("img/SabanaItems.png"));
	var Contenedor:Sprite = new Sprite();
	var temporizador = new Timer (1000);
	var Pausa:Bool = true;
	var tiles:Array<Float> = [];
	var i:Int;
	var cuenta:Int = 0;
	
	
	
	public function new() 
	{
		super();

	//Marco para la visualizacion de datos
	
	Marco1.graphics.lineStyle (2, 0xff0000);
	Marco1.graphics.beginFill(0x000000);
	Marco1.graphics.drawRect (0, 0, 200, 70);
	Marco1.graphics.endFill();
	Marco1.x = 5;
	Marco1.y = 5;
	
	
	//Datos a mostrar
	
	fps.defaultTextFormat = Formato_Texto;
	
	memusada = new TextField();
	memusada.defaultTextFormat = Formato_Texto;
	memusada.selectable = false;
	memusada.width = 200;
	memusada.x = 10;
	memusada.y = 30;
	
	cantidad = new TextField();
	cantidad.defaultTextFormat = Formato_Texto;
	cantidad.selectable = false;
	cantidad.width = 200;
	cantidad.x = 10;
	cantidad.y = 50;
	
	
	//-------------------
	
	//Recorremos la imagen y extraemos los Tiles
	
	var totalX:Int = Math.floor(Conjunto.width / 32);
	var totalY:Int = Math.floor(Conjunto.height / 32);
	
	
	for(y in 0...totalY){
		for (x in 0...totalX)
		{

			var rect:Rectangle = new Rectangle(x * 32, y * 32, 32, 32);		
			Imagenes.addTileRect(rect);
			
		}
	}
	//-------------------
		
	
	this.addChild(Contenedor);
	this.addChild(Marco1);
	this.addChild(fps);
	this.addChild(memusada);
	this.addChild(cantidad);
	
	
	
		//Timer
		temporizador.addEventListener (TimerEvent.TIMER, Tiempo);
	
		//Mouse
		stage.addEventListener(MouseEvent.CLICK, Pausado);
		
		//En cada Cuadro
		stage.addEventListener(Event.ENTER_FRAME, CadaCuadro);
	}
	
	
	private function CadaCuadro(e:Event)
	{	
		
		memsistema = Math.round(System.totalMemory / 1024 / 1024 * 100) / 100;
		memusada.text = "Memoria: " + memsistema + " Mb";
		cantidad.text = "Objetos: " + cuenta;
	}
	
	private function Pausado(e:MouseEvent)
	{
		if (Pausa) {
			Pausa = false;
			temporizador.stop();
		}else 
		{
			Pausa = true;
			temporizador.start ();	
		}
		
	}
	
	 private function Tiempo (event:TimerEvent):Void
	{
		//Por cada 100 Tiles, generamos:
		// 1) Elección de entre los 255 que existen
		// 2) Posición en la Pantalla (_x _y)
		// 3) Vector de orientación
		
		for (i in 0...100) {
		
		var _type:Int = Math.round(Math.random() * 255);
		var _x:Int = Math.round(Math.random() * 800);
		var _y:Int = Math.round(Math.random() * 480);
		var _direction:Int = (Math.random() > .5)?( -1):(1);
		
		++cuenta; //Se incrementa de a 100 en 100 obviamente
		
		//Concatenamos todas las variables dentro del array
		tiles = tiles.concat([_x, _y, _type, _direction, 0, 0, 1]);
	}
	
		//Dibujamos lo generado
	Imagenes.drawTiles(Contenedor.graphics, tiles, true, Tilesheet.TILE_TRANS_2x2);	
	
	}
}
