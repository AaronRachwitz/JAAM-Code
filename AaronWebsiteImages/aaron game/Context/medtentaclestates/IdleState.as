package Context.medtentaclestates {
	
	import Context.MediumTentacle;
	
	public class IdleState implements IMediumTentacleState {

		public function update(a:MediumTentacle):void
		{
			var dx:Number = a.target.x - a.x;
			var dy:Number = a.target.y - a.y;
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
			
			if (a.numCycles >= 10) {
				a.setState(MediumTentacle.CHASE);
				
				a.numCycles = 0;
			}
			
			a.speed = 0;
		}
		
		public function enter(a:MediumTentacle):void
		{
			var dx:Number = a.target.x - a.x;
			var dy:Number = a.target.y - a.y;
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
			
			a.speed = 0;
		}
		
		public function exit(a:MediumTentacle):void
		{
			
		}
		
	}

}
