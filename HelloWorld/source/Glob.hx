package;

class Glob
{
	static public var score = 0;
	static public var PS:PlayState;
	static public var high_score:Int;
	static public var speed = -3;
	static public var States = {
		wait: 'wait',
		play: 'play',
		reset: 'reset'
	}
	static public var state = 'wait';
}
