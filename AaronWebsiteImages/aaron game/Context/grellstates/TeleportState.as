package Context.grellstates
{

	import Context.Grell;

	public class TeleportState implements IGrellState
	{

		public function update(a: Grell):void
		{

			if (a.numCycles < 2)
			{
				a.x = Math.random() * 800 + 100;
				a.y = Math.random() * 700 + 100;
			}

			if (a.numCycles >= 10)
			{
				a.setState(Grell.STILL);
			}
		}

		public function enter(a: Grell):void
		{

		}

		public function exit(a: Grell):void
		{
		}

	}

}