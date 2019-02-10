package Context
{
	import flash.display.Sprite;
	import flash.geom.Point;

	public class Worm extends Sprite
	{
		
		public function Segment()
		{
			
		}
		
		public function getPin():Point
		{
			var angle:Number = rotation * Math.PI / 180;
			var xPos:Number = x + Math.cos(angle) * this.width;
			var yPos:Number = y + Math.sin(angle) * this.width;
			return new Point(xPos, yPos);
		}
	}
}