package Context.mephistophelesstates {

	import Context.Projectile;
	import Context.Mephistopheles;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;

	public class SilverState implements IMephistophelesState {

		private var _fireCount: int = 0;
		private var _fireDelay: int = .01;
		private var _shotSpeed: Number = 20;
		private var _turnRate: Number = 30;

		public function update(p: Mephistopheles, eB: Array, tl: DisplayObjectContainer, bl:DisplayObjectContainer): void {
			_fireCount++;

			var shot: Projectile;

			if (p.target != null) {
				p.target = new Point(p.target.x, p.target.y);
				var targetAngle: Number = Math.atan2(p.target.y - p.shootRotation.y, p.target.x - p.shootRotation.x) * 180 / Math.PI;

				if (_fireCount >= _fireDelay && p.numCycles >= 40) {
					shot = new SilverBullet();
					shot.life = 30;
					shot.silver = true;
					shot.cacheAsBitmap = true;
					shot.x = p.x + Math.cos(p.shootRotation.rotation * Math.PI / 180) * -5;
					shot.y = p.y + Math.sin(p.shootRotation.rotation * Math.PI / 180) * -5;
					shot.rotation += p.shootRotation.rotation;

					shot.xVel = Math.cos(p.shootRotation.rotation * Math.PI / 180) * _shotSpeed;
					shot.yVel = Math.sin(p.shootRotation.rotation * Math.PI / 180) * _shotSpeed;

					bl.addChild(shot.shadow);
					tl.addChild(shot);
					eB.push(shot);
					_fireCount = 0;
				}

				p.shootRotation.rotation += Math.random() * 150;
			}
		}
		public function enter(p: Mephistopheles): void {

		}

		public function exit(p: Mephistopheles): void {

		}
	}
}