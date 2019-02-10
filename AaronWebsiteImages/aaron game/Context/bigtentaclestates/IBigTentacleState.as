package Context.bigtentaclestates 
{
	import Context.BigTentacle;
	import flash.display.DisplayObjectContainer;
	
	public interface IBigTentacleState 
	{
		function update(a:BigTentacle):void;
		function enter(a:BigTentacle):void;
		function exit(a:BigTentacle):void;
	}
	
}