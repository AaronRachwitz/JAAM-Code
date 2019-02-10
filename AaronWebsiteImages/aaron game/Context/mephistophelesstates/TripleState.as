package Context.mephistophelesstates {

	import Context.Projectile;
	import Context.Mephistopheles;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;

	public class TripleState implements IMephistophelesState {

		private var _fireCount: int = 0;
		private var _fireDelay: int = 1;
		private var _shotSpeed: Number = 13;
		private var _turnRate: Number = 30;

		public function update(p: Mephistopheles, eB: Array, tl: DisplayObjectContainer, bl: DisplayObjectContainer): void {
			_fireCount++;

			var shot: Projectile;
			var shot2: Projectile;
			var shot3: Projectile;
			var shot4: Projectile;
			var shot5: Projectile;



			if (_fireCount >= _fireDelay && p.numCycles >= 40) {
				shot = new ThreeBullet();
				shot2 = new ThreeBullet();
				shot3 = new ThreeBullet();
				shot4 = new ThreeBullet();
				shot5 = new ThreeBullet();

				shot.triple = true;
				shot2.triple = true;
				shot3.triple = true;
				shot4.triple = true;
				shot5.triple = true;

				shot.life = 45;
				shot2.life = 45;
				shot3.life = 45;
				shot4.life = 45;
				shot5.life = 45;
				shot.triple = true;
				shot2.triple = true;
				shot3.triple = true;
				shot4.triple = true;
				shot5.triple = true;
				shot.x = p.x + Math.cos(p.rotation * Math.PI / 180);
				shot.y = p.y + Math.sin(p.rotation * Math.PI / 180);
				shot2.x = p.x + Math.cos(p.rotation * Math.PI / 180);
				shot2.y = p.y + Math.sin(p.rotation * Math.PI / 180);
				shot3.x = p.x + Math.cos(p.rotation * Math.PI / 180);
				shot3.y = p.y + Math.sin(p.rotation * Math.PI / 180);
				shot4.x = p.x + Math.cos(p.rotation * Math.PI / 180);
				shot4.y = p.y + Math.sin(p.rotation * Math.PI / 180);
				shot5.x = p.x + Math.cos(p.rotation * Math.PI / 180);
				shot5.y = p.y + Math.sin(p.rotation * Math.PI / 180);
				shot.rotation += p.shootRotation.rotation;
				shot2.rotation += p.shootRotation.rotation + 4;
				shot3.rotation += p.shootRotation.rotation - 4;
				shot4.rotation += p.shootRotation.rotation + 8;
				shot5.rotation += p.shootRotation.rotation - 8;

				shot.xVel = Math.cos(shot.rotation * Math.PI / 180) * _shotSpeed;
				shot.yVel = Math.sin(shot.rotation * Math.PI / 180) * _shotSpeed;
				shot2.xVel = Math.cos(shot2.rotation * Math.PI / 180) * _shotSpeed;
				shot2.yVel = Math.sin(shot2.rotation * Math.PI / 180) * _shotSpeed;
				shot3.xVel = Math.cos(shot3.rotation * Math.PI / 180) * _shotSpeed;
				shot3.yVel = Math.sin(shot3.rotation * Math.PI / 180) * _shotSpeed;
				shot4.xVel = Math.cos(shot4.rotation * Math.PI / 180) * _shotSpeed;
				shot4.yVel = Math.sin(shot4.rotation * Math.PI / 180) * _shotSpeed;
				shot5.xVel = Math.cos(shot5.rotation * Math.PI / 180) * _shotSpeed;
				shot5.yVel = Math.sin(shot5.rotation * Math.PI / 180) * _shotSpeed;

				bl.addChild(shot.shadow);
				bl.addChild(shot2.shadow);
				bl.addChild(shot3.shadow);
				bl.addChild(shot4.shadow);
				bl.addChild(shot5.shadow);
				tl.addChild(shot);
				tl.addChild(shot2);
				tl.addChild(shot3);
				tl.addChild(shot4);
				tl.addChild(shot5);
				eB.push(shot);
				eB.push(shot2);
				eB.push(shot3);
				eB.push(shot4);
				eB.push(shot5);

				if (_fireCount >= 4) {
					_fireCount = -4;
				}
			}

			p.shootRotation.rotation += Math.random() * 10 + 5;

			if (p.health <= 350) {
				p.setState(Mephistopheles.SILVER);
			}
		}
		public function enter(p: Mephistopheles): void {

		}

		public function exit(p: Mephistopheles): void {

		}
	}
}