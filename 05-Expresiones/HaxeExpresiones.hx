/*
   Este tutorial es ejecutable. Puede compilarlo y correrlo haciendo 
   uso del compilador Haxe desde el mismo directorio donde se encuentra 
   este archivo con:

   $> haxe -main HaxeExpresiones -Neko expresiones.n

*/


package;


import haxe.ds.*;

using StringTools;



class HaxeExpresiones{

	    static function main(){

        //////////////////////////////////////////////////////////////////
        // Expresiones
        //////////////////////////////////////////////////////////////////
        trace("*-*-* EXPRESSIONES *-*-*");

        /*
           Con Haxe pueden construirse estructuras de control muy potentes
           ya que cada una puede ser tratada como una expresión. Ejemplo:
        */

        // con la instrucción If

        var k = if (true){
            12;
        } else {
            30;
        }

        trace("K equivale a ", k); // equivale a 12

        var mi_gato = "Coco";
	var otro_juguete_favorito = "";

        var otro_juguete_favorito = switch(mi_gato) {
            case "fido" : "Pato";
            case "Coco"  : "Raton";
            case "spot" : "Pelota";
            default     : "otro juguete";
        }

        trace("Mi gato se llama " + mi_gato
                + ", y su otro juguete favorito es: "
                + otro_juguete_favorito);

        //////////////////////////////////////////////////////////////////
        // Conversión de tipos
        //////////////////////////////////////////////////////////////////

        trace("*-*-* CONVERSION DE TIPOS *-*-*");

        // Se pueden convertir cadenas en enteros con bastante facilidad.

        // cadenas a enteros

        var ejemplo = Std.parseInt("0");
	trace (ejemplo);


        // cadenas a coma flotante

        var ejemplo = Std.parseFloat("0.4");
	trace (ejemplo);	


        // entero a cadena

        var ejemplo = Std.string(0);
	trace (ejemplo);


        // concatenar algo con cadenas directamente convierte a texto

        trace (0 + "");

        trace (true + "");


        // Consulte la documentación de instrucción Std para más detalles


        //////////////////////////////////////////////////////////////////
        // Manejando tipos
        //////////////////////////////////////////////////////////////////

        /*
	   Como lo mencioné en otro ejemplo, Haxe es un lenguaje fuertemente
	   tipificado. Eso es algo muy bueno en un lenguaje ya que elimina
           errores en tiempo de compilación y hace que el compilador funcione
           mucho más rápido.

           Sin embargo, en algunos casos, los programadores queremos que
           el compilador nos de cierta "soltura" o que "haga la vista gorda"
           y no produzca un error para algunas cosas.

	   Haxe tiene dos instrucciónes para hacer esto; La Primera es
           el tipo "Dynamic" (Dinámica)
         */

        var algo: Dynamic = "una variable con un tipo no declarado";


        /*
            Todo lo que usted sabe con certeza con una variable dinámica es que el
            compilador ya preocupará por qué tipo es. 
            Es como una variable de comodín: Puede pasar por cualquier tipo de variable,
            y usted puede asignar cualquier tipo de dato.


            La otra opción, un poco más exptrema, es "untyped":
         */

            untyped {
                var x:Int = 'cosa'; // Esto no puede estar bien!
                var y:String = 4;   // que locura!
		var z:Float = x + " " + y; //Imposible que compile!!!

		trace (z);
            }


        /*

	La palabra clave "untyped" (sin tipo) funciona con bloques enteros de código,
        saltándose todas las comprobaciones de tipo que podrían ser necesarias
        con un bloque de código tradicional.

        Esta palabra clave debe ser utilizada con moderación, o cuando se queira trabajar
        de forma mas holgada como expliqué anteriormente.

        En general, omitir los tipos de variables no es aconsejable. 
        Utilice la enumeración, la herencia, o los modelos de tipo estructural con el fin
	de ayudar a garantizar la exactitud de su programa.
         */

	}
}