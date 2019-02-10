package Context 
{
	import Context.Player;
	import Context.cloudstates.ICloudState;
	import Context.cloudstates.ChaseState;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.display.DisplayObjectContainer;
	public class Cloud extends MovieClip
	{
		public static const CHASE:ICloudState = new ChaseState();
		
		private const RAD_DEG:Number = 180 / Math.PI;
		
		public var target: Player;
		public var health: Number;
		private var _previousState:ICloudState;
		private var _currentState:ICloudState;
		public var velocity:Point = new Point();
		public var speed:Number = 0;
		
		public var shadow:MovieClip;
		
		public var fleeRadius:Number = 50; 
		public var chaseRadius:Number = 1500; 
		public var numCycles:int = 0;
		
		public function Cloud(bl:DisplayObjectContainer) 
		{
			//Boring stuff here
			
			health = 15;
			
			_currentState = CHASE; //Set the initial state
			
			shadow = new MedShadow;
			shadow.y = -2000;
			bl.addChild(shadow);
		}
		
		public function update():void {
			if (!_currentState) return; 
			numCycles++; 
			_currentState.update(this);
			x += velocity.x*speed;
			y += velocity.y*speed;
			
			shadow.x = this.x;
			shadow.y = this.y + 55;
			
		}
		public function setState(newState:ICloudState):void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}
		
		public function get previousState():ICloudState { return _previousState; }
		
		public function get currentState():ICloudState { return _currentState; }
		
	}

}