package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.ui.FlxSpriteButton;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import haxe.Timer;
import openfl.display.FPS;

class PlayState extends FlxState
{
	public var plane:Plane;

	var backgrounds:Array<Background>;
	var floors:Array<Floor>;
	var score_text:FlxText;
	var obstacles:Obstacles;
	var hint_hand:TapToPlay;
	var pause_button:FlxButton;

	override public function create()
	{
		super.create();

		FlxG.debugger.drawDebug = true;

		Glob.PS = this;
		// var mouse_sprite = new FlxSprite();
		// mouse_sprite.loadGraphic("assets/images/tap.png");
		// FlxG.mouse.load(mouse_sprite.pixels);
		FlxG.mouse.useSystemCursor = true;

		FlxG.autoPause = false;

		backgrounds = [new Background(), new Background(1)];
		add(backgrounds[0]);
		add(backgrounds[1]);

		obstacles = new Obstacles();
		add(obstacles);

		score_text = new FlxText(0, 0, 80, '0');
		score_text.setFormat('assets/data/kenvector_future.ttf', 40, 0x000000);
		score_text.autoSize = false;
		score_text.alignment = CENTER;
		score_text.screenCenter();
		score_text.y = FlxG.height * .1;
		add(score_text);

		plane = new Plane();
		add(plane);

		floors = [new Floor(), new Floor(1)];
		add(floors[0]);
		add(floors[1]);

		hint_hand = new TapToPlay();
		add(hint_hand);

		pause_button = new FlxButton(FlxG.width * .8, FlxG.height * .1, 'pausa', pause);
		add(pause_button);
	}

	function pause()
	{
		openSubState(new PauseState());
	}

	public function hit()
	{
		if (plane.is_dead)
			return;
		FlxG.camera.flash(FlxColor.WHITE, .33);
		plane.is_dead = true;
		Timer.delay(game_over, 1500);
		backgrounds[0].is_moving = false;
		backgrounds[1].is_moving = false;
		floors[0].is_moving = false;
		floors[1].is_moving = false;
		obstacles.stop();
	}

	public function reset()
	{
		plane.repos();
		hint_hand.show();
		obstacles.repos();
		obstacles.stop();
		backgrounds[0].is_moving = true;
		backgrounds[1].is_moving = true;
		floors[0].is_moving = true;
		floors[1].is_moving = true;
	}

	function game_over()
	{
		openSubState(new ResetState());
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		score_text.text = Std.string(Glob.score);
		if (plane.acceleration.y != 0 && !plane.is_dead)
		{
			hint_hand.hide();
			obstacles.move();
		}
		FlxSpriteUtil.bound(plane);
	}
}
