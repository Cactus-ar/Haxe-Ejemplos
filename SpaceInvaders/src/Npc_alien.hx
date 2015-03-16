package;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.BitmapData;
/**
 * ...
 * @author Gabriel
 */
class Npc_alien extends Sprite
{

	var lienzo1: BitmapData;
	
	public function new(mascara) //Esperando el valor 1 o 2
	{
		
		
		if (mascara == 1) {
		lienzo1 = Assets.getBitmapData("img/alien1y.png");	//Si es 1..el proximo hijo (child) creado 
		}													//tendrá asignado esta imagen
		
		if (mascara == 2) {
		lienzo1 = Assets.getBitmapData("img/alien1x.png");	//Si es 2...asigna esta
		}
		
		super();
		this.graphics.beginBitmapFill(lienzo1);
		this.graphics.drawRect(0, 0, 32, 32);			//El rectángulo dibujado coincide con
														//el tamaño de la imágen (32x32)
	}
	
}