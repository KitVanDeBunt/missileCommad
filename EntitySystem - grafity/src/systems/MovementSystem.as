package systems {
	import components.PhysicsComponent;
	import components.PositionComponent;
	/**
	 * @author berendweij
	 */
	public class MovementSystem extends System {
		
		override public function update():void
		{
			// in deze update staat de logica om de objecten te laten bewegen
			for each( var target:Entity in targets )
			{
				// aangezien we door alle targets heen loopen moeten we ook kijken of deze target wel de components
				// die wij nodig hebben
				if (target.get(PositionComponent) && target.get(PhysicsComponent))
				{
					if(target.get(PositionComponent).x < 10){
						target.get(PhysicsComponent).velocityX	= Math.abs(target.get(PhysicsComponent).velocityX);
					}else if(target.get(PositionComponent).x > Main.stageWidth-10){
						target.get(PhysicsComponent).velocityX	= -Math.abs(target.get(PhysicsComponent).velocityX); 
					}
					
					if(target.get(PositionComponent).y < 10){
						target.get(PhysicsComponent).velocityY	= Math.abs(target.get(PhysicsComponent).velocityY);
					}else if(target.get(PositionComponent).y > Main.stageHeight-10){
						target.get(PhysicsComponent).velocityY	= -Math.abs(target.get(PhysicsComponent).velocityY); 
					}
					
					// zorg ervoor dat we visueel echt laten zien hoe de game er op dit moment uitziet
					target.get(PositionComponent).x			+=	target.get(PhysicsComponent).velocityX;
					target.get(PositionComponent).y 		+=	target.get(PhysicsComponent).velocityY;
					target.get(PositionComponent).rotation	+=	target.get(PhysicsComponent).angularVelocity;
				}
			}
		}
		
	}
}
