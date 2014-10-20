
/*
   Este tutorial es ejecutable. Puede compilarlo y correrlo haciendo 
   uso del compilador Haxe desde el mismo directorio donde se encuentra 
   este archivo con:

   $> haxe -main HaxeOper -Neko operadores.n

*/


package;


import haxe.ds.*;

using StringTools;


class HaxeOper{

    static function main(){

        //////////////////////////////////////////////////////////////////
        // Operadores
        //////////////////////////////////////////////////////////////////

        trace("*-*-* Operadores *-*-*");

        // Aritméticos Básicos

        trace((4 + 3) + " es el resuldado de (4 + 3)");
        trace((5 - 1) + " es el resuldado de (5 - 1)");
        trace((2 * 4) + " es el resuldado de (2 * 4)");
        trace((8 / 3) + " es el resuldado de (8 / 3) (Las divisiones siempre producen números flotantes)");
        trace((100 % 4) + " es el resuldado de (100 % 4)");


        //Comparación

        trace((3 == 2) + " es el resuldado de 3 == 2");
        trace((3 != 2) + " es el resuldado de 3 != 2");
        trace((3 >  2) + " es el resuldado de 3 > 2");
        trace((3 <  2) + " es el resuldado de 3 < 2");
        trace((3 >= 2) + " es el resuldado de 3 >= 2");
        trace((3 <= 2) + " es el resuldado de 3 <= 2");

        // Operadores Lógicos (bit a bit)
        /*

        ~       Complemento unario
        <<      Desplazamiento a la Izquierda
        >>      Desplazamiento a la Derecha
        >>>     Desplazamiento sin signo (derecha)
        &       Comparador AND
        ^       Comparador XOR
        |       Comparador OR

        */

        // Operadores de incremento y decremento

        var z = 0;

        trace("Incrementos and decrementos");

        trace(z++); //i = 1. Post-Incrementa
        trace(++z); //i = 2. Pre-Incrementa
        trace(z--); //i = 1. Post-Decrementa
        trace(--z); //i = 0. Pre-Decrementa


	}

}