/*
   Este tutorial es ejecutable. Puede compilarlo y correrlo haciendo 
   uso de Lime desde el mismo directorio donde se encuentra 
   este archivo con:

   Para poder compilar, necesita instalar las librerías de HaxeUI

   $> haxelib install haxeui


   $> lime test flash

*/

package;
 
import haxe.ui.toolkit.core.Macros;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.events.UIEvent;
  
class Hola {
    public static function main() {
        Macros.addStyleSheet("styles/gradient/gradient.css");
        Toolkit.init();
        Toolkit.openFullscreen(function(root:Root) {
            var button:Button = new Button();
            button.text = "Presona Aquí!";
            button.x = 100;
            button.y = 100;
            button.onClick = function(e:UIEvent) {
                e.component.text = "Perfecto!";
            };
            root.addChild(button);
       });
    }
}