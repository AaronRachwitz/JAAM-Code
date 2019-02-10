package Context.mephistophelesstates {

	import flash.display.DisplayObjectContainer;
	import Context.Mephistopheles;

	public interface IMephistophelesState {
		function update(p: Mephistopheles, eB: Array, tl: DisplayObjectContainer, bl:DisplayObjectContainer): void;
		function exit(p: Mephistopheles):void;
		function enter(p: Mephistopheles):void;
	}

}