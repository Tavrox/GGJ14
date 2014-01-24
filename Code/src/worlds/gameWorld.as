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
			add(new Wall(0, 550, 10, 960));
		}
		
		override public function update():void 
		{
		
			
			super.update();
		}
	}

}