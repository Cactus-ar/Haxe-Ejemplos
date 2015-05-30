package;


import openfl.display.FPS;
import openfl.text.TextFormat;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.events.Event;
import openfl.events.EventDispatcher;
import openfl.Lib;
import motion.Actuate;
import openfl.utils.Timer;
import openfl.events.TimerEvent;
import openfl.filters.GlowFilter;
import openfl.filters.BlurFilter;
import motion.easing.Elastic;
import motion.easing.Quad;

/**
 * ...
 * @author Gabriel
 */
class Fondo extends Sprite
{
	
	var fps:FPS = new FPS(10, 10);
	var Formato_Texto:TextFormat = new TextFormat("Verdana", 10, 0xedf505, false);
	
	var Cielo_png:BitmapData;
	var Nubes1_png: BitmapData;
	var Nubes2_png: BitmapData;
	var Pasto_png:BitmapData;
	var Diente_png:BitmapData;
	var Sol_png:BitmapData;
	var Semilla_Png:BitmapData;
	var Bicho_png:BitmapData;
	var Catel_png:BitmapData;
	
	
	var Fondo_Cielo: Sprite;
	var Fondo_Nubes1a:Sprite;
	var Fondo_Nubes1b:Sprite;
	var Fondo_Nubes2:Sprite;
	var Fondo_Pasto:Sprite;
	var Fondo_Diente:Sprite;
	var Sol_Saliendo:Sprite;
	var Bicho_Volando:Sprite;
	var Semilla_rnd:Semilla;
	var Cartel_haxe:Sprite;
	var Copo_de_Nieve:Copo_Nieve;
	var Semillas = new Array<Semilla>();
	var temporizador: Timer;
	var tempo:Int;
	
	private var Temp_Previo:Int;
	
	
	public function new() 
	{
		
		Cielo_png = Assets.getBitmapData("img/_Cielo.png");		
		Nubes1_png = Assets.getBitmapData("img/_nubes1Big.png");
		Nubes2_png = Assets.getBitmapData("img/_Nubes2.png");
		Pasto_png = Assets.getBitmapData("img/_hierba.png");
		Diente_png = Assets.getBitmapData("img/_Diente.png");
		Sol_png = Assets.getBitmapData("img/_sol.png");
		Bicho_png = Assets.getBitmapData("img/_bicho.png");
		Catel_png = Assets.getBitmapData("img/_cartel1.png");
		
		temporizador = new Timer (1000);
		
		
		super();
		
		
		Cielo();
		Nubes_Grandes();
		Sol_Brillante();
		Nubes_Chicas();
		Pasto_Entero();
		Diente_Entero();
		Bicho_Vuela();
		Semillero();
		Crear_Cartel();
		
		fps.defaultTextFormat = Formato_Texto;
		addChild(fps);
		
		addEventListener (Event.ENTER_FRAME, eve_onEnterFrame);
		
		temporizador.addEventListener (TimerEvent.TIMER, Tiempo);
	
		temporizador.start();
	}
	
	private function eve_onEnterFrame (event:Event):Void
	{
	
        var Temp_actual = Lib.getTimer ();
        var Temp_Delta = Temp_actual - Temp_Previo;
        Temp_Previo = Temp_actual;

        Fondo_Nubes1a.x -= 10 * (Temp_Delta / 1000);
		Fondo_Nubes1b.x -= 10 * (Temp_Delta / 1000);
		Fondo_Nubes2.x += 30 * (Temp_Delta / 1000);
		Sol_Saliendo.y -= 30 * (Temp_Delta / 1000);
		Bicho_Volando.x += 50 * (Temp_Delta / 1000);

		if (Fondo_Nubes1a.x < -Fondo_Nubes1a.width) { Fondo_Nubes1a.x = 1580; }
		if (Fondo_Nubes1b.x < -Fondo_Nubes1b.width) { Fondo_Nubes1b.x = 1580; }
		
		if (Fondo_Nubes2.x > Fondo_Nubes2.width) { Fondo_Nubes2.x = -800; }
		if (Bicho_Volando.x > stage.stageWidth) { Bicho_Volando.x = -40; }
		if (Sol_Saliendo.y < 20) { Sol_Saliendo.y = 20; }
		
		for (i in 0...Semillas.length)
		{
			if (Semillas[i].x > stage.stageWidth)
			{ 
				Semillas.remove(Semillas[i]);
				removeChild(Semillas[i]);
				return;
			}
			else
			{
				Semillas[i].x += (60 +Std.random(50)) * (Temp_Delta / 1000);
				Semillas[i].y += Std.random(100) * (Temp_Delta / 1000);
				Semillas[i].rotation += (80 +Std.random(-1)) * (-Temp_Delta / 1000);
				
				
			}
		}
    }
	
