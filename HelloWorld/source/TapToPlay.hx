import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;

class TapToPlay extends FlxTypedGroup<FlxSprite>
{
	var hand:FlxSprite;
	var shiny_hand:FlxSprite;
	var f_count:Int;
	var location:{x:Float, y:Float};
	var is_visible = true;

	public function new()
	{
		super(2);
		location = {
			x: FlxG.width * .4,
			y: FlxG.height * .5
		}
		hand = new FlxSprite(location.x, location.y);
		hand.loadGraphic('assets/images/tap.png');
		add(hand);
		shiny_hand = new FlxSprite(location.x, location.y);
		shiny_hand.loadGraphic('assets/images/tapTick.png');
		add(shiny_hand);
		f_count = 0;
		is_visible = true;
	}

	public function show()
	{
		hand.x = location.x;
		hand.y = location.y;
		shiny_hand.x = location.x;
		shiny_hand.y = location.y;
		is_visible = true;
	}

	public function hide()
	{
		hand.y = FlxG.height;
		shiny_hand.y = FlxG.height;
		is_visible = false;
	}

	override public function update(elapsed:Float)
	{
		f_count++;

		if (f_count % 60 < 30)
		{
			shiny_hand.y = FlxG.height;
		}
		else
		{
			shiny_hand.y = hand.y;
		}
	}
}
