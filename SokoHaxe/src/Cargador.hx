package;
import haxe.xml.Fast;
import openfl.Assets;
import Std;
/**
 * ...
 * @author Gabriel
 */

 
class Cargador
{
	var archivo = Assets.getText("lvl/Original.slc");
	public var Hileras = new Array();
	public var Ancho: Int;
	
public function new() 
{	
}	

	public function Niveles(lvl_numero:Int)
	{
		
		var contenido = Xml.parse(archivo);
		var fasta = new Fast(contenido.firstElement());
		var Nivel:Int = 0;
		
		var Hilera:Int = 0;
		
		for (Nivel in fasta.node.LevelCollection.elements)
		{
		
			if (lvl_numero == Std.parseInt(Nivel.att.Id)) {
				//trace (Nivel.att.Id);
				Ancho = Std.parseInt(Nivel.att.Width); //Retorna el ancho del mapa para centrarlo
				
				for (Hilera in Nivel.elements)
				{
					Hileras.push(Hilera.innerData);	
				}	
				
			}
			Nivel.elements.next;
			
			
		}
		return Hileras;
		
	}


	
	
}