	private function Cielo()
	{
		Fondo_Cielo = new Sprite();
		Fondo_Cielo.graphics.beginBitmapFill(Cielo_png);
		Fondo_Cielo.graphics.drawRect(0, 0, 800, 549);
		Fondo_Cielo.graphics.endFill();
		addChild(Fondo_Cielo);
	}
	
	private function Nubes_Grandes()
	{
		Fondo_Nubes1a = new Sprite();
		Fondo_Nubes1a.graphics.beginBitmapFill(Nubes1_png);
		Fondo_Nubes1a.graphics.drawRect(0, 0, 1588, 600);
		Fondo_Nubes1a.graphics.endFill();
		Fondo_Nubes1a.cacheAsBitmap = true;
		Fondo_Nubes1a.x = -Fondo_Nubes1a.width/2;
		Fondo_Nubes1a.y = 0;
		addChild(Fondo_Nubes1a);
		
		Fondo_Nubes1b = new Sprite();
		Fondo_Nubes1b.graphics.beginBitmapFill(Nubes1_png);
		Fondo_Nubes1b.graphics.drawRect(0, 0, 1588, 600);
		Fondo_Nubes1b.graphics.endFill();
		Fondo_Nubes1b.cacheAsBitmap = true;
		Fondo_Nubes1b.x = Fondo_Nubes1b.width/2;
		Fondo_Nubes1b.y = 0;
		addChild(Fondo_Nubes1b);
	}

	private function Nubes_Chicas()
	{
		Fondo_Nubes2 = new Sprite();
		Fondo_Nubes2.graphics.beginBitmapFill(Nubes2_png);
		Fondo_Nubes2.graphics.drawRect(0, 0, 800, 288);
		Fondo_Nubes2.x = 0;
		Fondo_Nubes2.y = 0;
		Fondo_Nubes2.graphics.endFill();
		addChild(Fondo_Nubes2);
	}
	
	private function Pasto_Entero()
	{
		Fondo_Pasto = new Sprite();
		Fondo_Pasto.graphics.beginBitmapFill(Pasto_png);
		Fondo_Pasto.graphics.drawRect(0, 0, 800, 549);
		Fondo_Pasto.graphics.endFill();
		addChild(Fondo_Pasto);
	}
	
	private function Diente_Entero()
	{
		Fondo_Diente = new Sprite();
		Fondo_Diente.graphics.beginBitmapFill(Diente_png);
		Fondo_Diente.graphics.drawRect(0, 0, 182, 497);
		Fondo_Diente.graphics.endFill();
		Fondo_Diente.x = 50;
		Fondo_Diente.y = 100;
		addChild(Fondo_Diente);
	}
	
	private function Sol_Brillante()
	{
		Sol_Saliendo = new Sprite();
		Sol_Saliendo.graphics.beginBitmapFill(Sol_png);
		Sol_Saliendo.graphics.drawRect(0, 0, 400, 400);
		Sol_Saliendo.graphics.endFill();
		Sol_Saliendo.cacheAsBitmap = true;
		Sol_Saliendo.scaleX = 0.3;
		Sol_Saliendo.scaleY = 0.3;
		Sol_Saliendo.x = 600;
		Sol_Saliendo.y = 600;
		addChild(Sol_Saliendo);
		
	}
	
