package;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.events.TimerEvent;
import openfl.utils.Timer;
import Std.random;


/**
 * ...
 * @author Gabriel
 */


 
class Main extends Sprite 
{
	
	private var mascara:Int = 0; // pasa el valor a la clase Npc_alien
	
	private var Nave1:Nave;
	private var Alien1:Npc_alien;
	private var Alien2:Npc_Super;
	private var explota:Explosion;
	private var Misil1:Misil;
	private var Misil_Alien:Misil;
	private var Permite_disparo:Bool;
	private var Tecla_usada:Array<Bool>;
	private var velocidad:Int;
	private var Disparo:Bool;
	private var Sale_Boss:Bool;
	private var Invasion = new Array<Npc_alien>();
	private var orientacion:Bool = true;
	private var Alien_Dispara:Bool;
	private var paso:Int = 0;
	private var temporizador = new Timer (1000);
	private var tempo_1:Int = 0;
	private var tempo_2:Int = 0;
	private var tempo_3:Int = 0;
	
	

	
	public function new() 
	{
		super();
		
		//Variables seteadas al inicio
		Permite_disparo = true;
		Disparo = false;
		Sale_Boss = false;
		Alien_Dispara = false;
		
		
		//Dibujo de nuestra nave
		Nave1 = new Nave();
		Nave1.x = 200;
		Nave1.y = 450;
		velocidad = 3;
		this.addChild(Nave1);
		
		//-----------

		// Dibujo de los marcianos
		var Coordy = 60;
		while (Coordy < 250)
		{
			
			var Coordx = 15;
			while (Coordx < 320)
			{
				
				++paso;
				
				if (paso % 2 == 0) //preguntamos por pares o impares
				{				
					mascara = 2; //si el marciano ocupa una posicion par le damos un color
				}else 
				{
					mascara = 1; //si es impar, le damos otro
				}
				

				
				Alien1 = new Npc_alien(mascara); //obtenemos los datos del padre
				Alien1.x = Coordx;				 //lo ubicamos en pantalla
				Alien1.y = Coordy;
				Invasion.push(Alien1);			 //lo agregamos al array
				this.addChild(Alien1);
				Coordx += 36;					//incrementamos la posicion horizontal en pantalla
				
				
			}		
			Coordy += 40;						//incrementamos la posicion vertical
			
		}
			
		
		// Agregamos el Plato volador
		Alien2 = new Npc_Super();
		Alien2.alpha = 0;
		Alien2.y = 10;
		Alien2.x = 420;
		this.addChild(Alien2);
		
		
		//Nuestro misil
		Misil1 = new Misil();
		Misil1.alpha = 0;
		this.addChild(Misil1);
		
		//Misil del enemigo
		Misil_Alien = new Misil();
		this.addChild(Misil_Alien);
		Misil_Alien.alpha = 0;
		
		
		//La explosion al colisionar objetos.
		explota = new Explosion();
		explota.alpha = 0;
		this.addChild(explota);
		
		
		//Teclado
		Tecla_usada = new Array<Bool>();
		stage.addEventListener(KeyboardEvent.KEY_DOWN, Tecla_Presionada);
		stage.addEventListener(KeyboardEvent.KEY_UP, Tecla_Soltada);
		
		//Timer
        temporizador.addEventListener (TimerEvent.TIMER, Tiempo);
        temporizador.start ();
		
		// Loop
		this.addEventListener(Event.ENTER_FRAME, En_CadaCuadro);
		
		
		
	}
	
