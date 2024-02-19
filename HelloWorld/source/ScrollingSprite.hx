import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import haxe.Constraints.Function;

class ScrollingSprite extends FlxSprite
{
	var _moving_speed:Int;

	public var reset_func:Function;

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
			x = width + _moving_speed;
		};
	}

	public function set_reset_func(new_reset_func:Function)
	{
		reset_func = new_reset_func;
	}

	override public function update(elapsed:Float)
	{
		if (x < -width)
			reset_func();
		x += _moving_speed;
	}
}
