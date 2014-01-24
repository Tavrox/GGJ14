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
		public var monster:Monster;
		public var speed:Number = 10;
		public function gameWorld() 
		{
			super();
			
			player = new Player();
			monster = new Monster();
			add (player);
			add(monster);
		}
		
		override public function update():void 
		{	
			super.update();
			if (player.lightOn) monster.moveTowards(player.x, player.y, 5);
			
		}
	}

}