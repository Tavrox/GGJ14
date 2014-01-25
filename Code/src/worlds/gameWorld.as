package worlds 
{
	import entities.*;
	import flash.display.InteractiveObject;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.*;
	import net.flashpunk.utils.*;
	
	
	/**
	 * ...(
	 */
	public class gameWorld extends World 
	{
		//[Embed(source = "../../assets/bg.png")] private const BG:Class;
		[Embed(source = "../../assets/mockup-bastien.jpg")] private const BG:Class;
		
		//[Embed(source = '../../assets/sfx/break_big.mp3', mimeType = 'application/octet-stream')]
		//private const sfxBreak:Class;
		//public var _sfxBreak :Sfx = new Sfx(sfxBreak);
		
		public var background:Entity;
		public var player:Player;
		public var monster:Monster;
		public var speed:Number = 10;
		
		public static var lighting:Lighting;
		
		public var angle:Number;
		public var valeurY:Number;
		public function gameWorld() 
		{
			super();
			
			lighting = new Lighting(FP.width, FP.height, 0xFFFFFF, -1000);
			background = new Entity(0, 0, new Image(BG));
			add(background);
			add(lighting);
			player = new Player();
			monster = new Monster();
			
			add(player);
			generateStairs(100, 100);
		}
		
		
		override public function update():void 
		{
			
			if (player.lightOn) 
			{
				player.mouseLight.active = true;
				monster.monsterLight.active = true;
				monster.visible = true;
				monster.moveTowards(player.x, player.y, 5);
				player.speed = 2;
			}
			else
			{
				monster.monsterLight.active = false;
				player.mouseLight.active = false;
				monster.visible = false;
				player.speed = 4;
			}
			
			super.update();
		}
		
		public function generateStairs(x : int, y : int)
		{
			for(var i:uint=0;i<10;i++)
			{
				add (new Wall(x+i*10, y+i*10, 10, 10));
			}
		}
	}

}