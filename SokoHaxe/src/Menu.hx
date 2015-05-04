package;
import openfl.display.Sprite;
import openfl.Lib;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.Theme;




/**
 * ...
 * @author Gabriel
 */
class Menu extends Sprite
{

	private var Opcion:String = "";
	private var Argumento:String = "";
	
	public function new() 
	{
		
		super();
		UIBuilder.setTheme('ru.stablex.ui.themes.android4');
		UIBuilder.init();
        Lib.current.addChild( UIBuilder.buildFn('assets/Ui/Menu.xml')() );
    }
		
	function Menu_Opciones(Opcion):Void
	{
		
		switch (Opcion) 
		{
			case "Nuevo" : trace ("Seleccion Nuevo");
			
			case "Niveles" : trace ("Seleccion Niveles");
			
			case "Opciones" : trace ("Seleccion opciones");
			
				
		} 
		
	}
	
		
}