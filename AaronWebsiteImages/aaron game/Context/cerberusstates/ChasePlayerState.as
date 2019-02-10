package Context.cerberusstates {
	
	import Context.Cerberus
	
	public class ChasePlayerState implements ICerberusState{

		public function update(a:Cerberus):void {
			
			var dx:Number = a.playerTarget.x - a.x;
			var dy:Number = a.playerTarget.y - a.y;
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
			
			a.speed = 7;
			
			if (a.distanceToPlayer > 300) {
				a.setState(Cerberus.CHASE);
			}
			if (a.distanceToPlayer < 25) {
				a.setState(Cerberus.ATTACK);
			}
		}
		public function enter(a:Cerberus):void
		{
			
		}
		
		public function exit(a:Cerberus):void
		{
			
		}

	}
	
}
