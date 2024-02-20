import flixel.FlxG;
import flixel.FlxSprite;

class Background extends ScrollingSprite
{
	public function new(offset = 0)
	{
		super('assets/images/background.png', offset);
		is_moving = true;
	}
}
