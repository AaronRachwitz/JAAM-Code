package Context.satanstates {

	import Context.Satan;
	import flash.geom.Point;

	public class DefaultState implements ISatanState {


		public function update(p: Satan): void {

			var dx:Number = p.locationTarget.x - p.x;
			var dy:Number = p.locationTarget.y - p.y;
			var rad:Number = Math.atan2(dy,dx);
			p.velocity.x = Math.cos(rad);
			p.velocity.y = Math.sin(rad);
			
			p.speed = 10;
			
			if (p.distanceToLocation <= 60)
			{
				p.setState(Satan.FIND);
			}

		}
		public function enter(p: Satan): void {

		}

		public function exit(p: Satan): void {

		}
	}
}