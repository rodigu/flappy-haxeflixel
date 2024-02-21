import flixel.FlxG;
import flixel.FlxSprite;
import flixel.sound.FlxSound;

class Coin extends FlxSprite
{
	var collect_sound:FlxSound;

	public function new(x:Float, y:Float)
	{
		super(x, y);
		loadGraphic('assets/images/medalGold.png');
		scale.set(.7, .7);
		width *= .7;
		height *= .7;
		centerOffsets(true);
		collect_sound = FlxG.sound.load('assets/sounds/TOUCH_BUTTON.wav');
	}

	override public function update(elapsed:Float)
	{
		if (is_inside(Glob.PS.plane.center()) && !Glob.PS.plane.is_dead)
		{
			y = FlxG.height;
			Glob.score++;
			collect_sound.play(true);
		};
	}

	function is_inside(pt:{x:Float, y:Float})
	{
		return (Math.pow(x + width * .5 - pt.x, 2) + Math.pow(y + height * .5 - pt.y, 2) <= Math.pow(width * .7, 2));
	}
}
