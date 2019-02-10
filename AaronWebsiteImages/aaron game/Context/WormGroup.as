package Context {
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.display.MovieClip;
	import Context.Worm;

	public class WormGroup extends Sprite {

		public var worms: Array;
		private var _numWorms:uint = 3;
		
		public var shadow:MovieClip;
		
		public var health;
		
		private var _wormReach:Number = 0;
		private var _wormReach2:Number = 0;
		private var _change:Number = 5;

		public function WormGroup(bl:DisplayObjectContainer) {
			
			worms = new Array();			
			health = 300;
			
			for (var i: uint = 0; i < _numWorms; i++) {
				var w:Worm = new Worm();
				
				w.y = Math.random() * 700 + 100;
				w.x = 50;
				
				bl.addChild(w);
				worms.push(w);
			}
			
			addShadow(bl);
		}
		private function addShadow(bl:DisplayObjectContainer):void {
			shadow = new GShadow;
			shadow.y = -2000;
			shadow.height = 4;
			bl.addChild(shadow);
		}
		
		public function update(): void {
			
			_wormReach += _change;
			_wormReach2 -= _change;
			
			health--;
			
			if (_wormReach >= 20) {
				_change = -5;
			}
			if (_wormReach <= -20) {
				_change = 5;
			}
			
			var w1:Worm = worms[2];
			w1.x += 5;
			
			shadow.x = w1.x + 15;
			shadow.y = w1.y + 2;
			
			var target:Point = reach(worms[0], (w1.x + 100), (w1.y + _wormReach));
			var target2:Point = reach(worms[1], (w1.x + 50), (w1.y + _wormReach2));
			
			for (var i:uint = 1; i < _numWorms; i++) {
				var w:Worm = worms[i];
				target = reach(w, target.x, target.y);
			}

			target2 = reach(w1, target2.x, target2.y);
			
			for (i = _numWorms - 1; i > 0; i --) {
				var segmentA:Worm = worms[i];
				var segmentB:Worm = worms[i - 1];
				position(segmentB, segmentA);
			}
		}
		
		private function reach(segment: Worm, xpos: Number, ypos: Number): Point {
			var dx: Number = xpos - segment.x;
			var dy: Number = ypos - segment.y;
			var angle: Number = Math.atan2(dy, dx);
			segment.rotation = angle * 180 / Math.PI;

			var w: Number = segment.getPin().x - segment.x;
			var h: Number = segment.getPin().y - segment.y;
			var tx:Number = xpos - w;
			var ty:Number = ypos - h;
			return new Point(tx, ty);
		}
		
		private function position(segmentA:Worm, segmentB:Worm):void {
			segmentA.x = segmentB.getPin().x;
			segmentA.y = segmentB.getPin().y;
		}
	}
}