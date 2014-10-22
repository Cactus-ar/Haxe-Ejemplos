/*
   Este tutorial es ejecutable. Puede compilarlo y correrlo haciendo 
   uso del compilador Haxe desde el mismo directorio donde se encuentra 
   este archivo con:

   $> haxe -main HaxeControl -Neko controles.n

*/


package;


import haxe.ds.*;

using StringTools;


class HaxeControl{

	    static function main(){

        //////////////////////////////////////////////////////////////////
        // Estructuras de Control
        //////////////////////////////////////////////////////////////////

        trace("*-*-* Estructuras de Control *-*-*");

        // Condicionales If

        var j = 10;
        if (j == 10){
            trace("Esto se Imprime");
        } else if (j > 10){
            trace("No es mayor a 10, no se imprime");
        } else {
            trace("tampoco se imprime.");
        }

        // Haxe soporta condicionales ternarios:

        (j == 10) ?  trace("equivale a 10") : trace("distinto de 10");

        /*
           Finalmente, existen otro tipo de condicionales que son usados
           cuando haxe compila:  Condicionales de compilación.
         */

	#if neko
        	trace('Hola desde Neko');
	#elseif js
        	trace('Hola desde Javascript');
	#else
        	trace('Hola de cualquier otra plataforma');
	#end
        
	/*
           La salida del compilador dependerá del los parámetros que le hayamos
           indicado.  
         */


        trace("Bucles e Iteradores");

        // Básico tipo while-loop

        var k = 0;

        while(k < 5){

             trace(k); // Imprimirá del 0 al 4

            k++;
        }


        // Tipo do-while-loop

        var  l = 0;
        do{
            trace("Este tipo se ejecuta al menos una vez");
        } while (l > 0);

       
	 //Bucles tipo For

        /*
            No hay bucles estilo lenguaje c en Haxe, ya que son propensos
            al error y no son necesarios. En lugar de ello, Haxe tiene un método mucho 
            más simple y segura que utiliza iteradores.
         */

        var m = [1,2,3];
        for (val in m){
            trace(val + " es el valor para la cadena m");
        }

        // Puede usarse como iterador el índice de rango


        var n = ['Carlos', 'Jose', 'Pato'];
        for (val in 0...n.length){
            trace(val + " es el valor de val (el indice de m)");
        }


        trace("Comprensiones con Matrices");

        // Las comprensiones en las matrices nos dan la habilidad de iterar sobre ellas
        // mientras creamos filtros y modificaciones.

        var filtrada_n = [for (val in n) if (val != "Jose") val];
        trace(filtrada_n + " es el valor para filtrada_n");

        var modificada_n = [for (val in n) val += '!'];
        trace(modificada_n + " es el valor para modificada_n");

        var filtrada_y_modificada_n = [for (val in n) if (val != "Pato") val += "!"];
        trace(filtrada_y_modificada_n + " es el valor de filtrada_y_modificada_n");

        //////////////////////////////////////////////////////////////////
        // Instruccion Switch (Por tipos de valor asignado)
        //////////////////////////////////////////////////////////////////
        trace("*-*-* Instrucción Switch *-*-*");

        /*
           La instrucción Switch en Haxe es muy potente. Además de trabajar con
           valores basicos como cadenas o enteros, tambien pueden trabajar sobre
           tipos de datos algebraicos generales en estructuras tipo enum
	   Aquí un ejemplo basico:

         */
        var nombre_de_mi_gato = "Cactus";
        var juguete_favorito  = "";

        switch(nombre_de_mi_gato){

            case "Michi"   : juguete_favorito = "Pescadito";
            case "Cactus"  : juguete_favorito = "Pelota";
            case "Dot"     : juguete_favorito = "Raton";
            default        : juguete_favorito = "Algun otro juguete";
 
           // case _       : "Algun otro juguete";
        }

        // El  "case_" es el valor "comodin"
        // que coincidirá con cualquier cosa

        trace("Mi gato se llama " + nombre_de_mi_gato
                + ", y su juguete favorito es: "
                + juguete_favorito);

	}
}