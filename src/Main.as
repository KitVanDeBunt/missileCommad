package 
{
	import factories.fectoryMissile;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import gameObjects.Bullit;
	import gameObjects.Explosion;
	import gameObjects.missile;
	import gameObjects.missileLauncher;
	import physics.wind;
	import particles.MCautoRemove;
	
	/**
	 * ...
	 * @author Kit van de bunt
	 */
	public class Main extends Sprite 
	{
		private var respawnTime:int = 30;
		private var missileTimer:int = respawnTime;
		private var missileVector:Vector.<missile> = new Vector.<missile>;
		private var bullitVector:Vector.<Bullit> = new Vector.<Bullit>;
		private var explosionVector:Vector.<Explosion> = new Vector.<Explosion>;
		private var mcVector:Vector.<MCautoRemove> = new Vector.<MCautoRemove>;
		private var Launcher:missileLauncher = new missileLauncher();
		private var DisplayHeight:int;
		private var DisplayWidth:int;
		private var hits:int = 0;
		private var hitCount:TextField = new TextField();
		public var windClass:wind = new wind();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(MouseEvent.MOUSE_MOVE , moveMouse);
			stage.addEventListener(MouseEvent.CLICK , moveClick);
			
			DisplayWidth = stage.stageWidth;
			DisplayHeight = stage.stageHeight;
			addChild(Launcher);
			Launcher.y = DisplayHeight;
			Launcher.x = DisplayWidth / 2;
			
			//hitconter
			hitCount.textColor = 0xffffff;
			hitCount.text = "HitCount = 0";
			hitCount.width = 300;
			addChild(hitCount);
		}
		
		private function loop(event:Event):void {
			windClass.Update();
			
			//display
			hitCount.text = "hitCount =" + hits+" Wind("+windClass.windSpeedX+","+windClass.windSpeedY+")";
			
			//misileSpawnTimer
			if (missileTimer > 0) {
				missileTimer--;
			}else {
				launchMissile();
				missileTimer = respawnTime;
			}
			//bullit explosion / delete
			for (var i:int = 0; i < explosionVector.length; i++) 
			{
				if(!explosionVector[i].dead){
					explosionVector[i].loop();
				}else {
					removeChild(explosionVector[i]);
					explosionVector.splice(i , 1);
				}
			}
			//mc loop / delete
			var ol:int = mcVector.length;
			var mcVec:MCautoRemove;
			for (var o:int = 0; o < ol; o++) 
			{
				mcVec = mcVector[o];
				if(!mcVec.dead){
					mcVec.loop();
				}else {
					removeChild(mcVec);
					mcVector.splice(o , 1);
					ol--;
				}
			}
			
			//explosion missile hittest
			for (var n:int = 0; n < explosionVector.length; n++){
				for (var k:int = 0; k < missileVector.length; k++){
					if (explosionVector[n].hitTestObject(missileVector[k])) {
						//explosion
						explosionSpawn(missileVector[k].x, missileVector[k].y);
						//remove missile
						removeChild(missileVector[k]);
						missileVector.splice(k , 1);
					}
				}
			}
			
			
			//bullit loop / delete
			for (var j:int = 0; j < bullitVector.length; j++) 
			{
				if (bullitVector[j].y<-100) {
					removeChild(bullitVector[j]);
					bullitVector.splice(j , 1);
				//}else if (bullitVector[i].x < bullitVector[i].desX + 30 && bullitVector[i].x > bullitVector[i].desX - 30&&bullitVector[i].y < bullitVector[i].desY+30&&bullitVector[i].y > bullitVector[i].desY-30) {
				}else if (bullitVector[j].distance<0){
					///bullit explode
					explosionSpawn(bullitVector[j].desX, bullitVector[j].desY);
					removeChild(bullitVector[j]);
					bullitVector.splice(j , 1);
				}else{
					bullitVector[j].loop();
					MCspawn(bullitVector[j].x,bullitVector[j].y,new MCautoRemove(new bullitParticle()));
				}
			}
			//missile loop / delete
			for (var m:int = 0; m < missileVector.length; m++) 
			{
				if (missileVector[m].y > DisplayHeight - 80) {
					if (missileVector[m].x > 0 && missileVector[m].x < DisplayWidth) {
						//if missile hits ground
						hits++;
						MCspawn(missileVector[m].x,missileVector[m].y,new MCautoRemove(new groundExplosienArt()));
						MCspawn(missileVector[m].x,missileVector[m].y,new MCautoRemove(new explosionArt()));
					}
					removeChild(missileVector[m]);
					missileVector.splice(m , 1);
					break;
				}else{
					missileVector[m].loop();
					if (missileVector[m].spawnPartTimer <= 0) {
						missileVector[m].spawnPartReset();
						//spawn particle
						MCspawn(missileVector[m].x,missileVector[m].y,new MCautoRemove(new missileParticle()));
					}
				}
				//missile bullit hittest
				for (var l:int = 0; l < bullitVector.length; l++) {
					if (bullitVector[l].hitTestObject(missileVector[m])) {
						//explosions
						explosionSpawn(missileVector[m].x, missileVector[m].y);
						explosionSpawn(bullitVector[l].desX, bullitVector[l].desY);
						//remove missile
						removeChild(missileVector[m]);
						missileVector.splice(m , 1);
						//remove bullit
						removeChild(bullitVector[l]);
						bullitVector.splice(l , 1);
					}
				}
			}
			//launcher.loop
			Launcher.loop();
		}
		
		private function launchMissile():void {
			missileVector.push(fectoryMissile.createFectoryMissile(Math.random()*DisplayWidth-100+50,-100));
			/*missileVector.push(new missile());
			missileVector[missileVector.length - 1].x = Math.random()*DisplayWidth-100+50;
			missileVector[missileVector.length - 1].y = -100;
			addChild(missileVector[missileVector.length - 1]);*/
			
			//addChild(missileVector[missileVector.length - 1])
		}
		
		private function explosionSpawn(xpos:int,ypos:int):void {
			explosionVector.push(new Explosion());
			explosionVector[explosionVector.length - 1].x = xpos;
			explosionVector[explosionVector.length - 1].y = ypos;
			addChild(explosionVector[explosionVector.length - 1]);
		}
		
		//this functions spawns movieclips that are deleted when done playing
		private function MCspawn(xpos:int,ypos:int,mc:MovieClip):void {
			mcVector.push(mc);
			mcVector[mcVector.length - 1].x = xpos;
			mcVector[mcVector.length - 1].y = ypos;
			addChild(mcVector[mcVector.length - 1]);
		}
		
		private function moveMouse(m:MouseEvent):void {
			var xdiff:int = m.stageX-Launcher.x;
			var ydiff:int = m.stageY-Launcher.y;
			var rotation:Number = Math.atan2(ydiff, xdiff)/(Math.PI/180);
			//trace("Mousex :" + m.localX + "Mousey :" + m.localY + "rot: " + rotation);
			Launcher.RotateTo(rotation + 180);
			//trace("mousex: "+m.localX+" mousey: "+m.localY+" rotation: "+rotation)
		}
		
		//player shoot
		private function shoot(DestanationX:int,DestanationY:int):void {
			var distancePowTwo:Number = Math.pow(DestanationY - Launcher.y,2) + Math.pow(DestanationX - Launcher.x,2)
			var distance:Number = Math.pow(distancePowTwo, 0.5);
			bullitVector.push(new Bullit(Launcher.rotat,DestanationX,DestanationY,distance));
			bullitVector[bullitVector.length - 1].x = Launcher.x// + ( 50 * Math.cos(Launcher.rotat-90));
			bullitVector[bullitVector.length - 1].y = Launcher.y// + ( 50 * Math.sin(Launcher.rotat - 90));
			addChild(bullitVector[bullitVector.length - 1]);
		}
		
		private function moveClick(m:MouseEvent):void {
			shoot(m.stageX,m.stageY);
		}
	}
}