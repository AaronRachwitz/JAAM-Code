package Context.beelzebubstates {

	import flash.display.DisplayObjectContainer;
	import Context.Beelzebub;
	import Context.Player;

	public interface IBeelzebubState {
		function update(p: Beelzebub): void;
		function exit(p: Beelzebub):void;
		function enter(p: Beelzebub):void;
	}

}