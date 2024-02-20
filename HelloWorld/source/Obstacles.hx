import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;

class Obstacles extends FlxTypedGroup<ObstaclePair>
{
	public var obstacles:Array<ObstaclePair>;

	public function new()
	{
		super(3);
		obstacles = [];
		for (i in 0...3)
		{
			obstacles.push(new ObstaclePair(FlxG.width, FlxG.height * .5));
			add(obstacles[i]);
		}
		obstacles[0].add_ref(obstacles[2]);
		obstacles[1].add_ref(obstacles[0], true);
		obstacles[2].add_ref(obstacles[1], true);
	}

	public function move()
	{
		for (ob in obstacles)
			ob.move();
	}

	public function stop()
	{
		for (ob in obstacles)
		{
			ob.stop();
		}
	}

	public function repos()
	{
		obstacles[0].posx(FlxG.width);
		obstacles[1].reset_func();
		obstacles[2].reset_func();
	}
}
