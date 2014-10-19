
/*
   Este tutorial es ejecutable. Puede compilarlo y correrlo haciendo 
   uso del compilador Haxe desde el mismo directorio donde se encuentra 
   este archivo con:

   $> haxe -main HaxeVars -Neko variables.n

   Observe las Barras Oblícuas junto a los asteriscos que encierran estos párrafos "/*".
   Nos encontramos dentro de un "Comentario Multilínea".
   Cualquier texto o nota dentro de este párrafo será ignorado por el compilador.

   
   Los comentarios multilínea sirven también para generar documentación 
   estilo javadoc con Haxedoc (esta herramienta es muy básica todavía y simplemente 
   sirve para generar coódigo HTML basado en el XML que le entreguemos).
   Hablaré sobre ella en otro capítulo.
*/

// Dos barras oblícuas sirven para comentarios de una sola línea.


/*
   Debajo de este comentario se encuentra la primer línea de código de 
   nuestro programa en Haxe.
   Simplemente declara un paquete vacío.
   Esta declaración no es estrictamente necesaria cuando no existen otros paquetes
   dentro de nuestro proyecto.
*/

package; // vacío, sin nombres.

/*
   Los paquetes "Packages" funcionan de manera similar a otros lenguajes 
   orientados a objetos. Definen módulos de código agrupados en clases.
   Cada módulo (Ej: operaciones.aritmeticas)

   Cada módulo debe estar expresado en minúsculas, y la estructura de 
   directorios debe existir (y coincidir) con la clase a la cual queremos 
   invocar en su interior.

   Los nombres de las clases (y el tipo) deben comenzar con mayúsculas,
   por ejemplo: operaciones.aritmeticas.Suma.
   la estructura de directorios para el ejemplo debería ser
   /operaciones/aritmetica/Suma.hx, el cual debe tener permisos suficientes 
   para que el compilador pueda acceder sin problemas.
   
   Para importar codigo de archivos externos, primero hay que declararlo antes
   que el resto del código. Las librería de haxe proveen una gran variedad de 
   clases como para empezar.
*/

import haxe.ds.ArraySort;

// Pueden importarse tantas clases/modulos como se quiera al mismo tiempo con "*"

import haxe.ds.*;

/*
   También pueden importarse ciertas clases en un modo especial, permitiendo
   extender la funcionalidad de otras clases. una especie de mezcla o "mixin"
   Más abajo seguimos con este tema.
*/

using StringTools;

/*
   Typedefs se utiliza como con variables pero para tipos.
   Deben estar declaradas antes de cualquier código.
   Más abajo seguimos con el tema.
 */

typedef UnaCadena = String;


// Typedefs también puede referirse a tipos "estructurales", más sobre esto abajo.

typedef UnObjeto = { variable: String };

/*
   Por fin la definición de la Clase. Es la principal, y nos damos cuenta ya que
   tiene el mismo nombre que el archivo (HaxeVars).
*/

class HaxeVars{
    /*
       El Punto de entrada, comienzo de nuestro código, etc..debe declararse en 
       una función estática principal y especificarle la clase al compilador en sus
       argumentos.
       En este ejemplo, le hemos pasado al compilador que el punto de entrada
       es nuestra clase "HaxeVars".
     */

