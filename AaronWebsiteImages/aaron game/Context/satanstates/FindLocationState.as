package Context.satanstates {

	import Context.Satan;
	import flash.geom.Point;

	public class FindLocationState implements ISatanState {

		public function update(p: Satan): void {

			var l: Number = randomRange(0, 5);

			if (l == 1) {
				p.locationTarget = new Point(150, 300);
			}
			if (l == 2) {
				p.locationTarget = new Point(1050, 300);
			}
			if (l == 3) {
				p.locationTarget = new Point(600, 500);
			}
			if (l == 4) {
				p.locationTarget = new Point(150, 750);
			}
			if (l == 5) {
				p.locationTarget = new Point(1050, 750);
			}

			p.speed = 0;
			if (p.numCycles >= 40) {
				p.setState(Satan.DEFAULT);
				p.numCycles = 0;
			}


		}

		private function randomRange(minNum: Number, maxNum: Number): Number {
			return (Math.ceil(Math.random() * (maxNum - minNum)) + minNum);
		}

		public function enter(p: Satan): void {


		}

		public function exit(p: Satan): void {


		}

	}

}