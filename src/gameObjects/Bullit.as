package gameObjects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Kit van de bunt
	 */
	
	
	public class Bullit extends Sprite
	{
		[Embed(source = "../img/bullit.png")]
		private var BullitImage:Class;
		private var bullitArt:Bitmap = new BullitImage;
		private var rotationGun:Number;
		private var rotationGunInRadiant:Number;
		private var speed:int = 16;
		private var speedX:Number;
		private var speedY:Number;
		public var desX:int;
		public var desY:int;
		public var distance:Number;
		
		public function Bullit(rot:Number,destinationX:int,destiontionY:int,Distance:Number) 
		{
			distance = Distance;
			desX = destinationX;
			desY = destiontionY;
			rotationGun = rot;
			rotationGunInRadiant = rotationGun * Math.PI / 180;
			bullitArt.x = -3;
			bullitArt.y = -3;
			addChild(bullitArt)
			speedX = this.x + speed * Math.cos(rotationGunInRadiant);
			speedY = this.y + speed * Math.sin(rotationGunInRadiant);
		}
		
		public function loop():void {
			this.x -= speedX;
			this.y -= speedY;
			distance -= speed;
		}
	}
}