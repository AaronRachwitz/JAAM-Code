package Context
{

	import Context.playerstates.IPlayerState;
	import Context.playerstates.IIPlayerState;
	import Context.playerstates.DefaultState;
	import Context.playerstates.ThreeState;
	import Context.playerstates.SilverState;
	import Context.playerstates.NoneState;
	import Context.Projectile;
	import flash.display.MovieClip;
	import flash.display.Graphics;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.Sprite;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;

	public class Player extends MovieClip
	{

		public static const DEFAULT: IPlayerState = new DefaultState();
		public static const THREE: IPlayerState = new ThreeState();
		public static const SILVER: IPlayerState = new SilverState();

		public static const NOTHING: IIPlayerState = new NoneState();

		public var target:Point = new Point(mouseX,mouseY);
		private var _shotLayer:DisplayObjectContainer;
		private var _shadLayer:DisplayObjectContainer;
		private var _ui: Sprite;

		public var shadow:MovieClip;

		private var _attackNumber:Number = 0;

		public var _attackState:IPlayerState;
		public var playerState:Number;
		private var _defenseState:IIPlayerState;

		private var _bullets:Array;
		public var fireCount:int = 0;

		public var holyWater:MovieClip = new holyWaterClip  ;
		public var silverBullet:MovieClip = new silverBulletClip  ;
		public var crossbow:MovieClip = new crossbowClip  ;

		public var shootRotation: MovieClip = new MovieClip();

		private var _Right:Boolean;
		private var _Left:Boolean;
		private var _Up:Boolean;
		private var _Down:Boolean;
		private var _left:Boolean;
		private var _right:Boolean;
		public var special:Boolean;
		public var shoot:Boolean;

		public function Player(bullets: Array, ui: Sprite, pl:DisplayObjectContainer, bl:DisplayObjectContainer)
		{
			_shotLayer = pl;
			_shadLayer = bl;
			_bullets = bullets;
			_ui = ui

			if (pl != null)
			{
				pl.addChild(shootRotation);
			}

			if (ui != null)
			{
				ui.addChild(holyWater);
				holyWater.x = 99.95;
				holyWater.y = 955.35;
				holyWater.width = 45;
				holyWater.height = 45;
			}

			_attackState = DEFAULT;
			_defenseState = NOTHING;

			if (bl != null)
			{
				shadow = new PShadow  ;
				bl.addChild(shadow);
			}
		}
		public function mouseDown(e: MouseEvent):void
		{
			shoot = true;
		}
		public function mouseUp(e: MouseEvent):void
		{
			shoot = false;
		}
		public function pressDown(e: KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.D)
			{
				_Right = true;
			}
			if (e.keyCode == Keyboard.A)
			{
				_Left = true;
			}
			if (e.keyCode == Keyboard.W)
			{
				_Up = true;
			}
			if (e.keyCode == Keyboard.S)
			{
				_Down = true;
			}
			if (e.keyCode == Keyboard.Q && _right != true)
			{
				_attackNumber +=  _attackState.left(this,_ui);
				_left = true;

			}
			if (e.keyCode == Keyboard.E && _left != true)
			{
				_attackNumber +=  _attackState.right(this,_ui);
				_right = true;
			}
		}
		public function pressUp(e: KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.D)
			{
				_Right = false;
			}
			if (e.keyCode == Keyboard.A)
			{
				_Left = false;
			}
			if (e.keyCode == Keyboard.W)
			{
				_Up = false;
			}
			if (e.keyCode == Keyboard.S)
			{
				_Down = false;
			}
			if (e.keyCode == Keyboard.Q)
			{
				_left = false;

			}
			if (e.keyCode == Keyboard.E)
			{
				_right = false;
			}
		}

		public function playAnimation(frame: Number):void
		{
			this.gotoAndPlay(frame);
		}

		public function update():void
		{
			shootRotation.x = this.x;
			shootRotation.y = this.y;

			fireCount++;

			_attackState.update(this, _shotLayer, _bullets, _shadLayer);

			if (_attackNumber == 0)
			{
				_attackState = DEFAULT;
				playerState = 0;
			}
			else if (_attackNumber == -1)
			{
				_attackState = THREE;
				playerState = -1;
			}
			else if (_attackNumber == 1)
			{
				_attackState = SILVER;
				playerState = 1;
			}

			var playerHalfWidth:Number = 20;
			var playerHalfHeight:Number = 20;

			if (_Right)
			{
				x +=  10;
			}
			if (_Left)
			{
				x -=  10;
			}
			if (_Up)
			{
				y -=  10;
			}
			if (_Down)
			{
				y +=  10;
			}

			if (this.x + playerHalfWidth > 1140)
			{
				this.x = 1140 - playerHalfWidth;
			}
			else if (this.x - playerHalfWidth < 80)
			{
				this.x = 80 + playerHalfWidth;
			}
			if (this.y + playerHalfHeight > 835)
			{
				this.y = 835 - playerHalfHeight;
			}
			else if (this.y - playerHalfHeight < 100)
			{
				this.y = 100 + playerHalfHeight;
			}

			shadow.x = this.x;
			shadow.y = this.y + 57.6;
		}

		public function setAttackState(newState: IPlayerState):void
		{
			if (_attackState == newState)
			{
				return;
			}

			_attackState = newState;
		}
		public function setDefenseState(newState: IIPlayerState):void
		{
			if (_defenseState == newState)
			{
				return;
			}

			_defenseState = newState;
		}
	}
}