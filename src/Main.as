package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import gameLayers.Game;
	import flash.ui.Mouse;
	import menu.StartMenu;
	import gameLayers.MySoundPlayer;
	/**
	 * ...
	 * @author ...
	 */
	
	public class Main extends Sprite
	{
		[Embed(source = "img/croshair.png")]
		private var Cross:Class;
		private var cross:Bitmap;
		
		private var game:Game;
		private var startMenu:StartMenu;
		private var displayLayer:Sprite = new Sprite();
		private var mouseLayer:Sprite = new Sprite();
		
		private var gameStarted:Boolean = false;
		
		public static var _main:Main;
		public var stageWidth:int;
		public var stageHeight:int;
		public var mySoundPlayer:MySoundPlayer = new MySoundPlayer();
		
		public function Main() {if (stage) init();
            else addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(e:Event = null):void 
        {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_main = this;
			stageWidth = stage.stageWidth;
			stageHeight = stage.stageHeight;
			Mouse.hide();
			
			addChild(displayLayer);
			addChild(mouseLayer);
            
			cross =new Cross();
			cross.x = mouseX - cross.width/2;
			cross.y = mouseY - cross.height / 2;
			mouseLayer.addChild(cross);
			mouseLayer.mouseEnabled = mouseLayer.mouseChildren = false;
			
			addEventListener(Event.ENTER_FRAME, loop);
			loadStartMenu();
		}
		
		private function loop(e:Event):void {
			cross.x = mouseX - cross.width/2;
			cross.y = mouseY - cross.height/2;
		}
		
		private function loadStartMenu():void {
			startMenu = new StartMenu();
			displayLayer.addChild(startMenu);
		}
		
		
		public function loadGame(m:MouseEvent):void {
			RemoveAll();
			if(!game){
				game = new Game();
				//game.rotationX = -10;
				//game.z = +100;
				displayLayer.addChild(game);
				gameStarted = true;
				mySoundPlayer.playTrack1();
			}
		}
		
		public function endgame():void {
			RemoveAll();
			loadStartMenu();
		}
		
		private function RemoveAll():void {
			if (game) {
				game.removeEvents();
                displayLayer.removeChild(game);
                game = null;
				trace("end game");
				mySoundPlayer.stopPlayBack();
            }
			if (startMenu) {
				startMenu.removeEvents();
                displayLayer.removeChild(startMenu);
                startMenu = null;
				trace("remove startMenu");
            }
		}
	}

}