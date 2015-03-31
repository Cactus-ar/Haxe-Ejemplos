package;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.Assets;
import spritesheet.Spritesheet;
import spritesheet.importers.SparrowImporter;
import spritesheet.AnimatedSprite;
import spritesheet.data.BehaviorData;
import openfl.events.Event;

/**
 * ...
 * @author Gabriel
 */

class Main extends Sprite 
{
	
	var lastTime:Int = 0;
	var datos = Assets.getText("img/mostri.xml");
	var dino_ani:AnimatedSprite; 
	
	public function new() 
	{
		super();
		var dino:Spritesheet = SparrowImporter.parse(datos, "img");
		
		dino.addBehavior(new BehaviorData("parado", [0, 1, 2, 3, 2, 1], true, 5));
		
		
		
		dino_ani = new AnimatedSprite(dino, true);
		dino_ani.showBehavior("parado");
		addChild(dino_ani);
		
		dino_ani.x = stage.stageWidth / 2 - dino_ani.width / 2;
		
		dino_ani.y = stage.stageHeight / 2 - dino_ani.height / 2;
		
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		
		
	}
	
	
	public function onEnterFrame(e:Event):Void
	{
	  var delta = Lib.getTimer() - lastTime;
	  
	  dino_ani.update(delta);
	  
	  lastTime = Lib.getTimer();
	}
}
