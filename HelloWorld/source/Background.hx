import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Background extends ScrollingSprite
{
	public function new(offset = 0)
	{
		super('assets/images/background.png', offset);
	}
}
