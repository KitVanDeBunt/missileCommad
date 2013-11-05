package factories.drawObjects 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author ...
	 */
	public class Ball extends Sprite
	{
		
		public function Ball(radius:Number ,color:int) 
		{
			graphics.lineStyle(2, color);
			graphics.drawCircle(0, 0, radius);
		}
		
	}

}