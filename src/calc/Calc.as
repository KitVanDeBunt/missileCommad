package calc
{
 public class Calc 
 {
	//Get next X coord, params: old posX, direction, speed
	public static function getNextX(x:Number, d:Number, s:Number):Number
	{
		return x + (s * Math.cos(d * Math.PI / 180.0));
	}

	//Get next Y coord, params: old posX, direction, speed
	public static function getNextY(y:Number, d:Number, s:Number):Number
	{
		return y + (s * Math.sin(d * Math.PI / 180.0));
	}

	//Get distance between 2 points
	public static function getDistance(x1:Number, y1:Number, x2:Number, y2:Number):Number
	{
		return Math.sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
	}

	//Get degree from second point (p1 to p2)
	public static function getDegreeFromPoint(x1:Number, y1:Number, x2:Number, y2:Number):Number
	{
		return Math.atan2((y2 - y1), (x2 - x1)) * 180 / Math.PI;
	}
  
	public static function getSpeedXFromrotation(r:Number, speed:Number):Number{
		return speed * Math.cos(r);
	}
	 
	public static function getSpeedYFromrotation(r:Number, speed:Number):Number{
		return speed * Math.sin(r);
	}
}
}