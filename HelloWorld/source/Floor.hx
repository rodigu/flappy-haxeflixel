import flixel.FlxG;
import flixel.FlxSprite;

class Floor extends ScrollingSprite
{
	public function new(offset = 0)
	{
		super('assets/images/groundGrass.png', offset, 1.5, Glob.speed);
		y = FlxG.height - height;
		_moving_speed = -5;
		is_moving = true;
	}
}
