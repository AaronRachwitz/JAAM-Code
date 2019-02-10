package Context {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Projectile extends MovieClip
	{
		
		public var xVel:Number;
		public var yVel:Number;
		public var life:Number;
		public var interacts:Boolean;
		public var normal:Boolean;
		public var triple:Boolean;
		public var silver:Boolean;
		public var enemy: Boolean;
		public var trident:Boolean;
		
		public var shadow: MovieClip;
		public var tridentShadow:MovieClip;
		
		public function Projectile()
		{
			life = 50;
			xVel = 0;
			yVel = 0;
			this.cacheAsBitmap = true;
			
			shadow = new ProjectileShadow;
			tridentShadow = new TridentShadow;
		}
		public function update():void
		{
			life--;
			
			x += xVel;
			y += yVel;
			
			shadow.x = this.x + Math.cos(shadow.rotation * Math.PI / 180);
			shadow.y = this.y + 60.3; 
			
			shadow.rotation = this.rotation;
			
			tridentShadow.x = this.x;
		}
	}
}