import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class PauseState extends FlxSubState
{
	var continue_button:FlxButton;

	public function new()
	{
		super(0x33000000);
	}

	override public function create()
	{
		continue_button = new FlxButton(0, 0, 'continua', close);
		continue_button.screenCenter();
		add(continue_button);

		super.create();
	}
}
