package systems {
	import components.PhysicsComponent;
	import components.PositionComponent;
	import components.DisplayComponent;
	/**
	 * @author kit van de bunt
	 */
	public class GravitySystem extends System {
		
		public static const GRAVITY : Number = 6.67*Math.pow(10,-11);
		/////////////////////// Gravity //////////////////////////
		// 		f = gravity force								//
		// 		m = mass1										//
		// 		M = mass2										//
		// 		g = gravity constant (6.67*10^-11)				//
		// 		r = distance objects							//
		//														//
		// 		f = mMG/R^2										//
		//////////////////////////////////////////////////////////
		
		override public function update():void
		{
			for each( var target:Entity in targets )
			{
				var gravityX:Number = 0;
				var gravityY:Number = 0;
				
				var tarPhs = target.get(PhysicsComponent);
				var tarPos = target.get(PositionComponent);
				var m:Number = tarPhs.mass;
				var tarX:Number = tarPos.x;
				var tarY:Number = tarPos.y;
				if (target.get(PhysicsComponent))
				{
					for each( var other:Entity in targets )
					{
						if(other!=target){
							var othrPsh = other.get(PhysicsComponent);
							var othrPos = other.get(PositionComponent);
							var M:Number = othrPsh.mass;
							var othrX:Number = othrPos.x;
							var othrY:Number = othrPos.y;
							//calculate distance between other and target
							var dx:Number = tarX - othrX;
							var dy:Number = tarY - othrY;
							var distance:Number = Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2));
							
							//calculate garvity between other and target
							var f:Number = ((m * M * GRAVITY) / Math.pow(distance, 2));
							//calculate grafity components
							var rationX:Number = dx / distance;
							var rationY:Number = dy / distance;
							
							gravityX += f * rationX;
							gravityY += f * rationY;
							//trace("mass target: " + m + " mass Other: " + M + " distance: " + distance + " force: " + f + " forceX: " + gravityX + " forceY: " + gravityY);
							//trace(" distance: " + distance+" distanceX: " + dx+" distanceY: " + dy);
						}else {
							//trace("else")
						}
					}
					target.get(PhysicsComponent).velocityX -= gravityX;
					target.get(PhysicsComponent).velocityY -= gravityY;
				}
			}
		}
		
	}
}
