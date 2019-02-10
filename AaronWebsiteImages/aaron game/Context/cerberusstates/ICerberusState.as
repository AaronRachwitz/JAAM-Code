package Context.cerberusstates 
{
	import Context.Cerberus;
	
	public interface ICerberusState 
	{
		function update(a:Cerberus):void;
		function enter(a:Cerberus):void;
		function exit(a:Cerberus):void;
	}
	
}