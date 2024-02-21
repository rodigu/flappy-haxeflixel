import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class ResetState extends FlxSubState
{
	var continue_button:CustomButton;
	var game_over:FlxSprite;
	var high_score:FlxText;

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

		high_score = new FlxText();
		high_score.screenCenter();
		high_score.y = FlxG.height * .3;
		high_score.text = Std.string(Glob.high_score);
		high_score.setFormat('assets/data/kenvector_future.ttf', 40);
		high_score.autoSize = true;
		high_score.alignment = CENTER;
		add(high_score);

		super.create();
	}
}
