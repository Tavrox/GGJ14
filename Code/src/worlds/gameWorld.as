package worlds 
{
	import entities.*;
	import net.flashpunk.World;
	import net.flashpunk.utils.*;
	
	
	/**
	 * ...
	 * @author Zephyr Raine
	 */
	public class gameWorld extends World 
	{
		public var player:Player;
		
		public function gameWorld() 
		{
			super();
			player = new Player();
			add (player);
			add (new Wall(100, 200, 25, 50)); 
			
		}
		
		override public function update():void 
		{
		
			if (Input.check(Key.LEFT)) player.x -= 10;
			else if (Input.check(Key.RIGHT)) player.x += 10;
			
			if (Input.check(Key.UP)) player.y -= 10;
			else if (Input.check(Key.DOWN)) player.y += 10;
			
			super.update();
		}
	}

}