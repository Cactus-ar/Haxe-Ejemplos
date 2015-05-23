package;

import motion.Actuate;
import openfl.display.Sprite;
import openfl.Lib;
import motion.easing.Cubic;
import motion.easing.Bounce;
import motion.easing.Elastic;
import openfl.filters.BlurFilter;
import openfl.events.KeyboardEvent;

/**
 * 10 Ejemplos con Actuate para manipular tweens.
 * 
 * @author Gabriel
 */

class Main extends Sprite 
{

	
	
	var objeto:Sprite;			//Sujeto de prueba
	
	
	public function new() 
	{
		super();
		
		objeto = new Sprite();
		objeto.graphics.beginFill(0x11F011, 1);
		objeto.graphics.drawRoundRect(0, 0, 100, 100,10,10);
		objeto.graphics.endFill();
		objeto.cacheAsBitmap = true;
		objeto.x = (stage.stageWidth - objeto.width)/2;
		objeto.y = (stage.stageHeight - objeto.height)/2;
		addChild(objeto);
		
		//Teclas 0 a 9 para ver los tweens - 32 reset de posicion
		 Lib.current.stage.addEventListener( KeyboardEvent.KEY_DOWN, TeclaAbajo );
	}


    
    function TeclaAbajo( event: KeyboardEvent ):Void 
    {
            switch( event.keyCode )
			{
				case 32: //Tecla Espacio - Resetea la posicion del objeto
					
					objeto.x = (stage.stageWidth - objeto.width)/2;
					objeto.y = (stage.stageHeight - objeto.height) / 2;
					
                case 48: //Tecla 0
					
					Actuate.tween (objeto, 10, { width:230} );
                            
                case 49: // Tecla 1
					
					Actuate.tween (objeto, 5, { z: 1000 } ).delay (4);
                            
                case 50: // Tecla 2
					
					Actuate.tween (objeto, 5, { alpha: 0 } ).reverse();
                            
                case 51: // Tecla 3
					
					Actuate.tween (objeto, 5, { z: 1000.125 } ).snapping();
				
				case 52: // Tecla 4
				
					Actuate.tween (objeto, 2, { rotation:180 } ).repeat();
					
				case 53: // Tecla 5
					
					Actuate.tween (objeto, 2, { rotationY:180 } ).repeat().reflect();
				
				case 54: // Tecla 6
					
					Actuate.transform (objeto, 3).color (0xFF0000, 0.5).repeat().reflect();
				
				case 55: // Tecla 7
					
					Actuate.tween (objeto, 10, { y: objeto.y + 230 } ).ease (Bounce.easeIn);
				
				case 56: // Tecla 8
					
					Actuate.tween (objeto, 10, { x: objeto.x + 230, y: objeto.y + 230 } ).ease (Elastic.easeInOut);
				
				case 57: // Tecla 9
                    
					Actuate.effects(objeto, 5, true).filter (BlurFilter, { blurX: 10, blurY: 10 });
            }
			
			
    }
}
	
