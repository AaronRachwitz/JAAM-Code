package Context.gargoylestates
{
	import Context.Gargoyle;
	public class AttackState implements IGargoyleState
	{

		public function update(a:Gargoyle):void
		{
			a.velocity.x = 0;
			a.velocity.y = 0;

			if (a.shadow.hitTestObject(a.target.shadow) == false) {
				a.setState(Gargoyle.CHASE);
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