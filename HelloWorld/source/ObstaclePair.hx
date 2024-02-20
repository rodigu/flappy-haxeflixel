import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxRandom;

class ObstaclePair extends FlxTypedGroup<FlxSprite>
{
	public var bottom:ScrollingSprite;
	public var top:ScrollingSprite;
	public var t1:Array<{x:Float, y:Float}>;
	public var t2:Array<{x:Float, y:Float}>;
	public var coin:Coin;

	var prev_ref:Null<ObstaclePair>;

	public function new(gapx:Float, gapy:Float, offset = 0)
	{
		super(3);
		var scaling_factor = 1.7;

		bottom = new ScrollingSprite('assets/images/rockGrass.png', offset, scaling_factor, Glob.speed);
		add(bottom);
		bottom.x = gapx;

		top = new ScrollingSprite('assets/images/rockGrassDown.png', offset, scaling_factor, Glob.speed);
		add(top);
		top.x = gapx;

		t1 = get_t1();
		t2 = get_t2();

		coin = new Coin(gapx, gapy);
		add(coin);

		set_gap(gapy);
	}

	public function posx(nx:Float)
	{
		top.x = nx;
		bottom.x = nx;
		set_gap(FlxG.random.float(FlxG.height * .4, FlxG.height * .6));
	}

	function set_gap(gapy:Float)
	{
		var buffer = 88;
		bottom.y = gapy + buffer;
		top.y = gapy - bottom.height - buffer;
		coin.y = gapy - coin.height * .5;
	}

	function get_t1()
	{
		return [
			{x: bottom.x, y: bottom.y + bottom.height},
			{x: bottom.x + bottom.width * .6, y: bottom.y},
			{x: bottom.x + bottom.width, y: bottom.y + bottom.height},
		];
	}

	function get_t2()
	{
		return [
			{x: top.x, y: top.y},
			{x: top.x + top.width, y: top.y},
			{x: top.x + top.width * .6, y: top.y + top.height},
		];
	}

	public function move()
	{
		top.is_moving = true;
		bottom.is_moving = true;
		coin.x = bottom.x + bottom.width * .6 - coin.width * .5;
	}

	public function stop()
	{
		top.is_moving = false;
		bottom.is_moving = false;
	}

	override public function update(elapsed:Float)
	{
		t1 = get_t1();
		t2 = get_t2();
		var c = Glob.PS.plane.center_point();
		var b = Glob.PS.plane.bottom_point();
		var t = Glob.PS.plane.top_point();
		if (check_collide(c.x, c.y) || check_collide(b.x, b.y) || check_collide(t.x, t.y))
			Glob.PS.hit();

		coin.x = bottom.x + bottom.width * .6 - coin.width * .5;

		super.update(elapsed);
	}

	public function get_pos()
	{
		return bottom.getPosition();
	}

	public function add_ref(ref:ObstaclePair, force_reset = false)
	{
		prev_ref = ref;
		bottom.set_reset_func(function()
		{
			bottom.x = ref.bottom.x + ref.bottom.width * 1.5;
		});
		top.set_reset_func(function()
		{
			top.x = ref.top.x + ref.top.width * 1.5;
			set_gap(FlxG.random.float(FlxG.height * .4, FlxG.height * .6));
		});
		if (force_reset)
		{
			bottom.reset_func();
			top.reset_func();
		}
	}

	public function reset_func()
	{
		bottom.reset_func();
		top.reset_func();
	}

	function tri_collide(px:Float, py:Float, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float):Bool
	{
		var area = Math.abs((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1));

		var area1 = Math.abs((x1 - px) * (y2 - py) - (x2 - px) * (y1 - py));
		var area2 = Math.abs((x2 - px) * (y3 - py) - (x3 - px) * (y2 - py));
		var area3 = Math.abs((x3 - px) * (y1 - py) - (x1 - px) * (y3 - py));

		return ((area1 + area2 + area3) == area);
	}

	public function check_collide(x:Float, y:Float):Bool
	{
		return tri_collide(x, y, t1[0].x, t1[0].y, t1[1].x, t1[1].y, t1[2].x, t1[2].y)
			|| tri_collide(x, y, t2[0].x, t2[0].y, t2[1].x, t2[1].y, t2[2].x, t2[2].y);
	}
}
