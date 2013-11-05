package 
{
	import adobe.utils.CustomActions;
	import components.DisplayComponent;
	import components.PositionComponent;
	import components.PhysicsComponent;
	import factories.BallFactory;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import systems.DragSystem;
	import systems.GravitySystem;
	import systems.MovementSystem;
	import systems.RenderSystem;

	public class Main extends Sprite
	{
		private var _engine	:	Engine;
		public static var stageWidth:int;
		public static var stageHeight:int;
		public function Main()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void {
			stageWidth = stage.stageWidth;
			stageHeight = stage.stageHeight;
			
			// we maken als eerste de engine aan. Deze is het belangrijkste
			_engine	=	new Engine();
			
			// vervolgens initieren wij de systemen
			// dit doen we door ze toe te voegen aan de engine
			_engine.addSystem(new GravitySystem());
			_engine.addSystem(new MovementSystem());
			_engine.addSystem(new RenderSystem());			
			_engine.addSystem(new DragSystem());			
			
			var ballFactory	:	BallFactory	=	new BallFactory();
			
			for (var i : int = 0; i < 60; i++)
			{
				var ball : Entity	=	ballFactory.makeBall();
				//ball.add(collision);
				addChild(ball.get(DisplayComponent).view);
				// registreer de auto bij de engine zodat de game ook gaat werken
				_engine.addEntity(ball);
			}
			// start het updaten van het spel
			stage.addEventListener(Event.ENTER_FRAME, updateEngine);	
		}
		
		private function updateEngine(e : Event) : void
		{
			_engine.update();
		}
	}
}