    static function main(){

        /*
           Trace es el método por defecto de salida que usa Haxe para mostrar
           cosas por pantalla. Los diferentes lenguajes objetivos pueden dirigir
           su salida con métodos distintos. Por ejemplo: Java, C++, C#, neko, etc.
           imprimen con el método stdout. 
           JavaScript imprimirá en la consola y Flash embeberá su salida en un 
           campo de texto (enorme en este ejemplo).

	   Cada sentencia o método trace es mostrado con el siguiente formato:
           
           Prueba.hx:11: Hola Mundo!
           
           donde Prueba.hx es nuestro programa ejecutándose, :11, es la línea actual
           y por último la salida (Hola Mundo!)
           
           No hace falta indicar el fin de línea (o nueva) con el método Trace           


	   Finalmente, es posible esconder la salida de Trace con un simple
           argumento en el compilador: "--no-traces" (sin comillas claro).
         */

        trace("Hola Mundo, con trace()!");

        /*
           Trace puede manejar cualquier tipo de valor u objeto.
           Intentará de imprimir una representación de la expresión dada
           lo mejor que pueda.

           Permite enlazar o concatenar cadenas con el operador más "+"
         */

        trace( "Entero: " + 10 + " Flotante: " + 3.14 + " Logico: " + true);

        /*

           Con Haxe se requiere separar las expresiones del mismo bloque con
           punto y coma ";" pero, puede escribirse más de una expresión por línea.


         */

        trace('tres expresiones..'); trace('en una linea'); trace('de ejemplo');


        //////////////////////////////////////////////////////////////////
        // Variables y sus tipos
        //////////////////////////////////////////////////////////////////
    
        trace("*--*--* Variables y sus diferentes tipos *--*--*");

        /*
           Pueden asignarse valores y referencias a estructuras de datos
           por medio de la sentencia "var"
        */

        var un_entero:Int = 1;
        trace(un_entero + " es el valor de un_entero");


        /*
           Haxe es un lenguaje estrictamente tipificado, por ese motivo
           "un_entero" fue declarada una variable tipo "Int". El resto
           de la expresión simplemente le asigna o guarda en ella su valor,
           que en este caso es un "1"           
 
           En ciertos casos no es necesario declarar el tipo ya que el compilador puede
           "intuir" de que tipo de variable se trata.
	   
	   Más abajo tenemos la vartiable otro_entero sin declarar que el compilador
           interpreta que debería ser del tipo Int
         */

        var otro_entero = 2;
        trace(otro_entero + " es el valor de otro_entero");

        // El método $type() muestra que tipo ha asignado el compilador a nuestra variable

        $type(otro_entero);

        // Los enteros pueden estar asignados en hexadecimal:

        var hex_entero = 0xffffff;
        trace(hex_entero + " es el valor de hex_entero");

        /*
           La precesión de enteros y numeros con punto flotante va a depender
           de la plataforma en la cual vayamos a correr nuestro programa.
           Del mismo modo, haxe va a tratar los desbordamientos (overflow)
	   Es posible manipular estos comportamientos (o forzarlos) con
           la utilización de librerías específicas.
         */


        /*
	
           Además de las simples asignaciones de tipos como enteros, 
           flotantes o lógicos, Haxe provee con su librería estandard
           implementaciones para la construcción de estructuras comunes
           de datos como ser cadenas, colecciones, listas y mapas

         */

        var una_cadena = "soy una" + 'cadena de caracteres';  

        // Las cadenas pueden ser construidas con comillas simples o dobles.

        trace(una_cadena + " es el contenido de una_cadena");


        /*
           Las cadenas pueden ser interpoladas con solo insertar variables
           en posiciones específicas.
           La cadena debe estar entre comillas simples y la variable debe
           ser precedida por el signo pesos "$"
           Pueden contruirse expresiones en bloques encerradas dentro de
           llaves ${...}

         */


        var x = 1;
        var una_cadena_interpolada = 'El valor de x es $x';
        trace (una_cadena_interpolada);
        var otra_cadena_interpolada = 'El valor de x + 1 es ${x + 1}';
        trace (otra_cadena_interpolada);


        /*

           Los objetos tipo cadena son inmutables, cualquier método o referencia nos
           devolverá una copia de una parte o de toda la cadena.
           (Ver también la clase StringBuf).

         */
        var una_sub_cadena = una_cadena.substr(0,4);
        trace(una_sub_cadena + " es el valor para una_sub_cadena");

        /*
           Las expresiones regulares (abreviadas Regexes) están soportadas pero,
           no es el objetivo de este programa extenderse con mucho detalle sobre ellas. 

         */
        trace((~/expresion/.match('exp')) + " es el valor para (~/expresion/.match('exp')))");

        /*
           Los índices de las matrices o arrays en Haxe comienzan en 0 (zero-indexed),
           Son dinámicas y Mutables.
           Los valores no declarados son definidos como nulos (null)
 
         */
        var a = new Array<String>(); // una matriz que contiene cadenas
        a[0] = 'Gabriel';
        trace(a.length + " es el valor de a.length");
        a[9] = 'Ceravolo';
        trace(a.length + " es el valor para a.length (Luego de modificado)");
        trace(a[3] + " es el valor para a[3]"); //null o nulo

        /*
           Las matrices son construidas de forma "generica", así que somos nosotros
           los que debemos indicarle que tipo de dato contendrán.

         */

        var a2 = new Array<Int>(); // Una matriz de enteros(Int)
        var a3 = new Array<Array<String>>(); // Un arreglo de Matrices (que aloja cadenas).

        /*

           Mapas son estructuras clave/valor muy simples.
           La clave y el valor pueden ser de cualquier tipo.
         */

        var m = new Map<String, Int>();  // Las claves son cadenas, los valores enteros.
        m.set('clave', 4);

        // Puede con ellos utilizarse la misma notación que con los arreglos de matrices;

        m['clave2'] = 5;
        trace(m.exists('clave2') + " tiene como valor m.exists('clave2')");
        trace(m.get('clave2') + " es el valor de m.get('clave2')");
        trace(m['clave2'] + " es el valor para m['clave2']");

        var m2 =  ['clave' => 4, 'dos' => 6]; // Sintaxis alternativa
        trace(m2 + " es el valor de m2");

        /*
           Recuerde siempre que puede inferir en el tipo de arreglo.
           Haxe asignará el tipo de variable la primera vez que ud. le pase
           un argumento que se acomode a uno de los distintos tipos.

         */

        var m3 = new Map();
        m3.set(6, 'jose'); // m3 es ahora un mapa del tipo <Int,String> (enteros, cadenas)
        trace(m3 + " es el valor para m3");

        /*
           HAxe maneja muchas mas estructuras de datos definidas en el módulo haxe.ds
           como ser List, Stack y BalancedTree.
           Pero ello es materia de otro artículo.
         */
	}

}