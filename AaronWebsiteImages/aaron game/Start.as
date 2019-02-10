package {
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.display.MovieClip;
	import flash.ui.Mouse;

	public class Start extends MovieClip {
		
		public var startMenu: StartScreen = new StartScreen();
		private var _music:Sound;
		private var _musicChannel:SoundChannel;

		public function Start() {

			createStartMenu();
			_music = new StartScreenMusic();
			_musicChannel = new SoundChannel();
			_musicChannel = _music.play();
		}

		private function createStartMenu(): void {
			

			addChild(startMenu);

			startMenu.start_btn.addEventListener(MouseEvent.CLICK, startGameHandler);
			startMenu.howTo_btn.addEventListener(MouseEvent.CLICK, howTo);
		}

		private function startGameHandler(evt: MouseEvent): void {
			removeChild(evt.currentTarget.parent);

			evt.currentTarget.removeEventListener(MouseEvent.CLICK, startGameHandler);

			createGame();
		}
		
		private function howTo(evt: MouseEvent):void {
			startMenu.start_btn.removeEventListener(MouseEvent.CLICK, startGameHandler);
			startMenu.howTo_btn.removeEventListener(MouseEvent.CLICK, howTo);
			startMenu.gotoAndPlay(9);
			startMenu.back_btn.addEventListener(MouseEvent.CLICK, backToStart);
		}
		
		private function backToStart(evt:MouseEvent):void {
			startMenu.back_btn.removeEventListener(MouseEvent.CLICK, backToStart);
			startMenu.gotoAndPlay(1);
			startMenu.start_btn.addEventListener(MouseEvent.CLICK, startGameHandler);
			startMenu.howTo_btn.addEventListener(MouseEvent.CLICK, howTo);
		}

		private function createGame(): void {
			var game: Main = new Main();
			_musicChannel.stop();
			
			addChild(game);
		}
	}
}