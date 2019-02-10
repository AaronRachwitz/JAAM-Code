package Context 
{
	import Context.Player;
	import Context.medtentaclestates.ChaseState;
	import Context.medtentaclestates.IMediumTentacleState;
	import Context.medtentaclestates.IdleState;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.display.DisplayObjectContainer;

	public class MediumTentacle extends MovieClip
	{
		public static const CHASE:IMediumTentacleState = new ChaseState();
		public static const IDLE:IMediumTentacleState = new IdleState();
		
		public var target: Player;
		public var health: Number;
		private var _previousState:IMediumTentacleState;
		private var _currentState:IMediumTentacleState;
		public var velocity:Point = new Point();
		public var speed:Number = 0;
		
		public var shadow:MovieClip;
		
		public var fleeRadius:Number = 50;
		public var chaseRadius:Number = 1500;
		public var numCycles:int = 0;
		
		public function MediumTentacle(bl:DisplayObjectContainer) 
		{
			health = 10;
			
			_currentState = CHASE;
			
			shadow = new MedShadow;
			shadow.y = -2000;
			bl.addChild(shadow);
		}
		
		public function update():void {
			numCycles++; 
			_currentState.update(this);
			x += velocity.x*speed;
			y += velocity.y*speed;
			
			shadow.x = this.x;
			shadow.y = this.y + 55;
		}
		public function setState(newState:IMediumTentacleState):void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}
		
		public function get previousState():IMediumTentacleState { return _previousState; }
		
		public function get currentState():IMediumTentacleState { return _currentState; }
		
	}

}
