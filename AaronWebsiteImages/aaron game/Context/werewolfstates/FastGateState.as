package Context.werewolfstates {
	import Context.Werewolf;
	
	public class FastGateState implements IWerewolfState {
		

		public function update(a:Werewolf):void
		{
			var dx:Number = a.target.x - a.x;
			var dy:Number = a.target.y - a.y;
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
			
			a.speed = 12;
			
			if (a.numCycles >= 30) {
				a.setState(Werewolf.CHASE)
				a.numCycles = 0;
			}
		}

		public function enter(a:Werewolf):void
		{
			var dx:Number = a.target.x - a.x;
			var dy:Number = a.target.y - a.y;
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
			
			a.speed = 0;
		}
		
		public function exit(a:Werewolf):void
		{
			
		}
	}
}
