package Context.werewolfstates
{
	import Context.Werewolf;
	import flash.geom.Point;
	
	public class JumpState implements IWerewolfState
	{
		
		private var _jumpPoint1:Point = new Point((Math.random()*800 + 100), 50);
		private var _jumpPoint2:Point;

		public function update(a:Werewolf):void
		{
			
			_jumpPoint2 = new Point((_jumpPoint1.x + 10), (_jumpPoint1.y - 100));
			
			if (a.numCycles <= 10)
			{
				var dx:Number = _jumpPoint1.x - a.x;
				var dy:Number = _jumpPoint1.y - a.y;
			}
			
			if (a.x == _jumpPoint1.x && a.y == _jumpPoint1.y)
			{
				a.x = _jumpPoint2.x;
				a.y = _jumpPoint2.y;
			}
			
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
			
			a.speed = 12;
			
			if (a.numCycles >= 10) {
				a.setState(Werewolf.CHASE)
				a.numCycles = 0;
			}
		}

		public function enter(a:Werewolf):void
		{
			
		}
		
		public function exit(a:Werewolf):void
		{
			
		}
	}
}
