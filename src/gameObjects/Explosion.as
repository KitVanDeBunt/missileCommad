package gameObjects
{
	import particles.MCautoRemove;
	/**
	 * ...
	 * @author Kit van de bunt
	 */
	public class Explosion extends MCautoRemove
	{
		public function Explosion() 
		{
			super(new explosionArt());
		}
	}
}

// when I created the code below I didn't have the MCautoRemove class

/*package  
{
	import flash.display.MovieClip;
	
	public class Explosion extends MovieClip
	{
		public var dead:Boolean = false;
		private var explo:explosionArt = new explosionArt();
		public function Explosion() 
		{
			addChild(explo);
		}
		
		public function loop():void {
			if (explo.currentFrame == 21) {
				explo.stop();
				dead = true;
			}
		}
		
	}

}*/