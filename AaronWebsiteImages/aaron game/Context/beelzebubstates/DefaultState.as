package Context.beelzebubstates
{

	import Context.Beelzebub;

	public class DefaultState implements IBeelzebubState
	{

		public function update(p: Beelzebub):void
		{
			var dx:Number = p.locationTarget.x - p.x;
			var dy:Number = p.locationTarget.y - p.y;
			var rad:Number = Math.atan2(dy,dx);
			p.velocity.x = Math.cos(rad);
			p.velocity.y = Math.sin(rad);

			if (p.health >= 800)
			{
				p.speed = 2;
			}
			if (p.health >= 600 && p.health <= 800)
			{
				p.speed = 3;
			}
			if (p.health >= 400 && p.health <= 600)
			{
				p.speed = 5;
			}
			if (p.health >= 200 && p.health <= 400)
			{
				p.speed = 7;
			}

			if (p.distanceToLocation <= 60)
			{
				p.setState(Beelzebub.FIND);
			}


		}
		public function enter(p: Beelzebub):void
		{

		}

		public function exit(p: Beelzebub):void
		{

		}
	}
}