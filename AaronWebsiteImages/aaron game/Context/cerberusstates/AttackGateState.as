package Context.cerberusstates
{
	
	import Context.Cerberus;
	public class AttackGateState implements ICerberusState{

		
		public function update(a:Cerberus):void
		{
			a.velocity.x = 0;
			a.velocity.y = 0;
			
			if (a.shadow.hitTestObject(a.playerTarget.shadow) == false && a.y < 850) {
				a.setState(Cerberus.CHASEP);
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
