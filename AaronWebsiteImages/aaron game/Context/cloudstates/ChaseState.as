package Context.cloudstates
{
	import Context.Cloud;
	public class ChaseState implements ICloudState
	{
		private var _dx:Number;
		private var _dy:Number;

		public function update(a:Cloud):void
		{
			_dx = a.target.x - a.x;
			_dy = a.target.y - a.y;
			var rad:Number = Math.atan2(_dy,_dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);

			a.speed = 7;
		}

		public function enter(a:Cloud):void
		{
			var dx:Number = a.target.x - a.x;
			var dy:Number = a.target.y - a.y;
			var rad:Number = Math.atan2(dy,dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);

			a.speed = 0;
		}

		public function exit(a:Cloud):void
		{

		}

	}

}