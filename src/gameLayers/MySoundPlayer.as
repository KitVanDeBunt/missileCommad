package gameLayers 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	/**
	 * ...
	 * @author Kit van de Bunt
	 */
	public class MySoundPlayer extends Sprite
	{
		[Embed(source = "../sound/Track1.mp3")]
		public var Track_1:Class;
		
		public var track_1:Sound = new Track_1();
		
		public var musicChannal1:SoundChannel = new SoundChannel();
		
		public function MySoundPlayer():void {
			//playTrack1();
		}
		
		public function playTrack1():void {
			musicChannal1 = track_1.play(); 
			musicChannal1.addEventListener(Event.SOUND_COMPLETE, replayTrack1);
		}
		
		public function replayTrack1():void {
			musicChannal1 = track_1.play();
		}
		
		public function stopPlayBack():void {
			musicChannal1.stop();
			musicChannal1.removeEventListener(Event.SOUND_COMPLETE, replayTrack1);
		}
	}

}