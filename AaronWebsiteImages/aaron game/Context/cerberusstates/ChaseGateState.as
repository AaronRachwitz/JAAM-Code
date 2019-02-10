package Context.cerberusstates 
{
	import Context.Cerberus;
	public class ChaseGateState implements ICerberusState
	{
		
		public function update(a:Cerberus):void
		{
			
			var dx:Number = a.target.x - a.x;
			var dy:Number = a.target.y - a.y;
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
			
			a.speed = 5;
			
			if (a.distanceToPlayer < 200) {
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