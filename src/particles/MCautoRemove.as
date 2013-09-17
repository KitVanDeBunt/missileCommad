package particles 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Kit van de bunt
	 */
	public class MCautoRemove extends MovieClip
	{
		private var clip:MovieClip;
		private var totalframe:int;
		public var dead:Boolean = false;
		private var lifeTime:int; 
		public function MCautoRemove(MC:MovieClip) 
		{
			clip = MC;
			addChild(clip);
			lifeTime = clip.totalFrames;
			clip.stop();
		}
		
		public function loop():void {
			if (clip.currentFrame >= lifeTime) {
				dead = true;
			}else {
				clip.gotoAndStop(clip.currentFrame + 1);
			}
		}
		
	}
}