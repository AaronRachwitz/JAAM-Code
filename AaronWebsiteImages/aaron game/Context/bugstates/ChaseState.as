package Context.bugstates
{
	import Context.Bug;
	public class ChaseState implements IBugState
	{
		private var _dx:Number;
		private var _dy:Number;

		public function update(a:Bug):void
		{
			_dx = a.target.x - a.x;
			_dy = a.target.y - a.y;
			var rad:Number = Math.atan2(_dy,_dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);

			a.speed = 9;
		}

		public function enter(a:Bug):void
		{
			var dx:Number = a.target.x - a.x;
			var dy:Number = a.target.y - a.y;
			var rad:Number = Math.atan2(dy,dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);

			a.speed = 0;
		}

		public function exit(a:Bug):void
		{

		}

	}

}