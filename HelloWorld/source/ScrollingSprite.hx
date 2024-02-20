import flixel.FlxG;
import flixel.FlxSprite;
import haxe.Constraints.Function;

class ScrollingSprite extends FlxSprite
{
	var _moving_speed:Int;

	public var reset_func:Function;
	public var is_moving = false;

	public function new(asset:String, offset = 0, scaling_number = 1.7, moving_speed = -1)
	{
		super(0, 0);
		loadGraphic(asset);
		height *= scaling_number;
		width *= scaling_number;
		// scale.set(scaling);
		scale.y *= scaling_number;
		scale.x *= scaling_number;
		x = width * offset;
		origin.set(0, 0);
		y = 0;
		_moving_speed = moving_speed;
		reset_func = function()
		{
			x = width + moving_speed;
		};
	}

	public function set_reset_func(new_reset_func:Function)
	{
		reset_func = new_reset_func;
	}

	public function set_moving_speed(new_speed:Int)
	{
		_moving_speed = new_speed;
	}

	override public function update(elapsed:Float)
	{
		if (x < -width)
			reset_func();
		if (is_moving)
			x += _moving_speed;
	}
}
