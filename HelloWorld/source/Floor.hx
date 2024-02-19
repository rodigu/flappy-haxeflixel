import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Floor extends ScrollingSprite
{
	public function new(offset = 0)
	{
		super('assets/images/groundGrass.png', offset, 1.5, Glob.speed);
		y = FlxG.height - height;
	}
}
