package Context 
{
	import Context.Player;
	import Context.werewolfstates.ChaseGateState;
	import Context.werewolfstates.FastGateState;
	import Context.werewolfstates.JumpState;
	import Context.werewolfstates.JumpState;
	import Context.werewolfstates.IWerewolfState;
	import Context.werewolfstates.AttackGateState;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.display.DisplayObjectContainer;
	
	public class Werewolf extends MovieClip
	{
		public static const JUMP:IWerewolfState = new JumpState();
		public static const CHASE:IWerewolfState = new ChaseGateState();
		public static const DASH:IWerewolfState = new FastGateState();
		public static const ATTACK:IWerewolfState = new AttackGateState();
				
		public var target: MovieClip;
		public var playerTarget: Player;
		public var health: Number;
		private var _previousState:IWerewolfState;
		private var _currentState:IWerewolfState; 
		public var velocity:Point = new Point();
		public var speed:Number = 0;
		
		public var shadow:MovieClip;
		
		public var fleeRadius:Number = 50; 
		public var chaseRadius:Number = 1500; 
		public var numCycles:int = 0; 
		
		public function Werewolf(bl:DisplayObjectContainer) 
		{
			health = 4;
			
			_currentState = JUMP;
			
			shadow = new WereShadow;
			shadow.y = -2000;
			bl.addChild(shadow);
		}

		public function update():void {
			numCycles++;
			_currentState.update(this);
			x += velocity.x*speed;
			y += velocity.y*speed;
			
			shadow.x = this.x;
			shadow.y = this.y + 59.95;
		}
		public function setState(newState:IWerewolfState):void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}
		
		public function get previousState():IWerewolfState { return _previousState; }
		
		public function get currentState():IWerewolfState { return _currentState; }
		
	}

}