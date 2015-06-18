package;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.media.Sound;
import openfl.media.SoundChannel;

/**
 * ...
 * @author Gabriel
 */
class Cargador
{

	public var musica:Sound;
	public var audio_canal:SoundChannel;
	public var fondo:BitmapData;
	
	
	public function new() 
	{
	
		musica = Assets.getSound("snd/tristram.mp3");
		audio_canal = new SoundChannel();
		
		fondo = Assets.getBitmapData("img/fondo.png");
	
		
		
	}
	
}