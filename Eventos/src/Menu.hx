package;
import openfl.Lib;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.events.Event;
import openfl.events.MouseEvent;
import motion.Actuate;


/**
 * ...
 * @author Gabriel
 */
class Menu extends Sprite
{
	public var Pausa:Bool;
	var recursos:Cargador;
	var recuadro:Sprite;
	var Formato_txt:TextFormat;
	var boton_1_txt:TextField;
	var boton_2_txt:TextField;
	var boton_1:Sprite;
	var boton_2:Sprite;
	var boton_3:Sprite;
	var boton_4:Sprite;


	public function new() 
	{
		super();
		Pausa = true;
		recursos = new Cargador();
		Formato_txt = new TextFormat("Verdana", 16, 0x00ff11);
		Formato_txt.align = TextFormatAlign.CENTER;
		
		recuadro = new Sprite();
		recuadro.graphics.lineStyle (3, 0xFFBB00);
		recuadro.graphics.beginFill (0x000000, 0.3);
		recuadro.graphics.drawRoundRect(0, 0, 200, 200, 7);
		recuadro.graphics.endFill();
		addChild(recuadro);
		
		
		//------------ Boton 1 Forma ------------
		boton_1 = new Sprite();
		boton_1.graphics.lineStyle (3, 0xFFBB00);
		boton_1.graphics.beginFill (0x000000, 0);
		boton_1.graphics.drawRoundRect(0, 0, 100, 30, 7);
		boton_1.buttonMode = true;
		boton_1.graphics.endFill();
		boton_1.addEventListener(MouseEvent.CLICK, Evento1_click);
		
		// ----------Boton 1 Texto -----------------
		boton_1_txt = new TextField();
		boton_1_txt.width = boton_1.width;
		boton_1_txt.height = boton_1.height;
		boton_1_txt.defaultTextFormat = Formato_txt;
		boton_1_txt.selectable = false;
		boton_1_txt.text = "Musica:Off";
		
		// ------------Boton 1 Pos y Add ------------
		boton_1.x = recuadro.x + (recuadro.width - boton_1.width)/2;
		boton_1.y = recuadro.y + 20;
		
		boton_1_txt.x = boton_1.x;
		boton_1_txt.y = boton_1.y;
		
		addChild(boton_1_txt);
		addChild(boton_1);
		
		//---------Boton 2 Forma ---------------
		boton_2 = new Sprite();
		boton_2.graphics.lineStyle (3, 0xFFBB00);
		boton_2.graphics.beginFill (0x000000, 0);
		boton_2.graphics.drawRoundRect(0, 0, 100, 30, 7);
		boton_2.buttonMode = true;
		boton_2.graphics.endFill();
		boton_2.addEventListener(MouseEvent.CLICK, Evento2_click);
		//-----------Boton 2 Texto---------------
		boton_2_txt = new TextField();
		boton_2_txt.width = boton_2.width;
		boton_2_txt.height = boton_2.height;
		boton_2_txt.defaultTextFormat = Formato_txt;
		boton_2_txt.selectable = false;
		boton_2_txt.text = "Deslizar";
		
		//---------Boton 2 Pos y Add--------------
		boton_2.x = boton_1.x;
		boton_2.y = boton_1.y + boton_1.height + 20;
		boton_2_txt.x = boton_2.x;
		boton_2_txt.y = boton_2.y;
		
		addChild(boton_2_txt);
		addChild(boton_2);
		
	}

	
	
	public function Evento1_click(event:MouseEvent)
	{
		dispatchEvent(new Event("Evento_1_Main", true, false));	
	}
	
	public function Evento2_click(event:MouseEvent)
	{
		dispatchEvent(new Event("Evento_2_Main", true ,false));	
	}
	
	public function Evento_Remover(event:Event)
	{
		boton_1.removeEventListener(MouseEvent.CLICK, Evento1_click);
		boton_1.buttonMode = false;
	}
	
	public function Evento_Activar(event:Event)
	{
		if (Pausa)
		{
			boton_1_txt.text = "Musica:Off";
		}
		else
		{
			boton_1_txt.text = "Musica:On";
		}
		
		boton_1.addEventListener(MouseEvent.CLICK, Evento1_click);
		boton_1.buttonMode = true;
		
	}

}