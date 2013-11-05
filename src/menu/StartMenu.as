package menu 
{
	import flash.display.Sprite;
	import utils.Button;
	import flash.events.MouseEvent;
	import flash.display.StageDisplayState;
	/**
	 * ...
	 * @author Kit van de Bunt
	 */
	public class StartMenu extends Sprite
	{
	
		private var startButton:Button;
		private var fullScreenButton:Button;
		
		public function StartMenu() 
		{
			startButton = new Button("Start",0xffffff,0x000000,0xffffff,0xff0000,0x000000,0xff0000,0x00ffff,0x000000,0x00ffff);
			startButton.x = Main._main.stageWidth / 2;
			startButton.y = Main._main.stageHeight / 2;
			addChild(startButton);
			
			fullScreenButton = new Button("FullScreen",0xffffff,0x000000,0xffffff,0xff0000,0x000000,0xff0000,0x00ffff,0x000000,0x00ffff);
			fullScreenButton.x = Main._main.stageWidth / 2;
			fullScreenButton.y = (Main._main.stageHeight / 2)+30;
			addChild(fullScreenButton);
			
			startButton.addEventListener(MouseEvent.MOUSE_UP, Main._main.loadGame);
			fullScreenButton.addEventListener(MouseEvent.MOUSE_UP, toggleFullScreen);
		}
		
		public function removeEvents():void
		{
			startButton.removeEventListener(MouseEvent.MOUSE_UP, Main._main.loadGame);
			fullScreenButton.removeEventListener(MouseEvent.MOUSE_UP, toggleFullScreen);
		}
		
		private function toggleFullScreen(m:MouseEvent):void 
		{
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}
	}

}