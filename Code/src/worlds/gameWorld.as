package worlds 
{
	import entities.*;
	import flash.display.InteractiveObject;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.*;
	import net.flashpunk.utils.*;
	
	
	/**
	 * ...(
	 */
	public class gameWorld extends World 
	{
		//[Embed(source = "../../assets/bg.png")] private const BG:Class;
		[Embed(source = "../../assets/background.jpg")] private const BG:Class;
		[Embed(source = "../../assets/sfx/ambiance.mp3")] private const AMBIENT:Class;
		[Embed(source = "../../assets/sfx/music.mp3")] private const MUSIC:Class;
		[Embed(source = "../../assets/sfx/music_spider.mp3")] private const STRESS:Class;
		
		//HARD
		[Embed(source = "../../assets/sfx/Hard/baby_cry_2.mp3")] private const SOFT01:Class; 
		[Embed(source = "../../assets/sfx/Hard/break_big.mp3")] private const SOFT02:Class;
		[Embed(source = "../../assets/sfx/Hard/clock_chimes.mp3")] private const SOFT03:Class; 
		[Embed(source = "../../assets/sfx/Hard/monster_hide_4.mp3")] private const SOFT04:Class; 
		[Embed(source = "../../assets/sfx/Hard/monster_walk.mp3")] private const SOFT05:Class; 
		[Embed(source = "../../assets/sfx/Hard/phone.mp3")] private const SOFT06:Class; 
		[Embed(source = "../../assets/sfx/Hard/player_breath.mp3")] private const SOFT07:Class; 
		[Embed(source = "../../assets/sfx/Hard/player_fall_3.mp3")] private const SOFT08:Class; 
		[Embed(source = "../../assets/sfx/Hard/player_scream_5.mp3")] private const SOFT09:Class; 
		[Embed(source = "../../assets/sfx/Hard/player_scream_6.mp3")] private const SOFT10:Class; 
		[Embed(source = "../../assets/sfx/Hard/player_scream_7.mp3")] private const SOFT11:Class; 
		[Embed(source = "../../assets/sfx/Hard/wind.mp3")] private const SOFT12:Class; 
		//MEDIUM
		[Embed(source = "../../assets/sfx/Medium/break_near_1.mp3")] private const MEDIUM01:Class; 
		[Embed(source = "../../assets/sfx/Medium/break_near_2.mp3")] private const MEDIUM02:Class;
		[Embed(source = "../../assets/sfx/Medium/clock_tic.mp3")] private const MEDIUM03:Class;
		[Embed(source = "../../assets/sfx/Medium/creak_2.mp3")] private const MEDIUM04:Class;
		[Embed(source = "../../assets/sfx/Medium/creak_3.mp3")] private const MEDIUM05:Class;
		[Embed(source = "../../assets/sfx/Medium/monster_hide_5.mp3")] private const MEDIUM06:Class;
		[Embed(source = "../../assets/sfx/Medium/phone.mp3")] private const MEDIUM07:Class;
		[Embed(source = "../../assets/sfx/Medium/player_breath.mp3")] private const MEDIUM08:Class;
		[Embed(source = "../../assets/sfx/Medium/player_fall_2.mp3")] private const MEDIUM09:Class;
		[Embed(source = "../../assets/sfx/Medium/player_scream_3.mp3")] private const MEDIUM10:Class;
		[Embed(source = "../../assets/sfx/Medium/player_scream_4.mp3")] private const MEDIUM11:Class;
		[Embed(source = "../../assets/sfx/Medium/washing_hands.mp3")] private const MEDIUM12:Class;
		//SOFT
		[Embed(source = "../../assets/sfx/Soft/break_1.mp3")] private const HARD01:Class;
		[Embed(source = "../../assets/sfx/Soft/break_2.mp3")] private const HARD02:Class;
		[Embed(source = "../../assets/sfx/Soft/clock_chimes.mp3")] private const HARD03:Class;
		[Embed(source = "../../assets/sfx/Soft/creak_1.mp3")] private const HARD04:Class;
		[Embed(source = "../../assets/sfx/Soft/player_fall_1.mp3")] private const HARD05:Class;
		[Embed(source = "../../assets/sfx/Soft/player_scream_1.mp3")] private const HARD06:Class;
		[Embed(source = "../../assets/sfx/Soft/player_scream_2.mp3")] private const HARD07:Class;
		[Embed(source = "../../assets/sfx/Soft/toaster.mp3")] private const HARD08:Class;
		[Embed(source = "../../assets/sfx/Soft/wind.mp3")] private const HARD09:Class;
		
		[Embed(source = "../../assets/sfx/Other/toilet.mp3")] private const TOILETS:Class;
		
		[Embed(source="../../assets/Brain Flower Euro.ttf", embedAsCFF = "false", fontFamily = 'My Font')] private const MY_FONT:Class;
		
		
		
		//[Embed(source = '../../assets/sfx/break_big.mp3', mimeType = 'application/octet-stream')]
		//private const sfxBreak:Class;
		//public var _sfxBreak :Sfx = new Sfx(sfxBreak);
		
		public var soft:Array;
		public var medium:Array;
		public var hard:Array;
		
		public var background:Entity;
		public var player:Player;
		public var monster:Monster;
		
		public var ambiance:Sfx;
		public var musique:Sfx;
		public var bruitage:Sfx;
		public var stress:Sfx;
		
		public var toilets:Sfx;
		public var ending:Boolean;
		
		public static var lighting:Lighting;
		
		public var angle:Number;
		public var valeurY:Number;
		
		public var monsterSpeed:Number = 0;
		
		public var lightTimer:Number = 0;
		public var timer:int = 0;
		
		public var textEntity:Text;
		public var caca:Entity;
		
		public function gameWorld() 
		{
			super();
			
			textEntity = new Text("Find the toilets", 0, 0);
			textEntity.color = 0xFFFFFF;
			textEntity.size = 36;
			textEntity.font = "My font";
			
			ambiance = new Sfx(AMBIENT);
			ambiance.volume = 0.2;
			musique = new Sfx(MUSIC);
			musique.volume = 0;
			stress = new Sfx(STRESS);
			toilets = new Sfx(TOILETS);
			//ambiance.loop();
			soft = new Array(SOFT01, SOFT02, SOFT03, SOFT04, SOFT05, SOFT06, SOFT07, SOFT08, SOFT09, SOFT10, SOFT11, SOFT12);
			medium = new Array(MEDIUM01, MEDIUM02, MEDIUM03, MEDIUM04, MEDIUM05, MEDIUM06, MEDIUM07, MEDIUM08, MEDIUM09, MEDIUM10, MEDIUM11, MEDIUM12);
			hard = new Array(HARD01, HARD02, HARD03, HARD04, HARD05, HARD06, HARD07, HARD08, HARD09);

			
			lighting = new Lighting(FP.width, FP.height, 0xffffff, -1000);
			background = new Entity(0, 0, new Image(BG));
			add(background);
			add(lighting);
			caca = new Entity(20, 25, textEntity);
			caca.layer = - 1001;
			player = new Player();
			monster = new Monster();
			add(caca);
			
			
			
			//add(new Stairs());
			add(monster);
			add(player);
			
			add(new Wall(301, 50, 10, 100, "floor"));
			add(new Wall(541, 211, 10, 59, "floor"));
			add(new Wall(459, 380, 10, 100, "floor"));
			add(new Wall(439, 370, 30, 10, "floor"));
			add(new Wall(495, 370, 28, 10, "floor"));
			add(new Wall(551, 370, 11, 10, "floor"));
			
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
			add(new Wall(495, 370, 60, 10, "floor"));
			add(new Wall(606, 370, 354, 10, "floor"));
			
			add(new Wall(0, 480, 212, 10, "floor"));
			add(new Wall(265, 480, 412, 10, "floor"));
			add(new Wall(728, 480, 153, 10, "floor"));
			add(new Wall(901, 480, 59, 10, "floor"));
			
			add(new Wall(0, 590, 960, 10, "floor"));
			
			add(new Wall(241, 236, 50, 24, "floor"));
			add(new Wall(322, 217, 90, 6, "floor"));
			add(new Wall(456, 211, 53, 54, "floor"));
			add(new Wall(281, 305, 326, 6, "floor"));
			add(new Wall(293, 427, 90, 6, "floor"));
			add(new Wall(409, 456, 50, 24, "floor"));
			add(new Wall(380, 566, 50, 24, "floor"));
			add(new Wall(449, 546, 53, 54, "floor"));
			add(new Wall(758, 566, 50, 24, "floor"));
			add(new Wall(839, 539, 90, 6, "floor"));
			
			generateStairs(170, 165, "right");
			generateStairs(940, 165, "right");
			generateStairs(170, 275, "left");
			generateStairs(787, 275, "right");
			generateStairs(20, 385, "left");
			generateStairs(552, 385, "left");
			generateStairs(212, 495, "left");
			generateStairs(728, 495, "right");
			
			add(new Wall(518, 260, 23, 10, "ennemy"));
			add(new Wall(551, 260, 21, 10, "ennemy"));
			add(new Wall(412, 370, 27, 10, "ennemy"));
			add(new Wall(469, 370, 26, 10, "ennemy"));
			add(new Wall(523, 370, 28, 10, "ennemy"));
			add(new Wall(881, 480, 20, 10, "ennemy"));
			add(new Wall(915, 506, 10, 17, "ennemy"));
			add(new Wall(911, 506, 17, 8, "ennemy"));
			add(new Wall(542, 536, 17, 8, "ennemy"));
			add(new Wall(542, 536, 10, 17, "ennemy"));
			add(new Wall(632, 301, 17, 8, "ennemy"));
			add(new Wall(636, 301, 10, 17, "ennemy"));
			
			add(new Wall(922, 414, 38, 67, "toilets"));
			//OBJECTS
			//add(new Wall(70, 120, 50, 30, "object"));
			//add(new Wall();
			startLevel();
			
			
		}
		
		public function startLevel():void
		{
			player.x = 180;
			player.y = 118;
			monster.x = 700;
			monster.y = 200;
			musique.loop(1);
			ambiance.loop(1);
			stress.loop(1);
			monster.changePalier(1);
			monster.enervement = 0;
			
			getSound();
		}
		
		
		override public function update():void 
		{
			if (player.x < monster.x) monster.orientation = "LEFT";
			else if (player.x > monster.x) monster.orientation = "RIGHT";
		//	FP.log(player.onFloor.toString() + player.onStairs.toString() + player.pressed.toString() );
			if (player.lightOn) 
			{
				monster.enervement += 0.1;
				player.mouseLight.active = true;
				player.speed = 0.10;
			}
			else
			{	
				player.mouseLight.active = false;
				player.speed = 0.25;
			}
			monster.moveTowards(player.x, player.y, 0.35 * monster.palier + int(player.lightOn) * 1.5);
			lightTimer++;
			
			if (FP.distance(player.x, player.y, monster.x, monster.y) <= 300) 
			{
				monster.monsterLight.active = true;
				stress.volume = 1;
			}
			else 
			{
				stress.volume = 0
				monster.monsterLight.active = false;
			}
			
			
			if (!bruitage.playing && !ending)
			{
				timer++;
				if (timer >= randomRange(620, 1080))
				{
					getSound();
				}
			}
			FP.log(monster.enervement);
			
			if (player.collide("ennemy", player.x, player.y)) startLevel();
			if (player.collideWith(monster, player.x, player.y)) startLevel();
			if (player.collide("toilets",  player.x, player.y)) endGame();
			
			bringToFront(caca);
			super.update();
		
		}
		
		public function getSound():void
		{
			switch(monster.palier)
			{
				case 1:
					bruitage = new Sfx(soft[FP.rand(soft.length)]);
					break;
				case 2:
					bruitage = new Sfx(medium[FP.rand(medium.length)]);
					break;
				case 3:
					bruitage = new Sfx(hard[FP.rand(hard.length)]);
					break;
			}
			bruitage.play(1);
			timer = 0;
		}
		
		public function generateStairs(x : int, y : int, dir:String):void
		{
			for(var i:uint=0;i<10;i++)
			{
				if(dir == "left") add (new Wall(x+i*10, y+i*10, 25, 10, "stairs", dir, player));
				else if(dir == "right") add (new Wall(x-i*10, y+i*10, 25, 10, "stairs", dir, player));
			}
		}
		
		public function randomRange(minNum:Number, maxNum:Number):Number
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
		
		public function endGame():void
		{
			FP.world = new creditsWorld();
		}
	}

}