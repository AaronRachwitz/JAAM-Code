package Context 
{
	import Context.Player;
	import Context.buerstates.ChaseState;
	import Context.buerstates.ChaseXState;
	import Context.buerstates.AttackGateState;
	import Context.buerstates.IBuerState;
	import Context.buerstates.IdleState;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.display.DisplayObjectContainer;
	
	public class Buer extends MovieClip
	{
		public static const CHASE:IBuerState = new ChaseState();
		public static const CHASEX:IBuerState = new ChaseXState();
		public static const ATTACK:IBuerState = new AttackGateState();
		public static const IDLE:IBuerState = new IdleState();
		
		public var target: MovieClip;
		public var health: Number;
		private var _previousState:IBuerState;
		private var _currentState:IBuerState; 
		public var velocity:Point = new Point();
		public var speed:Number = 0;
		
		public var shadow:MovieClip;
		
		public var fleeRadius:Number = 50; 
		public var chaseRadius:Number = 1500; 
		public var numCycles:int = 0; 
		
		public function Buer(bl:DisplayObjectContainer) 
		{
			health = 4;
			
			_currentState = CHASE;
			
			shadow = new BuShadow;
			shadow.y = -2000;
			bl.addChild(shadow);
		}
		
		public function update():void {
			numCycles++; 
			_currentState.update(this);
			x += velocity.x*speed;
			y += velocity.y*speed;
			
			shadow.x = this.x;
			shadow.y = this.y + 60;
		}
		public function setState(newState:IBuerState):void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}
		
		public function get previousState():IBuerState { return _previousState; }
		
		public function get currentState():IBuerState { return _currentState; }
		
	}

}