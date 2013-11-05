package systems {
	import components.PhysicsComponent;
	import components.PositionComponent;
	/**
	 * @author kit van de bunt
	 */
	public class DragSystem extends System {
		
		public static const DRAG : Number = 0.005;
		
		override public function update():void{
			for each( var target:Entity in targets ){
				if (target.get(PhysicsComponent)){
					var dragX:Number = 0;
					var dragY:Number = 0;
					
					var tarPhs = target.get(PhysicsComponent) as PhysicsComponent;
					var velosityX:Number = tarPhs.velocityX;
					var velosityY:Number = tarPhs.velocityY;
					dragX = velosityX * DRAG;
					dragY = velosityY * DRAG;
					target.get(PhysicsComponent).velocityX -= dragX;
					target.get(PhysicsComponent).velocityY -= dragY;
					//trace(dragX, dragY);
				}
			}
		}
		
	}
}
