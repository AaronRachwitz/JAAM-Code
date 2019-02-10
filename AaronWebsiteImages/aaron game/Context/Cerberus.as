package Context 
{
	import Context.Player;
	import Context.cerberusstates.ChaseGateState;
	import Context.cerberusstates.ChasePlayerState;
	import Context.cerberusstates.ICerberusState;
	import Context.cerberusstates.AttackGateState;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.display.DisplayObjectContainer;
	
	public class Cerberus extends MovieClip
	{
		public static const CHASE:ICerberusState = new ChaseGateState();
		public static const CHASEP:ICerberusState = new ChasePlayerState;
		public static const ATTACK:ICerberusState = new AttackGateState();
		
		private const RAD_DEG:Number = 180 / Math.PI;
		
		public var target: MovieClip;
		public var playerTarget: Player;
		public var health: Number;
		private var _previousState:ICerberusState;
		private var _currentState:ICerberusState; 
		public var velocity:Point = new Point();
		public var speed:Number = 0;
		
		public var shadow:MovieClip;
		
		public var fleeRadius:Number = 50; 
		public var chaseRadius:Number = 1500; 
		public var numCycles:int = 0; 
		
		public function Cerberus(bl:DisplayObjectContainer) 
		{
			health = 20;
			
			_currentState = CHASE; 
			
			shadow = new CerbShadow;
			shadow.y = -2000;
			bl.addChild(shadow);
		}
		
		public function get distanceToPlayer():Number {
			var dx:Number = shadow.x - playerTarget.shadow.x;
			var dy:Number = shadow.y - playerTarget.shadow.y;
			return Math.sqrt(dx * dx + dy * dy);
		}
		
		public function update():void {
			numCycles++; 
			_currentState.update(this);
			x += velocity.x*speed;
			y += velocity.y*speed;
			
			shadow.x = this.x;
			shadow.y = this.y + 52.8;
		}
		
		public function setState(newState:ICerberusState):void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}
		
		public function get previousState():ICerberusState { return _previousState; }
		
		public function get currentState():ICerberusState { return _currentState; }
		
	}

}