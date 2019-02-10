package Context {

	import Context.satanstates.ISatanState;
	import Context.satanstates.DefaultState;
	import Context.satanstates.FindLocationState;
	import Context.Projectile
	import Context.Player;
	import flash.display.MovieClip;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	import Context.beelzebubstates.FindLocationState;

	public class Satan extends MovieClip {

		public static const DEFAULT: ISatanState = new DefaultState();
		public static const FIND: ISatanState = new FindLocationState;

		public var locationTarget: Point;
		public var health: Number;
		private var _previousState: ISatanState;
		private var _currentState: ISatanState;
		private var _sprite: MovieClip;
		public var velocity: Point = new Point();
		public var speed: Number = 0;

		public var shadow: MovieClip;

		public var numCycles: int = 0;
		private var _fireCount: int = 0;
		private var _fireDelay: int = 2;

		public var shootRotation: MovieClip;

		private var _1Spawn: int = 0;
		private var _1Delay: int = 15;
		
		private var _2Spawn: int = 0;
		private var _2Delay: int = 90;
		
		private var _p: Player;
		private var _eB: Array;
		private var _fires: Array;
		private var _worms: Array;
		private var _tl: DisplayObjectContainer;
		private var _bl: DisplayObjectContainer;

		public function Satan(eB: Array, fires: Array, worms:Array, tl: DisplayObjectContainer, bl: DisplayObjectContainer, p: Player) {
			_p = p;
			_fires = fires;
			_worms = worms;

			health = 1200;

			_eB = eB;
			_tl = tl;
			_bl = bl;

			_currentState = FIND;

			shadow = new SatanShadow;
			shadow.y = -2000;
			bl.addChild(shadow);
		}

		public function update(): void {
			numCycles++;
			_currentState.update(this);
			x += velocity.x * speed;
			y += velocity.y * speed;

			shadow.x = this.x;
			shadow.y = this.y + 55;

			_fireCount++;
			if (_fireCount >= _fireDelay) {
				spawnTrident();
			}

			_1Spawn++;
			if (_1Spawn >= _1Delay) {
				spawnFire();
			}
			
			_2Spawn++;
			if (_2Spawn >= _2Delay) {
				spawnWorms();
			}
		}

		private function spawnTrident(): void {
			var t: Projectile = new Trident();
			t.trident = true;
			t.life = 51;

			t.yVel = 20

			t.x = Math.random() * 1020 + 100
			t.y = (Math.random() * 735 + 120) - 1055

			t.tridentShadow.x = t.x;
			t.tridentShadow.y = t.y + 1055;

			_bl.addChild(t.tridentShadow)
			_tl.addChild(t);
			_eB.push(t);

			_fireCount = 0;
		}

		private function spawnFire(): void {
			var i: int;
			for (i = 0; i < 1; i++) {
				var l:Number = randomRange(0, 4);
				var f: Fire = new Fire(_bl);
				
				if (l == 1) {
					f.x = 50;
					f.y = 100;
				}
				if (l == 2) {
					f.x = 1150;
					f.y = 100;
				}
				if (l == 3) {
					f.x = 50;
					f.y = 800;
				}
				if (l == 4) {
					f.x = 1150;
					f.y = 800;
				}
				
				_1Spawn = 0;
				
				f.target = _p;
				_tl.addChild(f);
				_fires.push(f);
			}
		}
		
		private function spawnWorms():void {
			var i: int;
			for (i = 0; i < 1; i++) {
				var w:WormGroup = new WormGroup(_bl);
				
				_2Spawn = 0;
				
				_tl.addChild(w);
				_worms.push(w);
			}
		}

		public function get distanceToLocation(): Number {
			var dx: Number = this.x - locationTarget.x;
			var dy: Number = this.y - locationTarget.y;
			return Math.sqrt(dx * dx + dy * dy);
		}

		public function setState(newState: ISatanState): void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}

		private function randomRange(minNum: Number, maxNum: Number): Number {
			return (Math.ceil(Math.random() * (maxNum - minNum)) + minNum);
		}

		public function get previousState(): ISatanState {
			return _previousState;
		}

		public function get currentState(): ISatanState {
			return _currentState;
		}

	}

}