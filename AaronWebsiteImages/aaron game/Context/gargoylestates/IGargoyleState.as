package Context.gargoylestates 
{
	import Context.Gargoyle;
	
	public interface IGargoyleState 
	{
		function update(a:Gargoyle):void;
		function enter(a:Gargoyle):void;
		function exit(a:Gargoyle):void;
	}
	
}