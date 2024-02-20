import flixel.FlxG;
import flixel.FlxSprite;
import lime.math.Vector2;

using flixel.util.FlxSpriteUtil;

class Plane extends FlxSprite
{
	var angle_timer:Int;
	var angle_down_speed:Int;
	var frames_ellapsed:Int;

	public var is_dead:Bool;

	public function new()
	{
		super(FlxG.width * .5 - 100, FlxG.height * .4);
		loadGraphic("assets/images/planes.png", true, 88, 73);
		animation.frameIndex = 2;
		animation.add('spin', [1, 12, 9, 12], 15);
		animation.play("spin", true);
		angle_down_speed = 180;
		angle_timer = 0;
		scale.set(.7, .7);
		height *= .7;
		width *= .7;
		frames_ellapsed = 0;
		centerOffsets(true);
		is_dead = false;
	}

	public function center_point()
	{
		return {x: x + width, y: y + height * .5};
	}

	public function center()
	{
		return {x: x + width * .5, y: y + height * .5};
	}

	public function top_point()
	{
		return {x: x + width * .5, y: y};
	}

	public function bottom_point()
	{
		return {x: x, y: y + height};
	}

	override public function update(elapsed:Float)
	{
		if (is_dead)
		{
			if (y < FlxG.height * 1.5)
			{
				acceleration.y = 900;
			}

			return;
		}
		if (FlxG.keys.justPressed.SPACE || FlxG.mouse.justPressedTimeInTicks == 1 || FlxG.touches.justStarted().length > 0)
		{
			if (acceleration.y == 0)
			{
				acceleration.y = 900;
				// velocity.x = 80;
			}

			velocity.y = -350;
			angle = -30;
			angle_timer = 0;
			angularVelocity = 0;
		}

		if (acceleration.y != 0)
		{
			if (angle_timer < 30)
			{
				angle_timer++;
			}
			else if (angularVelocity == 0)
			{
				angularVelocity = angle_down_speed;
			}

			if (angle > 90)
			{
				angle = 90;
			}
		}
		else
		{
			y += Math.sin(frames_ellapsed / 8);
			frames_ellapsed++;
		}

		super.update(elapsed);
	}
}
