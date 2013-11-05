package factories 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author ...
	 */
	public class BuildingFactory extends Sprite
	{
		private var ranBuilding:int;
		private var building:MovieClip;
		public function createBuilding(xPos:int,yPos:int):MovieClip 
		{
			ranBuilding = Math.random() * 3;
			switch(ranBuilding) {
				case 0:
					building = new BuildingArt0();
					break;
				case 1:
					building = new BuildingArt1();
					break;
				case 2:
					building = new BuildingArt2();
					break;
			}
			building.scaleX = 0.5;
			building.scaleY = 0.5;
			
			building.x = xPos;
			building.y = yPos;
			return building;
		}
		
		
	}

}