package Context.buerstates
{
	
	import Context.Buer;
	public class AttackGateState implements IBuerState{

		
		public function update(a:Buer):void
		{
			a.velocity.x = 0;
			a.velocity.y = 0;
			
		}
		
		public function enter(a:Buer):void
		{
			
		}
		
		public function exit(a:Buer):void
		{
			
		}

	}
	
}