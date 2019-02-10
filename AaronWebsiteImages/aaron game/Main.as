package {
	import Context.Gargoyle;
	import Context.Cerberus;
	import Context.Werewolf;
	import Context.BigTentacle;
	import Context.MediumTentacle;
	import Context.Grell;
	import Context.Buer;
	import Context.Mephistopheles;
	import Context.Beelzebub;
	import Context.Bug;
	import Context.Cloud;
	import Context.Satan;
	import Context.Fire;
	import Context.Player;
	import Context.WormGroup;
	import Context.Worm;
	import Context.Projectile;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.DisplayObjectContainer;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.media.Sound;
	import flash.media.SoundChannel;

	public class Main extends Sprite {

		private var _p: Player;
		private var _gameOverScreen: MovieClip;
		private var _winScreen: MovieClip;
		private var _deadP: Player;

		private var _music: Sound;
		private var _musicChannel: SoundChannel;

		private var _gargoyles: Array;
		private var _cerberi: Array;
		private var _werewolves: Array;
		private var _bigtentacles: Array;
		private var _medtentacles: Array;
		private var _grells: Array;
		private var _buers: Array;
		private var _meph: Array;
		private var _beel: Array;
		private var _bugs: Array;
		private var _Clouds: Array;
		private var _satan: Array;
		private var _fires: Array;
		private var _worms: Array;

		private var _mephBoss: Mephistopheles;
		private var _beelzeBoss: Beelzebub;
		private var _satanBoss: Satan;

		private var _firstBoss: Boolean;
		private var _secondBoss: Boolean;
		private var _thirdBoss: Boolean;

		private var _bullets: Array;
		private var _enemyBullets: Array;

		private var _gameDiff: Number;
		private var _waveInProgress: Boolean;

		private var _score: Number;
		private var _scoreText: TextField;
		private var _scoreTF: TextFormat;

		private var _enemyText: TextField;
		private var _enemyTF: TextFormat;

		private var _type1: Number;
		private var _type2: Number;
		private var _type3: Number;

		private var _1Diff: Number;
		private var _1Rate: Number;
		private var _1Delay: Number;
		private var _1Spawn: Number;
		private var _1Amount: Number;

		private var _2Diff: Number;
		private var _2Rate: Number;
		private var _2Delay: Number;
		private var _2Spawn: Number;
		private var _2Amount: Number;

		private var _3Diff: Number;
		private var _3Rate: Number;
		private var _3Delay: Number;
		private var _3Spawn: Number;
		private var _3Amount: Number;

		private var _4Diff: Number;
		private var _4Rate: Number;
		private var _4Delay: Number;
		private var _4Spawn: Number;
		private var _4Amount: Number;

		private var _5Diff: Number;
		private var _5Rate: Number;
		private var _5Delay: Number;
		private var _5Spawn: Number;
		private var _5Amount: Number;

		private var _6Diff: Number;
		private var _6Rate: Number;
		private var _6Delay: Number;
		private var _6Spawn: Number;
		private var _6Amount: Number;

		private var _7Diff: Number;
		private var _7Rate: Number;
		private var _7Delay: Number;
		private var _7Spawn: Number;
		private var _7Amount: Number;

		private var _totalAmount: Number;
		private var _waveAmount: Number;

		private var _gate: MovieClip;
		private var _gatehp: MovieClip;
		private var _playerhp: MovieClip;

		private var _beadAmount: Number;
		private var _oilAmount: Number;
		private var _bibleAmount: Number;
		private var _canNuke: Boolean;

		private var _beadText: TextField;
		private var _oilText: TextField;
		private var _bibleText: TextField;
		private var _itemTF: TextFormat;

		private var _buyhp: BuyHPButton;
		private var _buygatehp: BuyGateHPButton;
		private var _nuke: BuyNukeButton;
		private var _nukeScreen: Boolean;
		private var _smite: MovieClip;

		private var _background: Sprite;
		private var _topLayer: DisplayObjectContainer;
		private var _botLayer: DisplayObjectContainer;
		private var _uiLayer: Sprite;

		private var _waveTimer: Timer;
		private var _startNukeTimer: Timer;
		private var _stopNukeTimer: Timer;

		public function Main(): void {
			start();
		}
		private function start(): void {
			if (stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}

		private function init(e: Event = null): void {
			removeEventListener(Event.ADDED_TO_STAGE, init);

			waveNumbers();

			_background = new Level1();
			addChild(_background);
			_topLayer = new Sprite();
			_botLayer = new Sprite();
			_uiLayer = new UI();
			_uiLayer.x = 1200;

			_music = new WaveMusic();
			_musicChannel = new SoundChannel();

			_musicChannel = _music.play(0, 99);

			_score = 0;
			_scoreTF = new TextFormat();
			_scoreTF.size = 54;
			_scoreTF.color = 0xF0F65A;
			_scoreTF.font = "Viner Hand ITC";
			_scoreTF.align = "right";
			_scoreText = new TextField();
			_scoreText.width = 173.15;
			_scoreText.height = 91.15;
			_scoreText.x = 1200 + 13.8;
			_scoreText.y = 30;
			_scoreText.defaultTextFormat = _scoreTF;
			addChild(_scoreText);
			_scoreText.text = _score.toString();

			_enemyTF = new TextFormat();
			_enemyTF.size = 26;
			_enemyTF.color = 0xF0F65A;
			_enemyTF.font = "Viner Hand ITC";
			_enemyTF.align = "right";
			_enemyText = new TextField();
			_enemyText.width = 56.5;
			_enemyText.height = 53.95;
			_enemyText.x = 1200 + 128.05;
			_enemyText.y = 145.6;
			_enemyText.defaultTextFormat = _enemyTF;
			addChild(_enemyText);

			_beadAmount = 1;
			_oilAmount = 1;
			_bibleAmount = 2;

			_itemTF = new TextFormat();
			_itemTF.size = 45;
			_itemTF.color = 0xF0F65A;
			_itemTF.font = "Viner Hand ITC";
			_itemTF.align = "right";
			_beadText = new TextField();
			_beadText.width = 34.7;
			_beadText.height = 60.85;
			_beadText.height
			_beadText.x = 1337.15;
			_beadText.y = 420;
			_beadText.defaultTextFormat = _itemTF
			addChild(_beadText);
			_beadText.text = _beadAmount.toString();

			_oilText = new TextField();
			_oilText.width = 34.7;
			_oilText.height = 60.85;
			_oilText.x = 1234.75;
			_oilText.y = 420;
			_oilText.defaultTextFormat = _itemTF
			addChild(_oilText);
			_oilText.text = _oilAmount.toString();

			_bibleText = new TextField();
			_bibleText.width = 34.7;
			_bibleText.x = 1211.65;
			_bibleText.y = 571.55;
			_bibleText.defaultTextFormat = _itemTF
			addChild(_bibleText);
			_bibleText.text = _bibleAmount.toString();

			_gate = new GateClip();
			_gatehp = new Life();
			_playerhp = new Life();
			_buyhp = new BuyHPButton();
			_buygatehp = new BuyGateHPButton();
			_nuke = new BuyNukeButton();
			_nukeScreen = false;
			_canNuke = true;

			_gate.x = 600;
			_gate.y = 910;
			_gatehp.x = 1230.55;
			_gatehp.y = 831.15;
			_playerhp.x = 1230.55;
			_playerhp.y = 735.30;
			_buyhp.x = 123.75 + 1200;
			_buyhp.y = 489.75;
			_buygatehp.x = 29.75 + 1200;
			_buygatehp.y = 489.75;
			_nuke.x = 77 + 1200;
			_nuke.y = 584;

			_background.addChild(_gate);
			_background.addChildAt(_botLayer, 4);
			_background.addChildAt(_topLayer, 5);
			_background.addChildAt(_uiLayer, 6);
			_background.addChildAt(_gatehp, 7);
			_background.addChildAt(_playerhp, 7);
			_background.addChildAt(_buyhp, 7);
			_background.addChildAt(_buygatehp, 7);
			_background.addChildAt(_nuke, 7);
			_buyhp.addEventListener(MouseEvent.CLICK, restoreHP);
			_buygatehp.addEventListener(MouseEvent.CLICK, restoreGateHP);
			_nuke.addEventListener(MouseEvent.CLICK, nukeEverything);

			_gameDiff = 1;

			_1Diff = 1;
			_1Rate = 0.3;
			_1Delay = 150;
			_1Spawn = 0;
			_1Amount = 0;

			_2Diff = 1;
			_2Rate = 0.2;
			_2Delay = 220;
			_2Spawn = 0;
			_2Amount = 0;

			_3Diff = 1;
			_3Rate = 0.25;
			_3Delay = 240;
			_3Spawn = 0;
			_3Amount = 0;

			_4Diff = 1;
			_4Rate = 0.2;
			_4Delay = 280;
			_4Spawn = 0;
			_4Amount = 0;

			_5Diff = 1;
			_5Rate = 0.2;
			_5Delay = 150;
			_5Spawn = 0;
			_5Amount = 0;

			_6Diff = 1;
			_6Rate = 0.2;
			_6Delay = 210;
			_6Spawn = 0;
			_6Amount = 0;

			_7Diff = 1;
			_7Rate = 0.1;
			_7Delay = 190;
			_7Spawn = 0;
			_7Amount = 0;

			_totalAmount = 0;
			_waveAmount = 65;
			_enemyText.text = _waveAmount.toString();

			_gargoyles = new Array();
			_cerberi = new Array();
			_werewolves = new Array();
			_bigtentacles = new Array();
			_medtentacles = new Array();
			_grells = new Array();
			_buers = new Array();
			_meph = new Array();
			_beel = new Array();
			_bugs = new Array();
			_Clouds = new Array();
			_satan = new Array();
			_fires = new Array();
			_worms = new Array();

			_bullets = new Array();
			_enemyBullets = new Array();

			_p = new Player(_bullets, _uiLayer, _topLayer, _botLayer);
			_p.x = stage.stageWidth / 2;
			_p.y = 800;
			_topLayer.addChild(_p);

			_waveTimer = new Timer(6000);
			_startNukeTimer = new Timer(230);
			_stopNukeTimer = new Timer(600);
			_waveInProgress = true;

			addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, _p.mouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, _p.mouseUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, _p.pressDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, _p.pressUp);
		}

		private function waveNumbers(): void {
			_type1 = randomRange(0, 3);
			_type2 = randomRange(3, 5);
			_type3 = randomRange(5, 7);
		}

		private function randomRange(minNum: Number, maxNum: Number): Number {
			return (Math.ceil(Math.random() * (maxNum - minNum)) + minNum);
		}

		//credit to username "rejoin" for this very useful code 
		//he's the last post on the page
		//https:mike.newgrounds.com/news/post/59329
		public function zSorting(): void {
			var len: uint = _topLayer.numChildren;
			for (var i: int = 0; i < len - 1; i++) {
				for (var j: int = i + 1; j < len; j++) {
					if ((_topLayer.getChildAt(i).y + 55) > (_topLayer.getChildAt(j).y + 55)) {
						_topLayer.swapChildrenAt(i, j);
					}
				}
			}
		}

		private function update(e: Event): void {
			playerUpdate();

			if (_waveAmount <= 0 && _waveInProgress == true) {
				if (_gameDiff == 1) {}

				_waveInProgress = false;
				waveClear();
			}

			for each(var g: Gargoyle in _gargoyles) {
				g.update();

				if (_nukeScreen == true) {
					g.health -= 999;
				}

				var i: int;
				if (g.health <= 0) {
					try {
						for (i = 0; i < _gargoyles.length; i++) {
							if (_gargoyles[i].name == g.name) {
								_gargoyles.splice(i, 1);
								_topLayer.removeChild(g);
								_botLayer.removeChild(g.shadow);
								i = _gargoyles.length;
								_1Amount -= 1;
								_totalAmount -= 1;
								_waveAmount -= 1;
								_enemyText.text = _waveAmount.toString();
								_score += 1;
								_scoreText.text = _score.toString();
							}
						}
					} catch (e: Error) {
						trace("Failed to delete Gargoyle!", e);
					}
				}

				if (g.shadow.hitTestObject(_p.shadow)) {
					if (_playerhp.width <= 0.25) {
						_playerhp.width = 0;
					} else {
						_playerhp.width -= 0.25;
					}
				}
			}

			for each(var c: Cerberus in _cerberi) {
				c.update();
				if (_nukeScreen == true) {
					c.health -= 999;
				}

				var j: int;
				if (c.health <= 0) {
					try {
						for (j = 0; j < _cerberi.length; j++) {
							if (_cerberi[j].name == c.name) {
								_cerberi.splice(j, 1);
								_topLayer.removeChild(c);
								_botLayer.removeChild(c.shadow);
								j = _cerberi.length;
								_2Amount -= 1;
								_totalAmount -= 1;
								_waveAmount -= 1;
								_enemyText.text = _waveAmount.toString();
								_score += 1;
								_scoreText.text = _score.toString();
							}
						}
					} catch (e: Error) {
						trace("Failed to delete Cerberus!", e);
					}
				}
				if (c.y > 850) {
					c.setState(Cerberus.ATTACK);
					if (_gatehp.width <= 0.4) {
						_gatehp.width = 0;
					}
					_gatehp.width -= 0.4;
				}
				if (c.shadow.hitTestObject(_p.shadow)) {
					if (_playerhp.width <= 0.1) {
						_playerhp.width = 0;
					} else {
						_playerhp.width -= 0.1;
					}
				}
			}

			for each(var w: Werewolf in _werewolves) {
				w.update();

				if (_nukeScreen == true) {
					w.health -= 999;
				}

				var k: int;
				if (w.health <= 0) {
					try {
						for (k = 0; k < _werewolves.length; k++) {
							if (_werewolves[k].name == w.name) {
								_werewolves.splice(k, 1);
								_topLayer.removeChild(w);
								_botLayer.removeChild(w.shadow);
								k = _werewolves.length;
								_3Amount -= 1;
								_totalAmount -= 1;
								_waveAmount -= 1;
								_enemyText.text = _waveAmount.toString();
								_score += 1;
								_scoreText.text = _score.toString();
							}
						}
					} catch (e: Error) {
						trace("Failed to delete Werewolf!", e);
					}
				}
				if (w.y > 850) {
					w.setState(Werewolf.ATTACK);
					if (_gatehp.width <= 0.25) {
						_gatehp.width = 0;
					}
					_gatehp.width -= 0.25;
				}
				if (w.shadow.hitTestObject(_p.shadow)) {
					if (_playerhp.width <= 0.2) {
						_playerhp.width = 0;
					} else {
						_playerhp.width -= 0.2;
					}
				}
			}

			for each(var bt: BigTentacle in _bigtentacles) {
				var btshot: Projectile = bt.update();
				if (_nukeScreen == true) {
					bt.health -= 999;
				}

				var l: int;
				if (bt.health <= 0) {
					try {
						for (l = 0; l < _bigtentacles.length; l++) {
							if (_bigtentacles[l].name == bt.name) {
								_bigtentacles.splice(l, 1);
								_topLayer.removeChild(bt);
								_botLayer.removeChild(bt.shadow);
								l = _bigtentacles.length;
								_4Amount -= 1;
								_totalAmount -= 1;
								_waveAmount -= 1;
								_enemyText.text = _waveAmount.toString();
								_score += 1;
								_scoreText.text = _score.toString();
							}
						}
					} catch (e: Error) {
						trace("Failed to delete Big Tentacle!", e);
					}
				}
				if (btshot != null) {
					_botLayer.addChild(btshot.shadow);
					_topLayer.addChild(btshot);
					_enemyBullets.push(btshot);
				}

				if (bt.y > 825) {
					bt.setState(BigTentacle.ATTACK);
					if (_gatehp.width <= 0.5) {
						_gatehp.width = 0;
					}
					_gatehp.width -= 0.5;
				}
				if (bt.shadow.hitTestObject(_p.shadow)) {
					if (_playerhp.width <= 0.2) {
						_playerhp.width = 0;
					} else {
						_playerhp.width -= 0.2;
					}
				}
			}

			for each(var mt: MediumTentacle in _medtentacles) {
				mt.update();
				if (_nukeScreen == true) {
					mt.health -= 999;
				}

				var m: int;
				if (mt.health <= 0) {
					try {
						for (m = 0; m < _medtentacles.length; m++) {
							if (_medtentacles[m].name == mt.name) {
								_medtentacles.splice(m, 1);
								_topLayer.removeChild(mt);
								_botLayer.removeChild(mt.shadow);
								m = _medtentacles.length;
								_5Amount -= 1;
								_totalAmount -= 1;
								_waveAmount -= 1;
								_enemyText.text = _waveAmount.toString();
								_score += 1;
								_scoreText.text = _score.toString();
							}
						}
					} catch (e: Error) {
						trace("Failed to delete Medium Tentacle!", e);
					}
				}

				if (mt.shadow.hitTestObject(_p.shadow)) {
					if (_playerhp.width <= 5) {
						_playerhp.width = 0;
					} else {
						_playerhp.width -= 5;
					}
				}
			}

			for each(var gr: Grell in _grells) {
				var shot: Projectile = gr.update();

				if (_nukeScreen == true) {
					gr.health -= 999;
				}

				var n: int;
				if (gr.health <= 0) {
					try {
						for (n = 0; n < _grells.length; n++) {
							if (_grells[n].name == gr.name) {
								_grells.splice(n, 1);
								gr.removeChild(gr.shootRotation);
								_topLayer.removeChild(gr);
								_botLayer.removeChild(gr.shadow);
								n = _grells.length;
								_6Amount -= 1;
								_totalAmount -= 1;
								_waveAmount -= 1;
								_enemyText.text = _waveAmount.toString();
								_score += 1;
								_scoreText.text = _score.toString();
							}
						}
					} catch (e: Error) {
						trace("Failed to delete Grell!", e);
					}
				}
				if (shot != null) {
					_botLayer.addChild(shot.shadow);
					_topLayer.addChild(shot);
					_enemyBullets.push(shot);
				}
				if (gr.shadow.hitTestObject(_p.shadow)) {
					if (_playerhp.width <= .1) {
						_playerhp.width = 0;
					} else {
						_playerhp.width -= 0.1;
					}
				}
			}

			for each(var bu: Buer in _buers) {
				bu.update();

				if (_nukeScreen == true) {
					bu.health -= 999;
				}

				var o: int;
				if (bu.health <= 0) {
					try {
						for (o = 0; o < _buers.length; o++) {
							if (_buers[o].name == bu.name) {
								_buers.splice(o, 1);
								_topLayer.removeChild(bu);
								_botLayer.removeChild(bu.shadow);
								o = _grells.length;
								_7Amount -= 1;
								_totalAmount -= 1;
								_waveAmount -= 1;
								_enemyText.text = _waveAmount.toString();
								_score += 1;
								_scoreText.text = _score.toString();
							}
						}
					} catch (e: Error) {
						trace("Failed to delete Buer!", e);
					}
				}
				if (bu.shadow.hitTestObject(_p.shadow)) {
					if (_playerhp.width <= .1) {
						_playerhp.width = 0;
					} else {
						_playerhp.width -= .1;
					}
				}
				if (bu.y >= 850) {
					if (_gatehp.width <= 0.3) {
						_gatehp.width = 0;
					}
					_gatehp.width -= 0.3;
					bu.setState(Buer.ATTACK);
				}
			}

			for each(var meph: Mephistopheles in _meph) {
				meph.update();

				if (_nukeScreen == true) {
					meph.health -= 45;
				}

				var p: int;
				if (meph.health <= 0) {
					try {
						for (p = 0; p < _meph.length; p++) {
							if (_meph[p].name == meph.name) {
								_meph.splice(p, 1);
								_botLayer.removeChild(meph.shadow);
								_topLayer.removeChild(meph);
								o = _meph.length;
								_totalAmount -= 1;
								_waveAmount -= 1;
								_enemyText.text = _waveAmount.toString();
								_score += 1;
								_scoreText.text = _score.toString();
							}
						}
					} catch (e: Error) {
						trace("Failed to delete Buer!", e);
					}
				}
			}

			for each(var beel: Beelzebub in _beel) {
				beel.update();

				if (_nukeScreen == true) {
					beel.health -= 45;
				}

				var q: int;
				if (beel.health <= 0) {
					try {
						for (q = 0; q < _beel.length; q++) {
							if (_beel[q].name == beel.name) {
								_beel.splice(q, 1);
								_botLayer.removeChild(beel.shadow);
								_topLayer.removeChild(beel);
								q = _beel.length;
								_totalAmount -= 1;
								_waveAmount -= 1;
								_enemyText.text = _waveAmount.toString();
								_score += 1;
								_scoreText.text = _score.toString();
							}
						}
					} catch (e: Error) {
						trace("Failed to delete Buer!", e);
					}
				}
			}

			for each(var bug: Bug in _bugs) {
				bug.update();

				if (_nukeScreen == true) {
					bug.health -= 999;
				}

				var r: int;
				if (bug.health <= 0) {
					try {
						for (r = 0; r < _bugs.length; r++) {
							if (_bugs[r].name == bug.name) {
								_bugs.splice(r, 1);
								_botLayer.removeChild(bug.shadow);
								_topLayer.removeChild(bug);
								r = _bugs.length;
							}
						}
					} catch (e: Error) {
						trace("Failed to delete Bug!", e);
					}
				}

				if (bug.shadow.hitTestObject(_p.shadow)) {
					if (_playerhp.width <= 0.25) {
						_playerhp.width = 0;
					} else {
						_playerhp.width -= 0.25;
					}
				}
			}

			for each(var bugC: Cloud in _Clouds) {
				bugC.update();

				if (_nukeScreen == true) {
					bugC.health -= 999;
				}

				var s: int;
				if (bugC.health <= 0) {
					try {
						for (s = 0; s < _Clouds.length; s++) {
							if (_Clouds[s].name == bugC.name) {
								_Clouds.splice(s, 1);
								_botLayer.removeChild(bugC.shadow);
								_topLayer.removeChild(bugC);
								s = _Clouds.length;
							}
						}
					} catch (e: Error) {
						trace("Failed to delete Bug Cloud!", e);
					}
				}
			}

			for each(var satan: Satan in _satan) {
				satan.update();

				if (_nukeScreen == true) {
					satan.health -= 45;
				}

				var t: int;
				if (satan.health <= 0) {
					try {
						for (t = 0; t < _satan.length; t++) {
							if (_satan[t].name == satan.name) {
								_satan.splice(t, 1);
								_botLayer.removeChild(satan.shadow);
								_topLayer.removeChild(satan);
								t = _satan.length;
								_totalAmount -= 1;
								_waveAmount -= 1;
								_enemyText.text = _waveAmount.toString();
							}
						}
					} catch (e: Error) {
						trace("Failed to delete Satan!", e);
					}
					win();
				}
			}
			for each(var f: Fire in _fires) {
				f.update();

				if (f.shadow.hitTestObject(_p.shadow)) {
					if (_playerhp.width <= 5) {
						_playerhp.width = 0;
					} else {
						_playerhp.width -= 5;
					}
				}

				var u: int;
				if (f.health <= 0) {
					try {
						for (u = 0; u < _satan.length; u++) {
							if (_fires[u].name == f.name) {
								_fires.splice(u, 1);
								_botLayer.removeChild(f.shadow);
								_topLayer.removeChild(f);
								u = _satan.length;
							}
						}
					} catch (e: Error) {
						trace("Failed to delete Fire!", e);
					}
				}
			}
			for each(var wg: WormGroup in _worms) {
				wg.update();

				if (wg.shadow.hitTestObject(_p.shadow)) {
					if (_playerhp.width <= 5) {
						_playerhp.width = 0;
					} else {
						_playerhp.width -= 5;
					}
				}

				var y: int;
				if (wg.health <= 0) {
					for (y = 0; y < _worms.length; y++) {
						if (_worms[y].name == wg.name) {
							_worms.splice(y, 1);

							for each(var wz: Worm in wg.worms) {
								var z: int;
								for (z = 0; z < wg.worms.length; z++) {
									if (wg.worms[z].name == wz.name) {
										_botLayer.removeChild(wz);
										z = wg.worms.length;
									}
								}
							}
							_botLayer.removeChild(wg.shadow);
							_topLayer.removeChild(wg);
							y = _satan.length;
						}
					}
				}
			}

		for each(var b: Projectile in _bullets) {
			b.update();
		}

		for each(var eb: Projectile in _enemyBullets) {
			eb.update();
			hitPlayer(eb);
			if (eb.life <= 0) {
				removeShot(eb);
				if (eb.trident != true) {
					_botLayer.removeChild(eb.shadow);
				}
				if (eb.trident) {
					_botLayer.removeChild(eb.tridentShadow);
				}
			}
		}

		enemyWave();
		zSorting();

	}

	private function hitPlayer(shot: Projectile): void {
		if (shot.shadow.hitTestObject(_p.shadow)) {
			if (shot.normal) {
				if (_playerhp.width <= 20) {
					_playerhp.width = 0;
				}
				_playerhp.width -= 20;
			}
			if (shot.triple) {
				if (_playerhp.width <= 3) {
					_playerhp.width = 0;
				}
				_playerhp.width -= 3;
			}
			if (shot.silver) {
				if (_playerhp.width <= 5) {
					_playerhp.width = 0;
				}
				_playerhp.width -= 5;
			}
			if (shot.enemy) {
				shot.life -= 150
				if (_playerhp.width <= 10) {
					_playerhp.width = 0;
				}
				_playerhp.width -= 10;
			}
		}
		if (shot.tridentShadow.hitTestObject(_p.shadow)) {
			if (shot.trident && (shot.tridentShadow.y - shot.y) <= 100) {
				if (_playerhp.width <= 20) {
					_playerhp.width = 0;
				}
				_playerhp.width -= 20;
			}
		}
	}

	private function playerUpdate(): void {
		_p.update();

		for each(var shot: Projectile in _bullets) {
			shot.update();
			hitTest(shot);

			if (shot.life <= 0) {
				removeShot(shot);
				_botLayer.removeChild(shot.shadow);
			}
		}

		if (_playerhp.width <= 0) {
			gameOverLossHP();
		}
		if (_gatehp.width <= 0) {
			gameOverLossGate();
		}
	}

	private function removeShot(shot: Projectile): void {
		var i: int;
		try {
			for (i = 0; i < _bullets.length; i++) {
				if (_bullets[i].name == shot.name) {
					_bullets.splice(i, 1);
					_topLayer.removeChild(shot);
				}
			}
		} catch (e: Error) {
			trace("Failed to delete shot!", e);
		}
		try {
			for (i = 0; i < _enemyBullets.length; i++) {
				if (_enemyBullets[i].name == shot.name) {
					_enemyBullets.splice(i, 1);
					_topLayer.removeChild(shot);
				}
			}
		} catch (e: Error) {
			trace("Failed to delete shot!", e);
		}
	}

	private function hitTest(shot: Projectile): void {
		for each(var a: Gargoyle in _gargoyles) {
			if (a.shadow.hitTestObject(shot.shadow)) {
				var i: int;
				if (shot.normal) {
					a.health -= 2;
					shot.life -= 50;
				}
				if (shot.triple) {
					a.health -= 1.5;
					shot.life -= 20;
				}
				if (shot.silver) {
					a.health -= 6;
					shot.life -= 30;
				}
			}
		}

		for each(var c: Cerberus in _cerberi) {
			if (c.shadow.hitTestObject(shot.shadow)) {
				var j: int;
				if (shot.normal) {
					c.health -= 2;
					shot.life -= 50;
				}
				if (shot.triple) {
					c.health -= 1.5;
					shot.life -= 20;
				}
				if (shot.silver) {
					c.health -= 6;
					shot.life -= 30;
				}
			}
		}

		for each(var b: Werewolf in _werewolves) {
			if (b.shadow.hitTestObject(shot.shadow)) {
				var k: int;
				if (shot.normal) {
					b.health -= 2;
					shot.life -= 50;
				}
				if (shot.triple) {
					b.health -= 1.5;
					shot.life -= 20;
				}
				if (shot.silver) {
					b.health -= 6;
					shot.life -= 30;
				}
			}
		}

		for each(var bt: BigTentacle in _bigtentacles) {
			if (bt.shadow.hitTestObject(shot.shadow)) {
				var l: int;
				if (shot.normal) {
					bt.health -= 2;
					shot.life -= 50;
				}
				if (shot.triple) {
					bt.health -= 1.5;
					shot.life -= 20;
				}
				if (shot.silver) {
					bt.health -= 6;
					shot.life -= 30;
				}
			}
		}

		for each(var mt: MediumTentacle in _medtentacles) {
			if (mt.shadow.hitTestObject(shot.shadow)) {
				var m: int;
				if (shot.normal) {
					mt.health -= 2;
					shot.life -= 50;
				}
				if (shot.triple) {
					mt.health -= 1.5;
					shot.life -= 20;
				}
				if (shot.silver) {
					mt.health -= 6;
					shot.life -= 30;
				}
			}
		}

		for each(var gr: Grell in _grells) {
			if (gr.shadow.hitTestObject(shot.shadow)) {
				var n: int;
				if (shot.normal) {
					gr.health -= 2;
					shot.life -= 50;
				}
				if (shot.triple) {
					gr.health -= 1.5;
					shot.life -= 20;
				}
				if (shot.silver) {
					gr.health -= 6;
					shot.life -= 30;
				}
			}
		}

		for each(var bu: Buer in _buers) {
			if (bu.shadow.hitTestObject(shot.shadow)) {
				var o: int;
				if (shot.normal) {
					bu.health -= 2;
					shot.life -= 50;
				}
				if (shot.triple) {
					bu.health -= 1.5;
					shot.life -= 20;
				}
				if (shot.silver) {
					bu.health -= 6;
					shot.life -= 30;
				}
			}
		}
		for each(var meph: Mephistopheles in _meph) {
			if (meph.shadow.hitTestObject(shot.shadow)) {
				var p: int;
				if (shot.normal) {
					meph.health -= 2;
					shot.life -= 50;
				}
				if (shot.triple) {
					meph.health -= 1.5;
					shot.life -= 20;
				}
				if (shot.silver) {
					meph.health -= 6;
					shot.life -= 30;
				}
			}
		}
		for each(var beel: Beelzebub in _beel) {
			if (beel.shadow.hitTestObject(shot.shadow)) {
				var q: int;
				if (shot.normal) {
					beel.health -= 2;
					shot.life -= 50;
				}
				if (shot.triple) {
					beel.health -= 1.5;
					shot.life -= 20;
				}
				if (shot.silver) {
					beel.health -= 6;
					shot.life -= 30;
				}
			}
		}
		for each(var bug: Bug in _bugs) {
			if (bug.shadow.hitTestObject(shot.shadow)) {
				var r: int;
				if (shot.normal) {
					bug.health -= 2;
					shot.life -= 50;
				}
				if (shot.triple) {
					bug.health -= 1.5;
					shot.life -= 20;
				}
				if (shot.silver) {
					bug.health -= 6;
					shot.life -= 30;
				}
			}
		}
		for each(var bugC: Cloud in _Clouds) {
			if (bugC.hitTestObject(shot.shadow)) {
				var s: int;
				if (shot.normal) {
					bugC.health -= 2;
					shot.life -= 50;
				}
				if (shot.triple) {
					bugC.health -= 1.5;
					shot.life -= 20;
				}
				if (shot.silver) {
					bugC.health -= 6;
					shot.life -= 30;
				}
			}
		}
		for each(var satan: Satan in _satan) {
			if (satan.shadow.hitTestObject(shot.shadow)) {
				var t: int;
				if (shot.normal) {
					satan.health -= 2;
					shot.life -= 50;
				}
				if (shot.triple) {
					satan.health -= 1.5;
					shot.life -= 20;
				}
				if (shot.silver) {
					satan.health -= 6;
					shot.life -= 30;
				}
			}
		}
	}

	private function enemyWave(): void {

		if (_waveAmount > 0 && _totalAmount < _waveAmount) {
			if (_type1 == 1) {
				_1Spawn++;
			}

			if (_type2 == 4) {
				_2Spawn++;
			}

			if (_type3 == 6) {
				_3Spawn++;
			}

			if (_type2 == 5) {
				_4Spawn++;
			}

			if (_type1 == 3) {
				_5Spawn++;
			}

			if (_type1 == 2) {
				_6Spawn++;
			}
			if (_type3 == 7) {
				_7Spawn++;
			}


			if (_1Spawn > _1Delay) {
				_1Spawn = 0;
				_1Delay -= _1Rate;
				_1Diff += _1Rate;
				if (_1Diff >= _waveAmount - _totalAmount) {
					_1Diff = _waveAmount - _totalAmount;
				}
				spawnEnemy1();
			}

			if (_2Spawn > _2Delay) {
				_2Spawn = 0;
				_2Delay -= _2Rate;
				_2Diff += _2Rate;
				if (_2Diff >= _waveAmount - _totalAmount) {
					_2Diff = _waveAmount - _totalAmount;
				}
				spawnEnemy2();
			}

			if (_3Spawn > _3Delay) {
				_3Spawn = 0;
				_3Delay -= _3Rate;
				_3Diff += _3Rate;
				if (_3Diff >= _waveAmount - _totalAmount) {
					_3Diff = _waveAmount - _totalAmount;
				}
				spawnEnemy3();
			}

			if (_4Spawn > _4Delay) {
				_4Spawn = 0;
				_4Delay -= _4Rate;
				_4Diff += _4Rate;
				if (_4Diff >= _waveAmount - _totalAmount) {
					_4Diff = _waveAmount - _totalAmount;
				}
				spawnEnemy4();
			}

			if (_5Spawn > _5Delay) {
				_5Spawn = 0;
				_5Delay -= _5Rate;
				_5Diff += _5Rate;
				if (_5Diff >= _waveAmount - _totalAmount) {
					_5Diff = _waveAmount - _totalAmount;
				}
				spawnEnemy5();
			}

			if (_6Spawn > _6Delay) {
				_6Spawn = 0;
				_6Delay -= _6Rate;
				_6Diff += _6Rate;
				if (_6Diff >= _waveAmount - _totalAmount) {
					_6Diff = _waveAmount - _totalAmount;
				}
				spawnEnemy6();
			}
			if (_7Spawn > _7Delay) {
				_7Spawn = 0;
				_7Delay -= _7Rate;
				_7Diff += _7Rate;
				if (_7Diff >= _waveAmount - _totalAmount) {
					_7Diff = _waveAmount - _totalAmount;
				}
				spawnEnemy7();
			}
		}
	}

	private function spawnEnemy1(): void {
		var i: int;
		for (i = 0; i < Math.floor(_1Diff); i++) {
			var l: Number = randomRange(0, 3);
			var g: Gargoyle = new Gargoyle(_botLayer);
			_1Amount += 1;
			_totalAmount += 1;

			if (l == 2) {
				g.x = Math.random() * 1300;
				g.y = -50;
			} else if (l == 1) {
				g.x = -50;
				g.y = Math.random() * 600 + 200;
			} else if (l == 3) {
				g.x = 1250;
				g.y = Math.random() * 600 + 200;
			}

			g.target = _p;
			_topLayer.addChild(g);
			_gargoyles.push(g);
		}
	}

	private function spawnEnemy2(): void {
		var i: int;
		for (i = 0; i < Math.floor(_2Diff); i++) {
			var c: Cerberus = new Cerberus(_botLayer);
			_2Amount += 1;
			_totalAmount += 1;

			c.x = Math.random() * 800 + 200;
			c.y = -100;

			c.target = _gate;
			c.playerTarget = _p;
			_topLayer.addChild(c);
			_cerberi.push(c);

		}
	}

	private function spawnEnemy3(): void {
		var i: int;
		for (i = 0; i < Math.floor(_3Diff); i++) {
			var l: Number = randomRange(0, 2);
			var w: Werewolf = new Werewolf(_botLayer);
			_3Amount += 1;
			_totalAmount += 1;

			if (l == 2) {
				w.x = 75.10;
				w.y = 48.55;
			} else if (l == 1) {
				w.x = 1057.35;
				w.y = 23.50;
			}

			w.target = _gate;
			w.playerTarget = _p;
			_topLayer.addChild(w);
			_werewolves.push(w);
		}
	}

	private function spawnEnemy4(): void {
		var i: int;
		for (i = 0; i < Math.floor(_4Diff); i++) {
			var bt: BigTentacle = new BigTentacle(_botLayer);
			_4Amount += 1;
			_totalAmount += 1;

			bt.x = Math.random() * 800 + 200;
			bt.y = -100;

			bt.gateTarget = _gate;
			bt.shotTarget = _p;
			_topLayer.addChild(bt);
			_bigtentacles.push(bt);
		}
	}

	private function spawnEnemy5(): void {
		var i: int;
		for (i = 0; i < Math.floor(_5Diff); i++) {
			var mt: MediumTentacle = new MediumTentacle(_botLayer);
			_5Amount += 1;
			_totalAmount += 1;

			mt.x = Math.random() * 800 + 200;
			mt.y = -100;

			mt.target = _p;
			_topLayer.addChild(mt);
			_medtentacles.push(mt);
		}
	}

	private function spawnEnemy6(): void {
		var i: int;
		for (i = 0; i < Math.floor(_6Diff); i++) {
			var gr: Grell = new Grell(_botLayer);
			_6Amount += 1;
			_totalAmount += 1;

			gr.x = Math.random() * 600 + 200;
			gr.y = -100;

			gr.playerTarget = _p;
			_topLayer.addChild(gr);
			_grells.push(gr);

		}
	}

	private function spawnEnemy7(): void {
		var i: int;
		for (i = 0; i < Math.floor(_7Diff); i++) {
			var bu: Buer = new Buer(_botLayer);
			_7Amount += 1;
			_totalAmount += 1;

			bu.x = Math.random() * 400 + 400;
			bu.y = -100;

			bu.target = _gate;
			_topLayer.addChild(bu);
			_buers.push(bu);
		}
	}
	private function spawnFirstBoss(): void {
		_firstBoss = true;
		_mephBoss = new Mephistopheles(_enemyBullets, _topLayer, _botLayer);
		_mephBoss.x = 600;
		_mephBoss.y = 420;
		_mephBoss.playerTarget = _p;
		_topLayer.addChild(_mephBoss);
		_meph.push(_mephBoss);
	}
	private function spawnSecondBoss(): void {
		_secondBoss = true;
		_beelzeBoss = new Beelzebub(_topLayer, _botLayer, _bugs, _Clouds);
		_beelzeBoss.x = 600;
		_beelzeBoss.y = 400;
		_beelzeBoss.playerTarget = _p;
		_topLayer.addChild(_beelzeBoss);
		_beel.push(_beelzeBoss);
	}
	private function spawnThirdBoss(): void {
		_thirdBoss = true;
		_satanBoss = new Satan(_enemyBullets, _fires, _worms, _topLayer, _botLayer, _p);
		_satanBoss.x = 600;
		_satanBoss.y = 400;
		_topLayer.addChild(_satanBoss);
		_satan.push(_satanBoss);
	}
	private function waveClear(): void {
		_gameDiff += 1;
		_waveTimer.addEventListener(TimerEvent.TIMER, nextWave);
		_waveTimer.start();
	}
	private function nextWave(event: TimerEvent): void {
		_waveTimer.removeEventListener(TimerEvent.TIMER, nextWave);
		_waveTimer.stop();
		if (_gameDiff == 2) {

			_musicChannel.stop();
			_music = new MephMusic();
			_musicChannel = _music.play(0, 99);

			spawnFirstBoss();
			_beadAmount += 1;
			_oilAmount += 1;
			_beadText.text = _beadAmount.toString();
			_oilText.text = _oilAmount.toString();
			_totalAmount = 1;
			_waveAmount = 1;
			_enemyText.text = _waveAmount.toString();
			_waveInProgress = true;
			_type1 = 0;
			_type2 = 0;
			_type3 = 0;

		}
		if (_gameDiff == 3) {

			_musicChannel.stop();
			_music = new WaveMusic();
			_musicChannel = _music.play(0, 99);

			_beadAmount += 1;
			_oilAmount += 1;
			_beadText.text = _beadAmount.toString();
			_oilText.text = _oilAmount.toString();
			_waveAmount = 90;
			_enemyText.text = _waveAmount.toString();
			_waveInProgress = true;
			waveNumbers();
		}
		if (_gameDiff == 4) {

			_musicChannel.stop();
			_music = new BeelzebubMusic();
			_musicChannel = _music.play(0, 99);

			_beadAmount += 1;
			_oilAmount += 1;
			_beadText.text = _beadAmount.toString();
			_oilText.text = _oilAmount.toString();
			spawnSecondBoss();
			_totalAmount = 1;
			_waveAmount = 1;
			_enemyText.text = _waveAmount.toString();
			_waveInProgress = true;
			_type1 = 0;
			_type2 = 0;
			_type3 = 0;
		}
		if (_gameDiff == 5) {

			_musicChannel.stop();
			_music = new WaveMusic();
			_musicChannel = _music.play(0, 99);

			_beadAmount += 1;
			_oilAmount += 1;
			_beadText.text = _beadAmount.toString();
			_oilText.text = _oilAmount.toString();
			_waveAmount = 115;
			_enemyText.text = _waveAmount.toString();
			_waveInProgress = true;
			waveNumbers();

		}
		if (_gameDiff == 6) {

			_musicChannel.stop();
			_music = new SatanMusic();
			_musicChannel = _music.play(0, 99);

			_beadAmount += 1;
			_oilAmount += 1;
			_beadText.text = _beadAmount.toString();
			_oilText.text = _oilAmount.toString();
			spawnThirdBoss();
			_totalAmount = 1;
			_waveAmount = 1;
			_enemyText.text = _waveAmount.toString();
			_type1 = 0;
			_type2 = 0;
			_type3 = 0;
			_waveInProgress = true;

		}
		if (_gameDiff == 7) {
			win();
		}
	}
	private function restoreHP(event: MouseEvent): void {
		if (_beadAmount > 0) {

			if (_playerhp.width >= 69 && _playerhp.width != 139) {
				_beadAmount -= 1;
				_playerhp.width = 139;
			} else if (_playerhp.width >= 139) {

			} else {
				_beadAmount -= 1;
				_playerhp.width += 70;
			}
		}
		_beadText.text = _beadAmount.toString();
	}

	private function restoreGateHP(event: MouseEvent): void {
		if (_oilAmount > 0) {

			if (_gatehp.width >= 69 && _gatehp.width != 139) {
				_oilAmount -= 1;
				_gatehp.width = 139;
			} else if (_gatehp.width >= 139) {

			} else {
				_oilAmount -= 1;
				_gatehp.width += 70;
			}
		}
		_oilText.text = _oilAmount.toString();
	}

	private function nukeEverything(event: MouseEvent): void {
		if (_bibleAmount > 0 && _canNuke == true) {
			_canNuke = false;
			_bibleAmount -= 1;
			_bibleText.text = _bibleAmount.toString();
			_smite = new smiteClip();
			addChild(_smite);
			_startNukeTimer.addEventListener(TimerEvent.TIMER, startNuke);
			_startNukeTimer.start();
			_stopNukeTimer.addEventListener(TimerEvent.TIMER, stopNuke);
			_stopNukeTimer.start();
		}

	}

	private function startNuke(event: TimerEvent): void {
		_nukeScreen = true;
		_startNukeTimer.stop();
		_startNukeTimer.removeEventListener(TimerEvent.TIMER, startNuke);
	}
	private function stopNuke(event: TimerEvent): void {
		_nukeScreen = false;
		_canNuke = true;
		_stopNukeTimer.stop();
		_stopNukeTimer.removeEventListener(TimerEvent.TIMER, stopNuke);
		removeChild(_smite);
	}

	private function gameOverLossHP(): void {
		removeEventListener(Event.ENTER_FRAME, update);
		_deadP = new Player(null, null, null, null);
		_deadP.x = _p.x;
		_deadP.y = _p.y
		var i: int = this.numChildren;
		while (i--) {
			removeChildAt(i);
		}
		_gameOverScreen = new GameOverScreen;
		addChild(_gameOverScreen);
		addChild(_deadP)
		_gameOverScreen.retry_btn.addEventListener(MouseEvent.CLICK, restart);

	}
	private function gameOverLossGate(): void {
		removeEventListener(Event.ENTER_FRAME, update);
		var i: int = this.numChildren;
		while (i--) {
			removeChildAt(i);
		}
		_gameOverScreen = new GameOverScreen;
		addChild(_gameOverScreen);
		_gameOverScreen.retry_btn.addEventListener(MouseEvent.CLICK, restart);
	}

	private function win(): void {
		removeEventListener(Event.ENTER_FRAME, update);
		_musicChannel.stop();
		var i: int = this.numChildren;
		while (i--) {
			removeChildAt(i);
		}
		_winScreen = new WinScreen;
		addChild(_winScreen);
		_music = new VictoryMusic();
		_musicChannel = new SoundChannel();
		_musicChannel = _music.play(0, 99);
	}
	private function restart(event: MouseEvent): void {
		_gameOverScreen.retry_btn.removeEventListener(MouseEvent.CLICK, restart);
		var i: int = this.numChildren;
		while (i--) {
			removeChildAt(i);
		}
		init();
	}
}
}

//aaaaaaaaaaaaaaaaaaaaaaa