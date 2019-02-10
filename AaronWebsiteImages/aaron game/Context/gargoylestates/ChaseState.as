package Context.gargoylestates
{
	import Context.Gargoyle;
	public class ChaseState implements IGargoyleState
	{


		public function update(a:Gargoyle):void
		{
			var dx:Number = a.target.x  - a.x;
			var dy:Number = (a.target.y - 15) - a.y;
			var rad:Number = Math.atan2(dy,dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);

			a.speed = 9;
			
			if (a.shadow.hitTestObject(a.target.shadow) == true) {
				a.setState(Gargoyle.ATTACK);
			}
		}

		public function enter(a:Gargoyle):void
		{
			
		}

		public function exit(a:Gargoyle):void
		{

		}

	}

}