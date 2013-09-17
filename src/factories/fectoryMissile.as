package factories 
{
	import flash.display.Sprite;
	import gameObjects.missile;
	/**
	 * ...
	 * @author Kit van de bunt
	 */
	public class fectoryMissile extends Sprite
	{
		private var missleVar:missile;
		public function fectoryMissile()
		{
			
		}
		
		public function createFectoryMissile(xpos:int,ypos:int):missile 
		{
			missleVar = new missile();
			missleVar.x = xpos;
			missleVar.y = ypos;
			return missleVar;
		}
		
	}

}