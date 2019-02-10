package Context.werewolfstates 
{
	import Context.Werewolf;
	
	public interface IWerewolfState 
	{
		function update(a:Werewolf):void;
		function enter(a:Werewolf):void;
		function exit(a:Werewolf):void;
	}
	
}