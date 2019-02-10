package Context.bigtentaclestates 
{
	import Context.BigTentacle;
	import Context.Projectile;
	import flash.geom.Point;
	import flash.display.DisplayObjectContainer;
	
	public class ChaseGateState implements IBigTentacleState
	{
		private var _fireCount: int = 0;
		private var _fireDelay: int = 10;
		private var _shotSpeed: Number = 15;
		private var _turnRate: Number = 30;
		
		public function update(a:BigTentacle):void
		{
			var dx:Number = a.gateTarget.x - a.x;
			var dy:Number = a.gateTarget.y - a.y;
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
			
			a.speed = 2;
			
			_fireCount++;

		}
		
		public function enter(a:BigTentacle):void
		{
			var dx:Number = a.target.x - a.x;
			var dy:Number = a.target.y - a.y;
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
			
			a.speed = 0;
		}
		
		public function exit(a:BigTentacle):void
		{
			
		}
		
	}

}