package Context.satanstates {

	import Context.Satan;

	public interface ISatanState {
		function update(p: Satan): void;
		function exit(p: Satan):void;
		function enter(p: Satan):void;
	}

}