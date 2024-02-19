import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import lime.math.Vector2;
import openfl.display.Shape;

class ObstaclePair extends FlxTypedGroup<ScrollingSprite>
{
	public var top:ScrollingSprite;
	public var bottom:ScrollingSprite;

	var prev_ref:Null<ObstaclePair>;

	public function new(gapx:Float, gapy:Float, offset = 0)
	{
		super(2);
		var buffer = 88;
		var scaling_factor = 1.7;
		top = new ScrollingSprite('assets/images/rockGrass.png', offset, scaling_factor, Glob.speed);
		top.x = gapx;
		top.y = gapy + buffer;
		add(top);

		bottom = new ScrollingSprite('assets/images/rockGrassDown.png', offset, scaling_factor, Glob.speed);
		bottom.x = gapx;
		bottom.y = gapy - top.height - buffer;
		add(bottom);
	}

	public function get_pos()
	{
		return top.getPosition();
	}

	public function add_ref(ref:ObstaclePair, force_reset = false)
	{
		prev_ref = ref;
		top.set_reset_func(function()
		{
			top.x = ref.top.x + ref.top.width * 1.5;
		});
		bottom.set_reset_func(function()
		{
			bottom.x = ref.bottom.x + ref.bottom.width * 1.5;
		});
		if (force_reset)
		{
			top.reset_func();
			bottom.reset_func();
		}
	}
}
