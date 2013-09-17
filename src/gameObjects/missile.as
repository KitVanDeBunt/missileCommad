package gameObjects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import physics.wind;
	/**
	 * ...
	 * @author Kit van de bunt
	 */
	public class missile extends Sprite
	{
		[Embed(source = "../img/missileS.png")]
		private var MissileImage:Class;
		private var missileArt:Bitmap = new MissileImage;
		public var spawnPartTimer:int = 10;
		private var speed:Number = Math.random()*2+2
		
		public function missile() 
		{
			missileArt.x = -(missileArt.width/2)
			missileArt.y = -(missileArt.height/2)
			addChild(missileArt);
		}
		
		public function loop():void {
			if (spawnPartTimer > 0) {
				spawnPartTimer--;
			}
			//this.x += 1;
			this.y += speed+wind._wind.windSpeedY;
			this.x += 0+wind._wind.windSpeedX;
		}
		
		public function spawnPartReset():void {
			spawnPartTimer = Math.random() * 4 + 2;
		}
	}

}