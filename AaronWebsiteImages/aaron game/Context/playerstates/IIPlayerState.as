package Context.playerstates {

	import flash.display.DisplayObjectContainer;
	import Context.Player;

	public interface IIPlayerState {
		function update(p: Player, b:DisplayObjectContainer): void;
	}

}