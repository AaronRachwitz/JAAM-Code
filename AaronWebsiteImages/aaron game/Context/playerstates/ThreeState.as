package Context.playerstates {
	
	import Context.Projectile;
	import Context.Player;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class ThreeState implements IPlayerState{
		
		private var _fireDelay: int = 8;
		private var _shotSpeed: Number = 12.5;
		private var _turnRate: Number = 30;
		

		public function update(p:Player, b:DisplayObjectContainer, bullets:Array, s:DisplayObjectContainer):void{
			var shot: Projectile;
			var shot2: Projectile;
			var shot3: Projectile;

			if (p.target != null) {
				p.target = new Point(b.mouseX, b.mouseY);
				var targetAngle: Number = Math.atan2(p.target.y - p.shootRotation.y, p.target.x - p.shootRotation.x) * 180 / Math.PI;

				if (p.fireCount >= _fireDelay && p.shoot == true) {
					//call interface, shoot depending on state
					shot = new ThreeBullet();
					shot2 = new ThreeBullet();
					shot3 = new ThreeBullet();
					shot.life = 20;
					shot2.life = 20;
					shot3.life = 20;
					shot.triple = true;
					shot2.triple = true;
					shot3.triple = true;
					shot.x = p.shootRotation.x + Math.cos(p.shootRotation.rotation * Math.PI / 180);
					shot.y = p.shootRotation.y + Math.sin(p.shootRotation.rotation * Math.PI / 180);
					shot2.x = p.shootRotation.x + Math.cos(p.shootRotation.rotation * Math.PI / 180);
					shot2.y = p.shootRotation.y + Math.sin(p.shootRotation.rotation * Math.PI / 180);
					shot3.x = p.shootRotation.x + Math.cos(p.shootRotation.rotation * Math.PI / 180);
					shot3.y = p.shootRotation.y + Math.sin(p.shootRotation.rotation * Math.PI / 180);
					shot.rotation += p.shootRotation.rotation;
					shot2.rotation += p.shootRotation.rotation + 4;
					shot3.rotation += p.shootRotation.rotation - 4;

					shot.xVel = Math.cos(p.shootRotation.rotation * Math.PI / 180) * _shotSpeed;
					shot.yVel = Math.sin(p.shootRotation.rotation * Math.PI / 180) * _shotSpeed;
					shot2.xVel = Math.cos(shot2.rotation * Math.PI / 180) * _shotSpeed;
					shot2.yVel = Math.sin(shot2.rotation * Math.PI / 180) * _shotSpeed;
					shot3.xVel = Math.cos(shot3.rotation * Math.PI / 180) * _shotSpeed;
					shot3.yVel = Math.sin(shot3.rotation * Math.PI / 180) * _shotSpeed;
					
					s.addChild(shot.shadow);
					s.addChild(shot2.shadow);
					s.addChild(shot3.shadow);
					b.addChild(shot);
					b.addChild(shot3);
					b.addChild(shot2);
					bullets.push(shot);
					bullets.push(shot2);
					bullets.push(shot3);
					
					p.fireCount = 0;
				}

				p.shootRotation.rotation = targetAngle;
				
			}
		}
		public function left(p: Player, b:Sprite):Number {
			b.addChild (p.silverBullet);
			p.silverBullet.x = 99.95;
			p.silverBullet.y = 955.35;
			p.silverBullet.width = 55;
			p.silverBullet.height = 55;
			
			b.removeChild (p.crossbow);
			
			return 2
		}
		public function right(p: Player, b:Sprite):Number {
			b.addChild (p.holyWater);
			p.holyWater.x = 99.95;
			p.holyWater.y =  955.35;
			p.holyWater.width = 44;
			p.holyWater.height = 44;
			
			b.removeChild (p.crossbow);
			
			return 1
		}
	}	
}
