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
			
			
			//add(new Stairs());
			add(monster);
			add(player);
			//MURS
			add(new Wall(301, 50, 10, 100, "wall"));
			add(new Wall(541, 201, 10, 69, "wall"));
			add(new Wall(459, 380, 10, 100, "wall"));
			add(new Wall(439, 370, 30, 10, "wall"));
			add(new Wall(495, 370, 28, 10, "wall"));
			add(new Wall(551, 370, 11, 10, "wall"));
			//SOLS
			add(new Wall(0, 150, 117, 10, "floor"));
			add(new Wall(169, 150, 718, 10, "floor"));
			add(new Wall(940, 150, 20, 10, "floor"));
			
			add(new Wall(0, 260, 171, 10, "floor"));
			add(new Wall(222, 260, 296, 10, "floor"));
			add(new Wall(572, 260, 163, 10, "floor"));
			add(new Wall(786, 260, 174, 10, "floor"));
			
			add(new Wall(0, 370, 20, 10, "floor"));
			add(new Wall(74, 370, 338, 10, "floor"));
			add(new Wall(439, 370, 30, 10, "floor"));
			add(new Wall(495, 370, 28, 10, "floor"));
			add(new Wall(551, 370, 11, 10, "floor"));
			add(new Wall(606, 370, 354, 10, "floor"));
			
			add(new Wall(0, 480, 212, 10, "floor"));
			add(new Wall(265, 480, 412, 10, "floor"));
			add(new Wall(728, 480, 153, 10, "floor"));
			add(new Wall(901, 480, 59, 10, "floor"));
			
			add(new Wall(0, 590, 960, 10, "floor"));
			//ESCALIERS
			generateStairs(170, 155, "right");
			generateStairs(940, 155, "right");
			generateStairs(170, 265, "left");
			generateStairs(787, 265, "right");
			generateStairs(20, 375, "left");
			generateStairs(552, 375, "left");
			generateStairs(212, 485, "left");
			generateStairs(728, 485, "right");
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
		
		public function generateStairs(x : int, y : int, dir:String):void
		{
			for(var i:uint=0;i<11;i++)
			{
				if(dir == "left") add (new Wall(x+i*10, y+i*10, 10, 10, "stairs", dir));
				else if(dir == "right") add (new Wall(x-i*10, y+i*10, 10, 10, "stairs", dir));
			}
		}
	}

}