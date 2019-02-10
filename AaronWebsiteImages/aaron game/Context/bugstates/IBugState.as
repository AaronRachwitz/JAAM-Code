package Context.bugstates 
{
	import Context.Bug;
	
	public interface IBugState 
	{
		function update(a:Bug):void;
		function enter(a:Bug):void;
		function exit(a:Bug):void;
	}
	
}