package Context.playerstates {

	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import Context.Projectile;
	import Context.Player;

	public interface IPlayerState {
		function update(p: Player, b:DisplayObjectContainer, bullets:Array, s:DisplayObjectContainer): void;
		function left(p: Player, b:Sprite):Number;
		function right(p: Player, b:Sprite):Number;
	}

}