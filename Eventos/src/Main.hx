package;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;
import openfl.media.SoundTransform;
import motion.Actuate;


/**
 * ...
 * @author Gabriel
 */

class Main extends Sprite 
{
	var contenedor:Sprite;
	var menu_inicial: Menu;
	var carga: Cargador;
	var audio_pos:Float;
	var audio_rep:Bool;
	var audio_vol:SoundTransform;
	
	
	public function new() 
	{
		super();
		audio_rep = false;
		audio_vol = new SoundTransform();
		audio_vol.volume = 0;
		carga = new Cargador();
		
		
		contenedor = new Sprite();
		contenedor.graphics.beginBitmapFill(carga.fondo);
		contenedor.graphics.drawRect(0, 0, 800, 600);
		contenedor.graphics.endFill();
		addChild(contenedor);
		
		menu_inicial = new Menu();
		menu_inicial.x = (stage.stageWidth - menu_inicial.width) /2;
		menu_inicial.y = (stage.stageHeight - menu_inicial.height) / 2;
		addChild(menu_inicial);
		
		addEventListener("Evento_1_Main", Evento_1_Main);
		addEventListener("Evento_2_Main", Evento_2_Main);
		addEventListener("Evento_Menu_Remover", menu_inicial.Evento_Remover);
		addEventListener("Evento_Menu_Activar", menu_inicial.Evento_Activar);
	}
	
	
	public function Evento_1_Main(e:Event):Void
	{
		this.dispatchEvent(new Event("Evento_Menu_Remover",true,false));
		if (audio_rep)
		{
		audio_rep = false;
		Actuate.transform (carga.audio_canal, 3).sound (0, 0).onComplete (
		function():Void 
			{
				audio_pos = carga.audio_canal.position;
				audio_rep = false;
				carga.audio_canal.stop;
				menu_inicial.Pausa = true;
				this.dispatchEvent(new Event("Evento_Menu_Activar",true,false));
			});
		}
		else
		{
		carga.audio_canal = carga.musica.play(audio_pos,0,audio_vol);
		Actuate.transform (carga.audio_canal, 3).sound (1, 0).onComplete (
		function():Void 
			{ 
				audio_rep = true;
				menu_inicial.Pausa = false;
				this.dispatchEvent(new Event("Evento_Menu_Activar",true,false));
			});
		}
		
		
	}
	
	public function Evento_2_Main(e:Event):Void
	{
	Actuate.tween (menu_inicial, 3, {x:0} ).repeat().reflect();
	}
	
	
	
}

