package Context.firestates 
{
	import Context.Fire;
	public class ChaseState implements IFireState
	{
		
		
		public function update(a:Fire):void
		{
			
			a.speed = 15;
		}
		
		public function enter(a:Fire):void
		{
			
		}
		
		public function exit(a:Fire):void
		{
			
		}
		
	}

}