package Context.beelzebubstates {
	
	import Context.Beelzebub;
	import flash.geom.Point;
	
	public class FindLocationState implements IBeelzebubState {

		public function update(p: Beelzebub): void {
		
		p.locationTarget = new Point(Math.random()*800 + 100, Math.random()*800 + 100);
		p.setState(Beelzebub.DEFAULT);
		
		}
		public function enter(p: Beelzebub): void {


		}

		public function exit(p: Beelzebub): void {


		}

	}
	
}
