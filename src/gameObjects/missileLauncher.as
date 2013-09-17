package gameObjects
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Kit van de bunt
	 */
	public class missileLauncher extends Sprite
	{
		public var launcher:MovieClip = new missileLauncherArt2();
		public var rotatTo:int = 90;
		public var rotat:int = 90;
		public var speed:int = 3;
		public function missileLauncher() 
		{
			addChild(launcher)
			launcher.gotoAndStop(90);
		}
		
		public function RotateTo(rot:int):void {
			rotat = rot;
			launcher.gotoAndStop(rotat);
		}
		private var DRotation:Number
		public function loop():void {
			
		}
		
	}

}