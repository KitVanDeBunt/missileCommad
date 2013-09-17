package physics 
{
	import calc.Calc;
	/**
	 * ...
	 * @author Kit van de bunt
	 */
	public class wind 
	{
		public static var _wind:wind;
		public var windDirection:Number = 0;
		public var windSpeedX:Number = 0.5;
		public var windSpeedY:Number = 0.0;
		
		private var directionTimer:int = 100 * Math.random() +50;
		private var direction:Boolean = true;
		public function wind() 
		{
			_wind = this;
		}
		
		public function Update():void {
			windSpeedX = Calc.getSpeedXFromrotation(windDirection, 2)
			if(directionTimer>0){
				directionTimer--;
			}else {
				directionTimer = 100 * Math.random() + 50;
				if (direction) {
					direction = false;
				}else {
					direction = true;
				}
			}
			if (windDirection < 360) {
				if(direction){
					windDirection += 0.1;
				}else {
					windDirection -= 0.1;
				}
			}else {
				windDirection = 0;
			}
		}
	}
}