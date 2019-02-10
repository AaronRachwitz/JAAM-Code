package Context.bigtentaclestates
{
	
	import Context.BigTentacle;
	import flash.display.DisplayObjectContainer;
	
	public class AttackGateState implements IBigTentacleState{

		
		public function update(a:BigTentacle):void
		{
			a.velocity.x = 0;
			a.velocity.y = 0;
			
		}
		
		public function enter(a:BigTentacle):void
		{
			
		}
		
		public function exit(a:BigTentacle):void
		{
			
		}

	}
	
}
