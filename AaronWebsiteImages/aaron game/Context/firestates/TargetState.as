package Context.firestates 
{
	import Context.Fire;
	public class TargetState implements IFireState
	{
		
		
		public function update(a:Fire):void
		{
			var dx:Number = a.target.x - a.x;
			var dy:Number = a.target.y - a.y;
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
		
			a.setState(Fire.CHASE);
			
		}
		
		public function enter(a:Fire):void {
			
		}
		
		public function exit(a:Fire):void
		{
			
		}
		
	}

}