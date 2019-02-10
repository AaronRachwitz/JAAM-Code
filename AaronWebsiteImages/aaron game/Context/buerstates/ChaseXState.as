package  Context.buerstates
{
	import Context.Buer;
	public class ChaseXState implements IBuerState
	{
		private var _dx:Number;
		private var _dy:Number;

		public function update(a:Buer):void
		{
			//_dx = a.target.x - a.x;
			if (a.numCycles >= 15) {
				_dx = (Math.random() * 1000) - a.x;
				_dy = 0;
				var rad:Number = Math.atan2(_dy,_dx);
				a.velocity.x = Math.cos(rad);
			}

			a.speed = 7;
			
			if (a.numCycles >= 15){
				a.setState(Buer.IDLE)
				a.numCycles = 0;
			}
			
			var buerHalfWidth: Number = 20
			var buerHalfHeight: Number = 20
			
			if (a.x + buerHalfWidth > 1200) {
				a.x = 1200 - buerHalfWidth;
			} else if (a.x - buerHalfWidth < 1) {
				a.x = 1 + buerHalfWidth;
			}
			if (a.y + buerHalfHeight > 880) {
				a.y = 880 - buerHalfHeight;
			} else if (a.y - buerHalfHeight < 0) {
				a.y = 0 + buerHalfHeight;
			}
		}

		public function enter(a:Buer):void
		{
			var dx:Number = a.target.x - a.x;
			var dy:Number = 0;
			var rad:Number = Math.atan2(dy,dx);
			a.velocity.x = Math.cos(rad);
			//a.velocity.y = Math.sin(rad);

			a.speed = 0;
		}

		public function exit(a:Buer):void
		{

		}

	}

}

