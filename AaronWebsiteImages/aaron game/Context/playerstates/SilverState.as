package Context.playerstates {
	
	import Context.Projectile;
	import Context.Player;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class SilverState implements IPlayerState{
		
		private var _fireDelay: int = 16;
		private var _shotSpeed: Number = 17.5;
		private var _turnRate: Number = 30;
		

		public function update(p:Player, b:DisplayObjectContainer, bullets:Array, s:DisplayObjectContainer): void{
			var shot: Projectile;

			if (p.target != null) {
				p.target = new Point(b.mouseX, b.mouseY);
				var targetAngle: Number = Math.atan2(p.target.y - p.shootRotation.y, p.target.x - p.shootRotation.x) * 180 / Math.PI;

				if (p.fireCount >= _fireDelay && p.shoot == true) {
					//call interface, shoot depending on state
					shot = new SilverBullet();
					shot.silver = true;
					shot.life = 150;
					shot.x = p.shootRotation.x + Math.cos(p.shootRotation.rotation * Math.PI / 180) * -5;
					shot.y = p.shootRotation.y + Math.sin(p.shootRotation.rotation * Math.PI / 180) * -5;
					shot.rotation += p.shootRotation.rotation;

					shot.xVel = Math.cos(p.shootRotation.rotation * Math.PI / 180) * _shotSpeed;
					shot.yVel = Math.sin(p.shootRotation.rotation * Math.PI / 180) * _shotSpeed;
					
					s.addChild(shot.shadow);
					b.addChild(shot);
					bullets.push(shot);
					p.fireCount = 0;

				}
				p.shootRotation.rotation = targetAngle;
				
			}
		}
		public function left(p: Player, b:Sprite):Number {
			b.addChild (p.holyWater);
			p.holyWater.x = 99.95;
			p.holyWater.y = 955.35;
			p.holyWater.width = 44;
			p.holyWater.height = 44;
			
			b.removeChild (p.silverBullet);
			
			return -1
		}
		public function right(p: Player, b:Sprite):Number {
			b.addChild (p.crossbow);
			p.crossbow.x = 99.95;
			p.crossbow.y = 955.35;
			p.crossbow.width = 47;
			p.crossbow.height = 47;
			
			b.removeChild (p.silverBullet);
			
			return -2
		}
	}	
}
