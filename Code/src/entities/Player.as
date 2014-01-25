package entities 
{
	import flash.display.Sprite;
	import flash.media.Sound;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.*;
	import net.flashpunk.*;
	import worlds.gameWorld;
	
	/**
	 * ...
	 * @author Zephyr Raine
	 */
	public class Player extends Entity 
	{
		// GRAPH //
		[Embed(source = "../../assets/character.png")] private const GRAPHIC:Class;
		[Embed(source = "../../assets/circle_gradient.png")] private const LIGHT:Class;
		[Embed(source = "../../assets/lightPerso.png")] private const LIGHTPERSO:Class;
		
		// SOUNDS //
		[Embed(source = "../../assets/sfx/baby_cry_1.mp3")] private const SOUND:Class;
		
		public var image:Spritemap;
		public var direction:String;
		
		public var onStairs:Boolean;
		public var stairsDirection:String;
		
		public var dy:Number;
		public var dx:Number;
		
		public var speed:Number;
		
		public var gravity:Number;
		
		public var fricty:Number;
		public var frictx:Number;
		
		public var jump:Number;
		
		//public var ObjBravoure : Bravoure;
		
		public var lightOn:Boolean = true;
		public var debug:Boolean = false; // DEBUG BDEGUERUGREUGERZ !!		
		public var imageMouseLight:Image;
		public var imagePersoLight:Image;
		
		public var mouseLight:Light;
		public var persoLight:Light;
		
		public var angle:Number;
		
		public var sound:Sfx;
		public var baby:Sfx;
		
		public var played:Boolean;
		
		public function Player() 
		{
			x = 200;
			y = 100;
			image = new Spritemap(GRAPHIC, 16, 32);
			image.add("walkLeft", [0, 1, 2, 3], 6, true);
			image.add("walkRight", [4, 5, 6, 7], 6, true);
			image.add("idleLeft", [0], 4, false);
			image.add("idleRight", [4], 4, false);
			name = "player";
			type = "player";
			//SOUNDS
			
			baby = new Sfx(SOUND);
			
			
			
			
			
			
			
			
			
			
			
			//sound.play();
			//ObjBravoure = new Bravoure();
			
			width = image.width;
			height = image.height;
			image.centerOO();
			
			centerOrigin();
			graphic = image;
			speed = 3;
			
			dy = 0;
			dx = 0;
			
			jump = 10;
			gravity = 0.8;
			fricty = 0.98;
			frictx = 0.90;
			
			imageMouseLight = new Image(LIGHT);
			imageMouseLight.originX = this.originX;
			imageMouseLight.originY = this.originY - 8;
			
			imagePersoLight = new Image(LIGHTPERSO);
			imagePersoLight.originX = this.originX ;
			imagePersoLight.originY = this.originY - 8;
			
			
			mouseLight = new Light(this.x, this.y, imageMouseLight, 3, 1);
			persoLight = new Light(this.x, this.y, imagePersoLight, 3, 1);
			
			gameWorld.lighting.add(persoLight);
			gameWorld.lighting.add(mouseLight);
			
		}
		
		override public function update():void
		{
			
			if (FP.world.mouseX < this.x) direction = "left";
			else direction = "right";
			
			if (collide("ennemy", x, y))
			{
				FP.world.remove(this);
			}
			
			checkSounds();
			
			if (debug)
			{
				if (Input.check(Key.LEFT)) dx = -speed;
				else if (Input.check(Key.RIGHT)) dx = speed;
				
				if (Input.check(Key.UP)) dy = -speed;
				else if (Input.check(Key.DOWN)) dy = speed;
			}
			
			
			
			else
			{
				
				
				if (Input.check(Key.LEFT) || Input.check(Key.RIGHT))
				{
					if (direction == "left") image.play("walkLeft");
					else image.play("walkRight");
				}
				else 
				{
					if (direction == "left") image.play("idleLeft");
					else image.play("idleRight");
				}
				
				
			
			if (Input.mouseDown) lightOn = true;
			else lightOn = false;
	
			if (!debug) dy += gravity;
			var w:Wall = collide("wall",  x, y) as Wall;
			if (w)
			{
				dy = 0;
			}
			
			var s:Wall = collide("stairs", x, y) as Wall;
			if (s && !w)
			{
				if (s.direction == "left" && this.x > s.x || s.direction == "right" && this.x < s.x)
				{
					onStairs = true;
					dy = 0;
					stairsDirection = s.direction;
					if (stairsDirection == "left" && dx < 0) dx = 0;
					else if (stairsDirection == "right" && dx > 0) dx = 0;
				}
			}
			else onStairs = false;
			if (Input.pressed(Key.UP) && dy == 0)	dy = -jump;
			//else if (Input.check(Key.DOWN)) dy = speed;
			
				if (Input.check(Key.LEFT)) 
				{
					if (onStairs && stairsDirection == "left")
					{
						x -= 1;
						y -= 1;
						
					}
					else dx = -speed;
				}
				else if (Input.check(Key.RIGHT)) 
				{
					if (onStairs && stairsDirection == "right")
					{
					}
					else dx = speed;
				}
			}
			
			dx *= frictx;
			
			dy *= fricty;
			y += dy;
			x += dx;
			mouseLight.x = this.x;
			mouseLight.y = this.y;
			persoLight.x = this.x;
			persoLight.y = this.y;
			
			
			if (FP.world.mouseY < this.y)
			{
				angle = Math.atan((FP.world.mouseX - this.x) / (FP.world.mouseY - this.y));

				angle = angle * 180 / Math.PI;
				angle += 90;	
			}
			else
			{
				if (FP.world.mouseX < this.x ) angle = 180;
				else angle = 0;
			}
			
			imageMouseLight.angle = angle;
			
			super.update();
		}
		
		public function checkSounds():void
		{
			if (!played)
			{
				if (collidePoint(x, y, 200, 100)) sound = baby;
			//	else if (collidePoint(x, y, 250, 300)) sound = bouteille;
				else sound = null;
				
				if (sound) 
				{
					played = true;
					sound.play();
				}
				
			}
			else
			{
				played = false;
			}
			
		}
	}

}