package Context 
{
	import Context.Player;
	import Context.bugstates.ChaseState;
	import Context.bugstates.IBugState;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.display.DisplayObjectContainer;
	public class Bug extends MovieClip
	{
		public static const CHASE:IBugState = new ChaseState();
		
		private const RAD_DEG:Number = 180 / Math.PI;
		
		public var target: Player;
		public var health: Number;
		private var _previousState:IBugState; //The previous executing state
		private var _currentState:IBugState; //The currently executing state
		public var velocity:Point = new Point();
		public var speed:Number = 0;
		
		public var shadow:MovieClip;
		
		public var fleeRadius:Number = 50; 
		public var chaseRadius:Number = 1500; 
		public var numCycles:int = 0;
		
		public function Bug(bl:DisplayObjectContainer) 
		{
			//Boring stuff here
			
			health = 3;
			
			_currentState = CHASE; //Set the initial state
			
			shadow = new BgShadow;
			bl.addChild(shadow);
		}
		
		public function update():void {
			if (!_currentState) return; //If there's no behavior, we do nothing
			numCycles++; 
			_currentState.update(this);
			x += velocity.x*speed;
			y += velocity.y*speed;
			
			shadow.x = this.x;
			shadow.y = this.y + 57;
		}
		public function setState(newState:IBugState):void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}
		
		public function get previousState():IBugState { return _previousState; }
		
		public function get currentState():IBugState { return _currentState; }
		
	}

}