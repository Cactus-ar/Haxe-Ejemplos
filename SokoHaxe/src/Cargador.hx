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
	
public function new() 
{	
}	

	public function Niveles(lvl_numero:Int)
	{
		
		var contenido = Xml.parse(archivo);
		var fasta = new Fast(contenido.firstElement());
		var Nivel:Int = 0;
		
		for (Nivel in fasta.node.LevelCollection.elements)
		{
			
			var mapa = fasta.node.LevelCollection.node.Level.elements;
			var Hilera:Int = 0;
			
			if (lvl_numero == Std.parseInt(Nivel.att.Id)) {
				trace (Nivel.att.Id);
				for (Hilera in mapa)
				{
					Hileras.push(Hilera.innerData);
					//trace (Hilera.innerData);
				}	
			}
		}
		return Hileras;
	}


	
	
}