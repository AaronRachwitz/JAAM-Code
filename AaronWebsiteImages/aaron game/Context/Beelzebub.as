package Context {

	import Context.beelzebubstates.IBeelzebubState;
	import Context.beelzebubstates.DefaultState;
	import Context.beelzebubstates.FindLocationState;
	import Context.Projectile
	import Context.Bug;
	import Context.Cloud;
	import flash.display.MovieClip;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;

	public class Beelzebub extends MovieClip {

		public static const DEFAULT: IBeelzebubState = new DefaultState();
		public static const FIND: IBeelzebubState = new FindLocationState();

		public var playerTarget: Player;
		public var locationTarget: Point;
		public var health: Number;
		private var _previousState: IBeelzebubState;
		private var _currentState: IBeelzebubState;
		private var _sprite: MovieClip;
		public var velocity: Point = new Point();
		public var speed: Number = 0;

		public var numCycles: int = 0;

		public var shootRotation: MovieClip;
		public var shadow: MovieClip;

		private var _1Delay: Number = 30;
		private var _1Spawn: Number = 0;

		private var _2Delay: Number = 210;
		private var _2Spawn: Number = 0;

		private var _tl: DisplayObjectContainer;
		private var _bl: DisplayObjectContainer;

		private var _bugs: Array;
		private var _Clouds: Array;

		public function Beelzebub(tl: DisplayObjectContainer, bl: DisplayObjectContainer, bugs: Array, Clouds: Array) {
			_bugs = bugs;
			_Clouds = Clouds;

			shootRotation = new MovieClip;
			this.addChild(shootRotation);

			health = 1000;

			shadow = new BeelShadow;
			bl.addChild(shadow);

			_tl = tl;
			_bl = bl;

			_currentState = FIND;
		}

		private function randomRange(minNum: Number, maxNum: Number): Number {
			return (Math.ceil(Math.random() * (maxNum - minNum)) + minNum);
		}
		
		public function get distanceToLocation():Number {
			var dx:Number = shadow.x - locationTarget.x;
			var dy:Number = shadow.y - locationTarget.y;
			return Math.sqrt(dx * dx + dy * dy);
		}

		public function update(): void {
			numCycles++;
			_currentState.update(this);
			x += velocity.x * speed;
			y += velocity.y * speed;
			
			trace (health)

			shadow.x = this.x;
			shadow.y = this.y + 50;

			_1Spawn++;

			if (_1Spawn >= _1Delay) {
				bugSpawn();
			}

			_2Spawn++;

			if (_2Spawn >= _2Delay) {
				cloudSpawn();
			}
		}

		private function bugSpawn(): void {
			var i: int;
			for (i = 0; i < 1; i++) {
				var l: Number = randomRange(0, 4);
				var g: Bug = new Bug(_bl);

				if (l == 2) {
					g.x = -25;
					g.y = 800;
				}
				if (l == 1) {
					g.x = -25;
					g.y = 0;
				}
				if (l == 3) {
					g.x = 1225;
					g.y = 0;
				}
				if (l == 4) {
					g.x = 1225;
					g.y = g.y = 800;
				}

				g.target = playerTarget;
				_tl.addChild(g);
				_bugs.push(g);

				_1Spawn = 0;
			}
		}

		private function cloudSpawn(): void {
			var j: int;
			for (j = 0; j < 1; j++) {
				var c: Cloud = new Cloud(_bl);

				c.x = this.x;
				c.y = this.y;

				c.target = playerTarget
				_tl.addChild(c);
				_Clouds.push(c);

				_2Spawn = 0;
			}
		}

		public function setState(newState: IBeelzebubState): void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}

		public function get previousState(): IBeelzebubState {
			return _previousState;
		}

		public function get currentState(): IBeelzebubState {
			return _currentState;
		}

	}

}