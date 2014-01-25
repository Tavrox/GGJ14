package worlds 
{
	import entities.*;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.*;
	
	
	/**
	 * ...
	 * @author Zephyr Raine
	 */
	public class gameWorld extends World 
	{
		[Embed(source = "../../assets/bg.png")] private const BG:Class;
		public var background:Entity;
		public var player:Player;
		public var monster:Monster;
		public var speed:Number = 10;
		public function gameWorld() 
		{
			super();
			
			background = new Entity(0, 0, new Image(BG));
			player = new Player();
			monster = new Monster();
			add(background);
			add (player);
			add(monster);
		}
		
		override public function update():void 
		{	
			super.update();
			if (player.lightOn) 
			{
				monster.visible = true;
				monster.moveTowards(player.x, player.y, 5);
			}
			else monster.visible = false;
		}
	}

}