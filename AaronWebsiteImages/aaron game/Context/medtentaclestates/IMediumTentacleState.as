package Context.medtentaclestates 
{
	import Context.MediumTentacle;
	
	public interface IMediumTentacleState 
	{
		function update(a:MediumTentacle):void;
		function enter(a:MediumTentacle):void;
		function exit(a:MediumTentacle):void;
	}
	
}