import flixel.FlxG;
import flixel.FlxSprite;

class Coin extends FlxSprite
{
	public function new(x:Float, y:Float)
	{
		super(x, y);
		loadGraphic('assets/images/medalGold.png');
		scale.set(.7, .7);
		width *= .7;
		height *= .7;
		centerOffsets(true);
	}

	override public function update(elapsed:Float)
	{
		if (is_inside(Glob.PS.plane.center()))
		{
			y = FlxG.height;
			Glob.score++;
		};
	}

	function is_inside(pt:{x:Float, y:Float})
	{
		return (Math.pow(x + width * .5 - pt.x, 2) + Math.pow(y + height * .5 - pt.y, 2) <= Math.pow(width * .7, 2));
	}
}
