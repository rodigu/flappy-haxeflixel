package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.debug.DebuggerUtil;
import flixel.text.FlxText.FlxTextAlign;
import flixel.text.FlxText.FlxTextBorderStyle;
import flixel.text.FlxText;
import js.html.svg.Rect;

class PlayState extends FlxState
{
	public var plane:Plane;

	var backgrounds:Array<Background>;
	var floors:Array<Floor>;
	var score_text:FlxText;
	var obstacles:Obstacles;

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

		floors = [new Floor(), new Floor(1)];
		add(floors[0]);
		add(floors[1]);

		score_text = new FlxText(0, 0, 80, '0');
		score_text.setFormat('assets/data/kenvector_future.ttf', 40, 0x000000);
		score_text.autoSize = false;
		score_text.alignment = CENTER;
		score_text.screenCenter();
		score_text.y = FlxG.height * .1;
		add(score_text);

		plane = new Plane();
		add(plane);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		score_text.text = Std.string(Glob.score);
		FlxG.overlap(plane, obstacles, function(a, b)
		{
			b.alpha = .5;
		});
	}
}
