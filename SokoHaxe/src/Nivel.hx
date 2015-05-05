package;
import openfl.display.Sprite;
import Std;


/**
 * ...
 * @author Gabriel
 */
class Nivel extends Sprite
{
	
	public static inline var Piso : UInt = 0xF0E4A7;
	public static inline var Pared : UInt = 0x734D2D;
	public static inline var PersonajeT : UInt = 0xDE3C4C;
	public static inline var BloqueT : UInt = 0x3CDE82;
	public static inline var Objetivo : UInt = 0x3CDEDB;
	
	public var Personaje_Obj:Personaje;
	
	private var Textura:UInt;
	private var CoordX:Int;
	private var CoordY:Int;
	private var Carga:Cargador;
	private var Bloques:Bloque;
	
	public var Nivel_Actual = new Array<Bloque>();
	
	
	public function new() 
	{
	super();	
	}
	
	
	public function Dibujar()
	{
	
	Carga = new Cargador();
	Carga.Niveles(6);		//Que nivel debemos elegir dentro del archivo
	
	var centro:Float;
	centro = (800 - Carga.Ancho) / 2;
	
	for (i in Carga.Hileras) //Por cada hilera dentro del mapa, recorremos la fila
	{
		for (f in 0...i.length) //Por cada caracter dentro de la hilera
		{
		switch (i.charAt(f)) 	//Despende del caracter encontrado decidimos que hacer
		{
			case " ": Textura = Piso;
			case "#": Textura = Pared;
			
			case "@": Textura = PersonajeT;
					  Personaje_Obj = new Personaje(Textura, CoordX, CoordY);

			case "$": Textura = BloqueT;
			case ".": Textura = Objetivo;
		} 
		
		//--- 
		Bloques = new Bloque(Textura, CoordX, CoordY);
		Nivel_Actual.push(Bloques);
		this.addChild(Bloques);
		
		CoordX += 32;
		}
		CoordY += 32;
		CoordX = 0;
	}
	this.addChild(Personaje_Obj);
	}
	
	

}