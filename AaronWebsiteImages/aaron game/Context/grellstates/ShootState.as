package Context.grellstates {
	import Context.Grell;
	public class ShootState implements IGrellState {

		public function update(a: Grell): void{
			
			if (a.numCycles >= 35) {
				a.fireCount = 0;
				a.setState(Grell.STILL2);
			}
		}

		public function enter(a: Grell): void {

		}

		public function exit(a: Grell): void {

		}

	}

}