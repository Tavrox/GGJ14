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
		[Embed(source = "../../assets/mockup-merge1.jpg")] private const BG:Class;
		[Embed(source = "../../assets/sfx/ambiance.mp3")] private const MUSIC:Class;
		
		//[Embed(source = '../../assets/sfx/break_big.mp3', mimeType = 'application/octet-stream')]
		//private const sfxBreak:Class;
		//public var _sfxBreak :Sfx = new Sfx(sfxBreak);
		
		public var background:Entity;
		public var player:Player;
		public var monster:Monster;
		
		public var ambiance:Sfx;
		
		public static var lighting:Lighting;
		
		public var angle:Number;
		public var valeurY:Number;
		
		public var monsterSpeed:Number = 0;
		
		public var lightTimer:Number = 0;
		
		public function gameWorld() 
		{
			super();
			
			ambiance = new Sfx(MUSIC);
			//ambiance.loop();
			
			lighting = new Lighting(FP.width, FP.height, 0xffffff, -1000);
			background = new Entity(0, 0, new Image(BG));
			add(background);
			//add(lighting);
			player = new Player();
			monster = new Monster();
			
			add(new Wall(0, 150, 121, 11, "floor"));
			add(new Wall(180, 150, 736, 11, "floor"));
			add(new Wall(0, 260, 960, 11, "floor"));
			add(new Wall(500, 0, 10, 200, "wall"));
			//add(new Stairs());
			add(monster);
			add(player);
			generateStairs(120, 155);
		}
		
		
		override public function update():void 
		{
			
			
			if (player.lightOn) 
			{
				monster.enervement += 0.01;
				player.mouseLight.active = true;
			}
			else
			{	
				player.mouseLight.active = false;
			}
			monster.moveTowards(player.x, player.y, 0.10 * monster.enervement + int(player.lightOn) * 2);
			lightTimer++;
			
			
			FP.log(lightTimer / 180);
			
			super.update();
		}
		
		public function generateStairs(x : int, y : int):void
		{
			for(var i:uint=0;i<11;i++)
			{
				add (new Wall(x+i*10, y+i*10, 10, 10, "stairs", "left"));
			}
		}
	}

}