package Context.cloudstates 
{
	import Context.Cloud;
	
	public interface ICloudState 
	{
		function update(a:Cloud):void;
		function enter(a:Cloud):void;
		function exit(a:Cloud):void;
	}
	
}
