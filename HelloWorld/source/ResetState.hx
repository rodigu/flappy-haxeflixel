import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class ResetState extends FlxSubState
{
	var continue_button:CustomButton;
	var game_over:FlxSprite;

	public function new()
	{
		super(0x77000000);
	}

	override public function create()
	{
		continue_button = new CustomButton(function()
		{
			Glob.PS.reset();
			close();
		});
		continue_button.screenCenter();
		continue_button.y = FlxG.height * .6;
		continue_button.label.text = 'restart';
		add(continue_button);

		game_over = new FlxSprite();
		game_over.loadGraphic('assets/images/textGameOver.png');
		game_over.screenCenter();
		game_over.y = FlxG.height * .4;
		game_over.scale.set(.8, .8);
		add(game_over);

		super.create();
	}
}