	private function Bicho_Vuela()
	{
		Bicho_Volando = new Sprite();
		Bicho_Volando.graphics.beginBitmapFill(Bicho_png);
		Bicho_Volando.graphics.drawRect(0, 0, 40, 40);
		Bicho_Volando.graphics.endFill();
		Bicho_Volando.cacheAsBitmap = true;
		Bicho_Volando.x = 0;
		Bicho_Volando.y = 120;
		addChild(Bicho_Volando);
	}
	
	private function Semillero()
	{
		Semilla_rnd = new Semilla();
		Semilla_rnd.x = 200;
		Semilla_rnd.y = 130;
		addChild(Semilla_rnd);
		Semillas.push(Semilla_rnd);
	}
	
	private function Crear_Cartel()
	{
		Cartel_haxe = new Sprite();
		Cartel_haxe.graphics.beginBitmapFill(Catel_png);
		Cartel_haxe.graphics.drawRect(0, 0, 374, 433);
		Cartel_haxe.graphics.endFill();
		Cartel_haxe.cacheAsBitmap = true;
		Cartel_haxe.x = 400;
		Cartel_haxe.y = 170;
		Cartel_haxe.alpha = 0;
		addChild(Cartel_haxe);
	}
	
	private function Crear_Copos():Void
	{
		Copo_de_Nieve = new Copo_Nieve();
		Copo_de_Nieve.x = Math.random () * stage.stageWidth;
		Copo_de_Nieve.y = Math.random () * stage.stageHeight;
		addChild(Copo_de_Nieve);
		Mover_Copo (Copo_de_Nieve);
	}

	 private function Tiempo (event:TimerEvent):Void
	{
		tempo++;
		
		Semillero();
		brilla();
		
		if (tempo == 3)
		{
			Actuate.tween (Bicho_Volando, 2, { y:Bicho_Volando.y +5 } ).delay (0.4).ease (Elastic.easeInOut).reverse();	
		}

		if (tempo == 8)
		{
			Mostrar_cartel();
		}
		
		if (tempo == 15)
		{
			Actuate.transform (Fondo_Nubes2, 10).color (0x000000, 0.7, null);
			Actuate.transform (Fondo_Nubes1a, 20).color (0x000000, 0.7, null);
			Actuate.transform (Fondo_Nubes1b, 20).color (0x000000, 0.7, null);
			Actuate.tween (Sol_Saliendo, 30, { x: -150, y: -30 } );
			
			
		}
		
		if (tempo == 20) {
			Ventizca();
		}
		
		
	}
	
	
	private function Mostrar_cartel():Void {
		Cartel_haxe.alpha = 1;
		Cartel_haxe.filters =  [ new BlurFilter (255, 255, 3)];
			
		Actuate.effects(Cartel_haxe, 0).filter (BlurFilter, { blurX: 255, blurY: 255 } ).onComplete( 
			function():Void 
			{
				Actuate.effects(Cartel_haxe, 6).filter (BlurFilter, { blurX: 0, blurY: 0 } );
			}
		);
					
		
    }
	
	 
	private function brilla()
	{
		var activo:Bool = Actuate.isActive();
		
		if (!activo)
		{
		Sol_Saliendo.filters = [ new GlowFilter(0xEDEB55, 1, 0, 0) ];
		Actuate.effects(Sol_Saliendo, 5).filter (GlowFilter, { blurX: 40, blurY: 40 } ).onComplete( 
			function():Void 
			{
				Actuate.effects(Sol_Saliendo, 5).filter (GlowFilter, { blurX: 1, blurY: 1 } );
			}
		);
		}
	}
	
	private function Mover_Copo (Copo_de_Nieve:Sprite):Void {
		
		var tiempo_t:Float = 1.5 + Math.random () * 4.5;
		var CoordX:Float = Math.random () * stage.stageWidth;
		var CoordY:Float = Math.random () * stage.stageHeight;
		
		Actuate.tween (Copo_de_Nieve, tiempo_t, { x: CoordX, y: CoordY }, false).ease (Quad.easeOut).onComplete (Mover_Copo, [ Copo_de_Nieve ]);
		
	}
	
	private function Ventizca ():Void {
		
		var Retardo:Float;
		
		for (i in 0...80) {
			
			Retardo = Math.random () * 10;
			Actuate.timer (Retardo).onComplete (Crear_Copos);
			
		}
		
	}

}