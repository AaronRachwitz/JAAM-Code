package Context 
{
	import Context.Player;
	import Context.firestates.ChaseState;
	import Context.firestates.TargetState;
	import Context.firestates.IFireState;
	import flash.display.MovieClip;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	
	public class Fire extends MovieClip
	{
		public static const CHASE:IFireState = new ChaseState();
		public static const TARGET:IFireState = new TargetState();
		
		public var target: Player;
		public var health: Number;
		private var _previousState:IFireState;
		private var _currentState:IFireState; 
		public var velocity:Point = new Point();
		public var speed:Number = 0;
		
		public var shadow: MovieClip;
		
		public var fleeRadius:Number = 50; 
		public var chaseRadius:Number = 1500;
		public var numCycles:int = 0; 
		
		public function Fire(bl:DisplayObjectContainer) 
		{
			health = 80;
			
			_currentState = TARGET;
			
			shadow = new FireShadow;
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
			health--;
			_currentState.update(this);
			x += velocity.x*speed;
			y += velocity.y*speed;
			
			shadow.x = this.x;
			shadow.y = this.y + 57;
		}
		public function setState(newState:IFireState):void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}
		
		public function get previousState():IFireState { return _previousState; }
		
		public function get currentState():IFireState { return _currentState; }
		
	}

}