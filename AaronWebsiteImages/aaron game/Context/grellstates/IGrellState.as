package Context.grellstates 
{
	import Context.Grell;
	import Context.Projectile;
	import flash.display.DisplayObjectContainer;
	
	public interface IGrellState 
	{
		function update(a:Grell):void;
		function enter(a:Grell):void;
		function exit(a:Grell):void;
	}
	
}