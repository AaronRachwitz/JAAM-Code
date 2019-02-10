package Context.buerstates {
	
	import Context.Buer;
	
	public class IdleState implements IBuerState {

		public function update(a:Buer):void
		{
			var dx:Number = a.target.x - a.x;
			var dy:Number = a.target.y - a.y;
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
			
			if (a.numCycles >= 15) {
				a.setState(Buer.CHASE);
				
				a.numCycles = 0;
			}
			
			a.speed = 0;
		}
		
		public function enter(a:Buer):void
		{
			var dx:Number = a.target.x - a.x;
			var dy:Number = a.target.y - a.y;
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
			
			a.speed = 0;
		}
		
		public function exit(a:Buer):void
		{
			
		}
		
	}

}