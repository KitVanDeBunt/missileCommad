package factories 
{
	import adobe.utils.CustomActions;
	import components.DisplayComponent;
	import components.PositionComponent;
	import components.PhysicsComponent;
	import factories.drawObjects.Ball;
	/**
	 * ...
	 * @author Kit van de Bunt
	 */
	public class BallFactory 
	{
		
		public function BallFactory() 
		{
			
		}
		
		public  function makeBall() : Entity
		{
			
			var display	:	DisplayComponent		=	new DisplayComponent();
			display.view 							=	new Ball(2, 0x000000);
			
			var position	:	PositionComponent	=	new PositionComponent();
			position.x								=	(Math.random() * (Main.stageWidth-700)) +350;
			position.y								=	(Math.random() * (Main.stageHeight-700)) +350;
			
			var physics	:	PhysicsComponent		=	new PhysicsComponent();
			physics.velocityX						=	0//Math.random() * 2 - 1;
			physics.velocityY						=	0//Math.random() * 2 - 1;
			physics.mass							=	500000;// * Math.pow(10, 4);
			
			var ball	:	Entity					=	new Entity();
			
			ball.add(display);
			ball.add(position);
			ball.add(physics);
			
			
			return ball;
		}
		
	}

}