package {
	import components.DisplayComponent;
	import components.PositionComponent;
	import components.PhysicsComponent;
	import flash.utils.Dictionary;
	/**
	 * @author berendweij
	 */
	public class Entity {
		
		// lijst met alle componenten
		// dit kan per entity verschillen
		private var _components :	Dictionary;
		
		public function Entity() : void
		{
			_components	=	new Dictionary();
		}
		
		public function add( component:Object ):void
		{
			var componentClass : Class = component.constructor;
			_components[ componentClass ] = component;
		}
		  
		public function remove( componentClass:Class ):void
		{
			var index	: int = _components.indexOf(componentClass);
			if (index > -1)
			{
				_components.splice(index, 1);
			}
		 }
		  
		 public function get( componentClass:Class ):Object
		 {
			return _components[ componentClass ];
		 }
	}
}
