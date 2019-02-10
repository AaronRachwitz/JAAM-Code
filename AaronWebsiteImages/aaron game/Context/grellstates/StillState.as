package Context.grellstates {
	
	import Context.Grell;
	public class StillState implements IGrellState {


		public function update(a: Grell): void {
			
			if (a.numCycles >= 20) {
				a.setState(Grell.SHOOT);
			}
		}

		public function enter(a: Grell): void {
			
		}

		public function exit(a: Grell): void {

		}

	}

}