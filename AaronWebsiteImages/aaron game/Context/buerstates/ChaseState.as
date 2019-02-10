package  Context.buerstates
{
	import Context.Buer;
	public class ChaseState implements IBuerState
	{
		private var _dx:Number;
		private var _dy:Number;

		public function update(a:Buer):void
		{
			if (a.numCycles >= 15){
				_dx = 0;
				_dy = a.target.y - a.y;
				var rad:Number = Math.atan2(_dy,_dx);
				a.velocity.y = Math.sin(rad);
			}

			a.speed = 7;
			
			if (a.numCycles >= 30){
				a.setState(Buer.CHASEX)
				a.numCycles = 0;
			}
		}

		public function enter(a:Buer):void
		{
			var dx:Number = 0;
			var dy:Number = a.target.y - a.y;
			var rad:Number = Math.atan2(dy,dx);
			a.velocity.y = Math.sin(rad);

			a.speed = 0;
		}

		public function exit(a:Buer):void
		{

		}

	}

}

