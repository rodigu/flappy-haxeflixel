import flixel.text.FlxText;
import flixel.ui.FlxButton;
import haxe.Constraints.Function;

class CustomButton extends FlxButton
{
	public function new(func:Null<() -> Void>)
	{
		super(0, 0, '', func);
		label = new FlxText();
		label.setFormat('assets/data/kenvector_future.ttf', 20);
		scale.set(1.8, 1.8);
		width = scale.x * label.width;
		height = scale.y * label.height;
		label.color = 0x000000;
		label.x = x;
		label.centerOrigin();

		centerOffsets(true);
		updateHitbox();
	}
}
