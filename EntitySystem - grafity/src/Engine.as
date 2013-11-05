package {
	import systems.System;
	/**
	 * @author berendweij
	 */
	public class Engine {
		
		// lijst met alle entities in deze game
		private var _entities:Vector.<Entity>	=	new Vector.<Entity>();
		// lijst met alle systemen in deze game
		private var _systems:Vector.<System>	=	new Vector.<System>();
	
		public function addEntity( entity:Entity ):void
		{
			_entities.push( entity );
	  	}
	
		public function removeEntity( entity:Entity ):void
		{
			var index : int	=	_entities.indexOf(entity);
			if(index > -1)
			{
				// we hebben de entity gevonden dus laten we hem verwijderen
				_entities.splice( index, 1);
			}
		}
	
		public function addSystem( system:System ):void
		{
			// registreer een nieuw systeem
			_systems.push( system );
			// geef het systeem een link naar alle entiteiten in deze wereld
			system.targets	=	_entities;
		}
	
	
		public function update():void
		{
			// update alle system
			for each( var system:System in _systems )
			{
				system.update();
			}
		}
		
	}
}
