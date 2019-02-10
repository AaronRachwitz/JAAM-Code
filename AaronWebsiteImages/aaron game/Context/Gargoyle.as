package Context 
{
	import Context.Player;
	import Context.gargoylestates.ChaseState;
	import Context.gargoylestates.AttackState;
	import Context.gargoylestates.IGargoyleState;
	import flash.display.MovieClip;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	
	public class Gargoyle extends MovieClip
	{
		public static const CHASE:IGargoyleState = new ChaseState();
		public static const ATTACK:IGargoyleState = new AttackState();
		
		public var target: Player;
		public var health: Number;
		private var _previousState:IGargoyleState;
		private var _currentState:IGargoyleState; 
		public var velocity:Point = new Point();
		public var speed:Number = 0;
		
		public var shadow: MovieClip;
		
		public var fleeRadius:Number = 50; 
		public var chaseRadius:Number = 1500;
		public var numCycles:int = 0; 
		
		public function Gargoyle(bl:DisplayObjectContainer) 
		{
			health = 5;
			
			_currentState = CHASE;
			
			shadow = new GShadow;
			shadow.y = -2000;
			bl.addChild(shadow);
		}
		
		public function get distanceToPlayer():Number {
			var dx:Number = shadow.x - target.shadow.x;
			var dy:Number = shadow.y - target.shadow.y;
			return Math.sqrt(dx * dx + dy * dy);
		}

		public function update():void {
			numCycles++; 
			_currentState.update(this);
			x += velocity.x*speed;
			y += velocity.y*speed;
			
			shadow.x = this.x;
			shadow.y = this.y + 73;
		}
		public function setState(newState:IGargoyleState):void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}
		
		public function get previousState():IGargoyleState { return _previousState; }
		
		public function get currentState():IGargoyleState { return _currentState; }
		
	}

}