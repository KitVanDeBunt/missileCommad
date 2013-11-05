package systems {
	import components.DisplayComponent;
	import components.PositionComponent;
	/**
	 * @author berendweij
	 */
	public class RenderSystem extends System {
		
		override public function update():void
		{
			// in deze update staat de logica om de objecten visueel te laten zien
			for each( var target:Entity in targets )
			{
				// de render class moet weten WAT hij moet renden visueel (display)
				// en WAAR hij dit moet renderen (position)
				// de rest doet er niet toe voor dit systeem
				// voor nu loopen we nog door alle targets
				// maar we moeten alleen degene renderen die een display en een position hebben
				if (target.get(DisplayComponent) && target.get(PositionComponent))
				{
					target.get(DisplayComponent).view.x			=	target.get(PositionComponent).x;
					target.get(DisplayComponent).view.y			=	target.get(PositionComponent).y;
					target.get(DisplayComponent).view.rotation	=	target.get(PositionComponent).rotation;
				}
			}
		}
		
	}
}
