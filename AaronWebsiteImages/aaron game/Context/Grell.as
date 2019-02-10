package Context {
	import Context.Player;
	import Context.grellstates.ShootState;
	import Context.grellstates.StillState;
	import Context.grellstates.Still2State;
	import Context.grellstates.TeleportState;
	import Context.grellstates.IGrellState;
	import flash.display.MovieClip;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;

	public class Grell extends MovieClip {
		public static const STILL: IGrellState = new StillState();
		public static const SHOOT: IGrellState = new ShootState();
		public static const TELEPORT: IGrellState = new TeleportState();
		public static const STILL2: IGrellState = new Still2State();

		public var fireCount: int = 0;
		private var _fireDelay: int = 10;
		private var _shotSpeed: Number = 15;
		private var _turnRate: Number = 30;

		public var shadow: MovieClip;

		public var target: Point;
		public var playerTarget: Player;
		public var health: Number;
		private var _previousState: IGrellState;
		private var _currentState: IGrellState;
		public var velocity: Point = new Point();
		public var speed: Number = 0;

		public var shootRotation: MovieClip = new MovieClip();

		public var numCycles: int = 0;

		public function Grell(bl: DisplayObjectContainer) {

			addChild(shootRotation);

			health = 10;

			_currentState = STILL;

			shadow = new GreShadow;
			shadow.y = -2000;
			bl.addChild(shadow);
		}

		public function update(): Projectile {
			shadow.x = this.x;
			shadow.y = this.y + 55;
			
			shootRotation.x = this.x;
			shootRotation.y = this.y;

			numCycles++;
			_currentState.update(this);

			target = new Point(playerTarget.x, playerTarget.y);

			if (_currentState == Grell.SHOOT) {
				fireCount++;

				var shot: Projectile;

				if (target != null) {
					target = new Point(target.x, target.y);
					var targetAngle: Number = Math.atan2(target.y - shootRotation.y, target.x - shootRotation.x) * 180 / Math.PI;

					if (fireCount >= _fireDelay) {
						shot = new EnemyBullet;
						shot.enemy = true;
						shot.life = 100;
						shot.shadow.height = 5;
						shot.shadow.width = 5;
						shot.cacheAsBitmap = true;
						shot.x = shootRotation.x + Math.cos(shootRotation.rotation * Math.PI / 180) * -5;
						shot.y = shootRotation.y + Math.sin(shootRotation.rotation * Math.PI / 180) * -5;
						shot.rotation += shootRotation.rotation;

						shot.xVel = Math.cos(shootRotation.rotation * Math.PI / 180) * _shotSpeed;
						shot.yVel = Math.sin(shootRotation.rotation * Math.PI / 180) * _shotSpeed;

						fireCount = 0;
					}
					
					shootRotation.rotation = targetAngle;
				}
				return shot
			}
			return null
		}
		public function setState(newState: IGrellState): void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}

		public function get previousState(): IGrellState {
			return _previousState;
		}

		public function get currentState(): IGrellState {
			return _currentState;
		}

	}

}