	private function En_CadaCuadro(evento:Event):Void {
		
		if (Disparo == true) 			//Disparo de nuestra nave
		{
			Misil1.y = Misil1.y -6;		//velocidad del disparo
			Permite_disparo = false;	//no permite otro hasta que haya salido de la pantalla
			Misil1.alpha = 1;			//visible
			Impacto();					//chequeamos por algun impacto
			
			if (Misil1.y <= 1)			//si llega al borde superior
			{
				Misil1.alpha = 0;		//lo escondemos
				Permite_disparo = true; //Permite disparar otra vez
				Disparo = false;		//flag de control
			}
			
		}
		
		if (Tecla_usada[37]) {	//Movimiento hacia la Izquierda
			
			Nave1.x -= velocidad;
			if (Nave1.x <= 0) {
			Nave1.x = 0;	
			}
		}
		if (Tecla_usada[39]) {	//Movimiento hacia la Derecha
			
			if ((Nave1.x + Nave1.width) >= 380) {
			Nave1.x = 380 -Nave1.width;	
			}
			
			Nave1.x += velocidad;
		}
		if (Tecla_usada[32]) {	//Disparo (espacio)
			
			if (Permite_disparo == true) //si se puede disparar..
			{
				Misil1.x = Nave1.x + 28; //movemos nuestro misil
				Misil1.y = 460;
				Disparo = true;	//chequeamos por colisiones y salidas de pantalla
			}
		}
	
		if (Sale_Boss) 			//Sale la super nave
		{
				
				--Alien2.x;		//va recorriendo la pantalla de derecha a izquierda
				
			 if (Alien2.x < 5)	//si llega al borde izquierdo
			 {
				Alien2.x = 420;		//vuelve al borde derecho
				Sale_Boss = false;	// y espera a que el tiempo llegue a 10
			}
			
		}
	
		if (Alien_Dispara) {			//Disparan los aliens contra nuestra nave
			Misil_Alien.y = Misil_Alien.y + 6;
			Estamos_Muertos();
		}
	}
	
	
	private function Estamos_Muertos()
	{
		if (Misil_Alien.hitTestObject(Nave1)) //Si fuimos impactados..
		{
			explota.x = Nave1.x;
			explota.y = Nave1.y;
			Nave1.alpha = 0;
			explota.alpha = 1;
			Misil1.alpha = 0;
			temporizador.stop();
			stage.removeEventListener(TimerEvent.TIMER, Tiempo);
			stage.removeEventListener(Event.ENTER_FRAME, En_CadaCuadro);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, Tecla_Presionada);
			stage.removeEventListener(KeyboardEvent.KEY_UP, Tecla_Soltada);
			
		}
	}
	
	
	private function Impacto()
	{	
		for (i in 0...Invasion.length) //Recorremos el Array
		{
			if (Invasion[i] != null)
			{
				if (Misil1.hitTestObject(Invasion[i])) //Si existe colision con un marciano
				{
					explota.x = Invasion[i].x;	//si hubo impacto, se muestra la explosion
					explota.y = Invasion[i].y;	//en las coordenadas actuales
					explota.alpha = 1;
					removeChild(Invasion[i]); //Removemos el marciano impactado de la escena
					Invasion.splice(i, 1); // y del Array
					Misil1.alpha = 0;		//escondemos el misil que impactó
					Disparo = false;		//flag de control
					Permite_disparo = true;	//permitimos disparar nuevamente
				
				}
			}
			
		}
		
		if (Misil1.hitTestObject(Alien2))		//si el misil impacta a la supernave
		{
			explota.x = Alien2.x;		//mostramos la explosion
			explota.y = Alien2.y;
			explota.alpha = 1;			//Mostramos la explosion
			Alien2.alpha = 0;			//escondemos la supernave
			Misil1.alpha = 0;			//el misil
			Disparo = false;			//flag de control
			Permite_disparo = true;		//permite disparar nuevamente
		}
		
		
		
	}
	
	 private function Tiempo (event:TimerEvent):Void 
	 {

		 ++tempo_1; 			//contador de segundos para la salida del Boss
		 ++tempo_2;				//contador de segundos para el disparo alien.
		 ++tempo_3;				//contador de segundos para que los alien bajen.
		 
		 explota.alpha = 0;		//Cada segundo esconde la explosion del impacto.
		
		if (tempo_1 == 10)		//Cada 10 segundos sale el otra supernave
		{
			tempo_1 = 0;		//volvemos a contar de 1 a 10 segundos
			Alien2.alpha = 1;
			Sale_Boss = true;
		}
		
		if (tempo_2 == 4)		//cada 4 segundos un alien nos dispara
		{
			var enemigo_disparando = random(Invasion.length); //seleccionamos uno al azar
			Misil_Alien.alpha = 1;
			Misil_Alien.x = Invasion[enemigo_disparando].x + 16; //posicionamos el misil enemigo
			Misil_Alien.y = Invasion[enemigo_disparando].y;		 //en las coordenadas del alien seleccionado
			tempo_2 = 0;
			Alien_Dispara = true;
		}
		
	
		
        for (i in 0...Invasion.length) //Recorremos el Array
		{
					
					if (Invasion[i].x <= 15) //si los alien llegan al borde izquierdo
					{
						orientacion = true;	//hacemos que camibien su movimiento hacia la derecha
						
					}
					if (Invasion[i].x >= 350) //si los alien llegan al borde derecho
					{
						orientacion = false;	//que camienen hacia la izquierda
					}
					
					if (orientacion) //incrementamos el moviemiento hacia un lado o el otro
					{
						Invasion[i].x += 5;
					}else
					{
						Invasion[i].x -= 5;			
					}
					
					if (tempo_3 == 5)		//cada 5 segundos los alien se acercan
					{
						Invasion[i].y = Invasion[i].y + 10;
					}
					
		}
		
				if (tempo_3 == 5) //Si el temporizador llegó a 5 que vuelva a 0
					{
					tempo_3 = 0;	
					}

    }
	
	private function Tecla_Presionada(evento:KeyboardEvent):Void {
		Tecla_usada[evento.keyCode] = true;
	}
	
	private function Tecla_Soltada(evento:KeyboardEvent):Void {
		Tecla_usada[evento.keyCode] = false;
	}

	
}
