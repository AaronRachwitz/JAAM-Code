package Context.medtentaclestates 
{
	import Context.MediumTentacle;
	public class ChaseState implements IMediumTentacleState
	{
		
		
		public function update(a:MediumTentacle):void
		{
			var monsterHalfWidth:Number = 20;
			var monsterHalfHeight:Number = 20;
			if (a.x + monsterHalfWidth > 1150)
			{
				a.x = 1150 - monsterHalfWidth;
				a.setState(MediumTentacle.IDLE);
				
			}
			else if (a.x - monsterHalfWidth < 70)
			{
				a.x = 70 + monsterHalfWidth;
				a.setState(MediumTentacle.IDLE);
			}
			if (a.y + monsterHalfHeight > 835)
			{
				a.y = 835 - monsterHalfHeight;
				a.setState(MediumTentacle.IDLE);
			}
			
			a.speed = 17;
			
			if (a.numCycles >= 20){
				a.setState(MediumTentacle.IDLE)
				a.numCycles = 0;
			}
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