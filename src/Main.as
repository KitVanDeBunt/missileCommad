package  
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import gameLayers.Game;
	/**
	 * ...
	 * @author ...
	 */
	public class Main extends Sprite
	{
		private var game:Game;
		public function Main() {
			game = new Game();
			addChild(game);
		}
	}

}