package Context.firestates 
{
	import Context.Fire;
	
	public interface IFireState 
	{
		function update(a:Fire):void;
		function enter(a:Fire):void;
		function exit(a:Fire):void;
	}
	
}