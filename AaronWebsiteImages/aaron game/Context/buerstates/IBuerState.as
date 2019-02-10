package Context.buerstates 
{
	import Context.Buer;
	
	public interface IBuerState 
	{
		function update(a:Buer):void;
		function enter(a:Buer):void;
		function exit(a:Buer):void;
	}
	
}