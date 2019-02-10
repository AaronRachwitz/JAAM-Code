package Context.mephistophelesstates {

	import Context.Projectile;
	import Context.Mephistopheles;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;

	public class DefaultState implements IMephistophelesState {

		private var _fireCount: int = 0;
		private var _fireDelay: int = 1;
		private var _shotSpeed: Number = 25;
		private var _turnRate: Number = 30;

		public function update(p: Mephistopheles, eB: Array, tl: DisplayObjectContainer, bl:DisplayObjectContainer): void {
			_fireCount++;

			var shot: Projectile;
			var shot2: Projectile;
			var shot3: Projectile;
			var shot4: Projectile;

			if (p.target != null) {
				p.target = new Point(p.target.x, p.target.y);
				var targetAngle: Number = Math.atan2(p.target.y - p.shootRotation.y, p.target.x - p.shootRotation.x) * 180 / Math.PI;

				if (_fireCount >= _fireDelay && p.numCycles >= 40) {
					shot = new Bullet();
					shot2 = new Bullet();
					shot3 = new Bullet();
					shot4 = new Bullet();

					shot.life = 30;
					shot2.life = 30;
					shot3.life = 30;
					shot4.life = 30;
					
					shot.normal = true;
					shot2.normal = true;
					shot3.normal = true;
					shot4.normal = true;

					shot.cacheAsBitmap = true;
					shot2.cacheAsBitmap = true;
					shot3.cacheAsBitmap = true;
					shot4.cacheAsBitmap = true;

					shot.x = p.shootRotation.x + Math.cos(p.shootRotation.rotation * Math.PI / 180) * -5;
					shot.y = p.shootRotation.y + Math.sin(p.shootRotation.rotation * Math.PI / 180) * -5;
					shot2.x = p.shootRotation.x + Math.cos(p.shootRotation.rotation * Math.PI / 180) * -5;
					shot2.y = p.shootRotation.y + Math.sin(p.shootRotation.rotation * Math.PI / 180) * -5;
					shot3.x = p.shootRotation.x + Math.cos(p.shootRotation.rotation * Math.PI / 180) * -5;
					shot3.y = p.shootRotation.y + Math.sin(p.shootRotation.rotation * Math.PI / 180) * -5;
					shot4.x = p.shootRotation.x + Math.cos(p.shootRotation.rotation * Math.PI / 180) * -5;
					shot4.y = p.shootRotation.y + Math.sin(p.shootRotation.rotation * Math.PI / 180) * -5;

					shot.rotation += p.shootRotation.rotation + 20;
					shot2.rotation += p.shootRotation.rotation - 20;
					shot3.rotation += p.shootRotation.rotation + 22;
					shot4.rotation += p.shootRotation.rotation - 22;

					shot.xVel = Math.cos(shot.rotation * Math.PI / 180) * _shotSpeed;
					shot.yVel = Math.sin(shot.rotation * Math.PI / 180) * _shotSpeed;
					shot2.xVel = Math.cos(shot2.rotation * Math.PI / 180) * _shotSpeed;
					shot2.yVel = Math.sin(shot2.rotation * Math.PI / 180) * _shotSpeed;
					shot3.xVel = Math.cos(shot3.rotation * Math.PI / 180) * _shotSpeed;
					shot3.yVel = Math.sin(shot3.rotation * Math.PI / 180) * _shotSpeed;
					shot4.xVel = Math.cos(shot4.rotation * Math.PI / 180) * _shotSpeed;
					shot4.yVel = Math.sin(shot4.rotation * Math.PI / 180) * _shotSpeed;

					bl.addChild(shot.shadow);
					bl.addChild(shot2.shadow);
					bl.addChild(shot3.shadow);
					bl.addChild(shot4.shadow);
					tl.addChild(shot);
					tl.addChild(shot2);
					tl.addChild(shot3);
					tl.addChild(shot4);
					eB.push(shot);
					eB.push(shot2);
					eB.push(shot3);
					eB.push(shot4);
					_fireCount = 0;
				}

				if (p.numCycles <= 60) {
						p.shootRotation.rotation = targetAngle;
				} 
			}if (p.numCycles >= 61 && p.numCycles <= 230) {
					p.shootRotation.rotation += 1.5;
				}
				if (p.numCycles >= 231 && p.numCycles <= 429) {
					p.shootRotation.rotation -= 1.5;
				}
				if (p.numCycles >= 430) {
					p.numCycles = 61
				}
			if (p.health <= 650) {
				p.setState(Mephistopheles.TRIPLE);
			}
		}
		public function enter(p: Mephistopheles): void {

		}

		public function exit(p: Mephistopheles): void {

		}
	}
}