package Context.werewolfstates
{
	
	import Context.Werewolf;
	public class AttackGateState implements IWerewolfState{

		
		public function update(a:Werewolf):void
		{
			a.velocity.x = 0;
			a.velocity.y = 0;
			
		}
		
		public function enter(a:Werewolf):void
		{
			
		}
		
		public function exit(a:Werewolf):void
		{
			
		}

	}
	
}
