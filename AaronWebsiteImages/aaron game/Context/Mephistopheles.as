package Context {
	
	import Context.mephistophelesstates.IMephistophelesState;
	import Context.mephistophelesstates.DefaultState;
	import Context.mephistophelesstates.TripleState;
	import Context.mephistophelesstates.SilverState;
	import Context.Projectile;
	import Context.Player;
	import flash.display.MovieClip;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;

	public class Mephistopheles extends MovieClip {

		public static const DEFAULT: IMephistophelesState = new DefaultState();
		public static const TRIPLE: IMephistophelesState = new TripleState();
		public static const SILVER: IMephistophelesState = new SilverState();

		public var target: Point;
		public var playerTarget: Player;
		public var health: Number;
		private var _previousState: IMephistophelesState;
		private var _currentState: IMephistophelesState;
		private var _sprite: MovieClip;
		public var velocity: Point = new Point();
		public var speed: Number = 0;

		public var numCycles: int = 0;
		public var fireCount: int = 0;

		public var shootRotation: MovieClip;
		public var shadow: MovieClip;
		
		private var _eB: Array;
		private var _tl: DisplayObjectContainer;
		private var _bl: DisplayObjectContainer;

		public function Mephistopheles(eB: Array, tl: DisplayObjectContainer, bl: DisplayObjectContainer) {

			shootRotation = new MovieClip;
			tl.addChild(shootRotation);

			health = 800;

			_eB = eB;
			_tl = tl;
			_bl = bl;

			_currentState = DEFAULT;
			
			shadow = new MephShadow;
			shadow.y = -2000;
			bl.addChild(shadow);
		}

		public function update(): void {
			numCycles++;

			_currentState.update(this, _eB, _tl, _bl);
			x += velocity.x * speed;
			y += velocity.y * speed;
			
			shootRotation.x = this.x
			shootRotation.y = this.y;

			target = new Point(playerTarget.x, playerTarget.y);

			shadow.x = this.x
			shadow.y = this.y + 50;
		}
		public function setState(newState: IMephistophelesState): void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}

		public function get previousState(): IMephistophelesState {
			return _previousState;
		}

		public function get currentState(): IMephistophelesState {
			return _currentState;
		}

	}

}