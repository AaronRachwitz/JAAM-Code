package Context {
	import Context.Player;
	import Context.bigtentaclestates.ChaseGateState;
	import Context.bigtentaclestates.IBigTentacleState;
	import Context.bigtentaclestates.AttackGateState;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.display.DisplayObjectContainer;

	public class BigTentacle extends MovieClip {
		public static const CHASE: IBigTentacleState = new ChaseGateState();
		public static const ATTACK: IBigTentacleState = new AttackGateState();

		private var _fireCount: int = 0;
		private var _fireDelay: int = 30;
		private var _shotSpeed: Number = 15;
		private var _turnRate: Number = 30;

		public var shootRotation: MovieClip;

		public var gateTarget: MovieClip;
		public var target: Point;
		public var shotTarget: Player;

		public var health: Number;
		private var _previousState: IBigTentacleState;
		private var _currentState: IBigTentacleState;
		public var velocity: Point = new Point();
		public var speed: Number = 0;

		public var shadow: MovieClip;

		public var fleeRadius: Number = 50;
		public var chaseRadius: Number = 1500;
		public var numCycles: int = 0;

		public function BigTentacle(bl: DisplayObjectContainer) {
			
			shootRotation = new MovieClip();
			this.addChild(shootRotation);
			
			health = 30;

			_currentState = CHASE;

			shadow = new BigShadow;
			shadow.y = -2000;
			bl.addChild(shadow);
		}

		public function update(): Projectile {
			numCycles++;
			_currentState.update(this);
			x += velocity.x * speed;
			y += velocity.y * speed;
			
			shootRotation.x = this.x;
			shootRotation.y = this.y - 55;

			shadow.x = this.x;
			shadow.y = this.y + 40;

			target = new Point(shotTarget.x, shotTarget.y);

			if (_currentState == BigTentacle.CHASE) {
				_fireCount++;

				var btshot: Projectile;

				if (target != null) {
					target = new Point(target.x, target.y);
					var targetAngle: Number = Math.atan2(target.y - shootRotation.y, target.x - shootRotation.x) * 180 / Math.PI;

					if (_fireCount >= _fireDelay) {
						btshot = new EnemyBullet;
						btshot.enemy = true;
						btshot.cacheAsBitmap = true;
						btshot.shadow.width = 7;
						btshot.shadow.width = 7;
						btshot.x = shootRotation.x + Math.cos(shootRotation.rotation * Math.PI / 180) * -5;
						btshot.y = shootRotation.y + Math.sin(shootRotation.rotation * Math.PI / 180) * -5;
						btshot.rotation += shootRotation.rotation;

						btshot.xVel = Math.cos(shootRotation.rotation * Math.PI / 180) * _shotSpeed;
						btshot.yVel = Math.sin(shootRotation.rotation * Math.PI / 180) * _shotSpeed;

						_fireCount = 0;
					}

					shootRotation.rotation = targetAngle;
				}
				return btshot
			}
			return null
		}

		public function setState(newState: IBigTentacleState): void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}

		public function get previousState(): IBigTentacleState {
			return _previousState;
		}

		public function get currentState(): IBigTentacleState {
			return _currentState;
		}

	}

}