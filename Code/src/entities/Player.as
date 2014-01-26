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
		[Embed(source = "../../assets/sfx/player_walk.mp3")] private const STEP:Class;
		[Embed(source = "../../assets/sfx/light_switch_on.mp3")] private const LIGHTON:Class;
		[Embed(source = "../../assets/sfx/light_switch_off.mp3")] private const LIGHTOFF:Class;
		
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
		
		public var switchOn:Sfx;
		public var switchOff:Sfx;
		public var step:Sfx;
		
		public var played:Boolean;
		
		public var onFloor:Boolean;
		public var pressed:Boolean;
		public var onAir:Boolean;
		
		public function Player() 
		{
			image = new Spritemap(GRAPHIC, 16, 32);
			image.add("walkLeft", [0, 1, 2, 3], 6, true);
			image.add("walkRight", [4, 5, 6, 7], 6, true);
			image.add("idleLeft", [0], 4, false);
			image.add("idleRight", [4], 4, false);
			step = new Sfx(STEP);
			switchOn = new Sfx(LIGHTON);
			switchOff = new Sfx(LIGHTOFF);
			name = "player";
			type = "player";
			//SOUNDS
			
			//baby = new Sfx(SOUND);
			
			
			
			
			
			
			
			
			
			
			
			//sound.play();
			//ObjBravoure = new Bravoure();
			
			width = image.width;
			height = image.height-2;
			image.centerOO();
			
			centerOrigin();
			graphic = image;
			speed = 0.5;
			
			dy = 0;
			dx = 0;
			
			jump = 7;
			gravity = 0.8;
			fricty = 0.98;
			frictx = 0.90;
			
			imageMouseLight = new Image(LIGHT);
			imageMouseLight.originX = this.originX + 1;
			imageMouseLight.originY = this.originY - 4;
			
			imagePersoLight = new Image(LIGHTPERSO);
			imagePersoLight.originX = this.originX + 2;
			imagePersoLight.originY = this.originY - 3;
			
			
			mouseLight = new Light(this.x, this.y, imageMouseLight, 3, 1);
			persoLight = new Light(this.x, this.y, imagePersoLight, 2, 1);
			
			gameWorld.lighting.add(persoLight);
			gameWorld.lighting.add(mouseLight);
			
		}
		
		override public function update():void
		{
			if (FP.world.mouseX < this.x) direction = "left";
			else direction = "right";				
				//
			if (Input.check(Key.LEFT) || Input.check(Key.RIGHT))
			{
				step.loop();
				if (direction == "left") image.play("walkLeft");
				else image.play("walkRight");
			}
			else 
			{
				step.stop();
				if (direction == "left") image.play("idleLeft");
				else image.play("idleRight");
			}
			if (dx != 0) step.loop();	
			
			if (Input.mouseDown)
			{ 
				lightOn = true;
			}
			else lightOn = false;
			if (Input.mousePressed)
			{
				switchOn.play();
			}
			if (Input.mouseReleased)
			{
				switchOff.play();
			}
			//
			//var f:Wall = collide("floor", x, y + 1) as Wall;
			//var w:Wall = collide("wall", x, y) as Wall;
			//var s:Wall = collide("stairs", x, y) as Wall;
			//var o:Wall = collide("object", x, y) as Wall;
			//
			//dy += gravity;
			//
			//if (f && y < f.y || o && y < o.y)
			//{
				//if (f)
				//{
					//if (this.y > f.y) this.y -= 2;
				//}
				//if (o)
				//{
					//if (this.y > o.y) 
					//{
						//this.y -= 2; 
					//}
				//}
				//dy = 0;
			//}
			//
			//if (Input.check(Key.LEFT)) 
			//{
				//if (onStairs && stairsDirection == "left")
				//{
					//x -= 1;
					//y -= 1;
				//}
				//else if ((w && x > w.x )||( o && x > o.x+o.width)) dx = 0;
				//else dx = -speed;
			//}
			//
			//else if (Input.check(Key.RIGHT)) 
			//{
				//if (onStairs && stairsDirection == "right" )
				//{
					//x += 1;
					//y -= 1; 
				//}
				//else if ((w && x < w.x ) || (o && x < o.x)) dx = 0;
				//else dx = speed;
			//}
			//
			//
			//if (f && y < f.y) y = f.y-f.height;
			//
			//if (s && !f)
			//{
				//if (s.direction == "left" && this.x > s.x || s.direction == "right" && this.x < s.x)
				//{
					//onStairs = true;
					//dy = 0;
					//stairsDirection = s.direction;
					//if (stairsDirection == "left" && dx < 0) dx = 0;
					//else if (stairsDirection == "right" && dx > 0) dx = 0;
				//}
			//}
			//else onStairs = false;
			//if (Input.pressed(Key.UP) && dy == 0)	dy = -jump; 
			//
			//dx *= frictx;
			//if (dy != 0 && !onStairs) dx *= 1.1;
			//
			//dy *= fricty;
			//
			//y += dy;
			//x += dx;
			//
			//
			
			mouseLight.x = this.x;
			mouseLight.y = this.y;
			persoLight.x = this.x;
			persoLight.y = this.y;
			
			
			angle = Math.atan((FP.world.mouseX - this.x) / (FP.world.mouseY - this.y));
			angle = angle * 180 / Math.PI;
			
			if (FP.world.mouseY < this.y) angle += 90;	
			else angle -= 90;
			
			imageMouseLight.angle = angle;
			//
			if (Input.check(Key.LEFT)) 
			{ 
				dx -= speed;
				pressed = true;
			}
			else if (Input.check(Key.RIGHT))
			{
				dx += speed;
				pressed = true;
			}
			else pressed = false;
			var e:Wall = collide("floor", x, y + 1) as Wall;
			if (e)
		{			
				//FP.log(e.style);
				if (e.style == "floor") onFloor = true;
				else if (e.style == "stairs") onStairs = true;

					dy = 0;
					if (Input.check(Key.UP))
					{
						dy -= jump;
						dx *= 1.5;
					}
				
			}
			else
			{
				dy += gravity;
				onFloor = false;
				onStairs = false;
			}
			
			if (Math.abs(dx) < 1 && !pressed)
			{
				if (e)
				{
					dx = 0;
				} 
			
			}
			dx *= frictx;
			dy *= fricty;
			if (x < 0+width/2) x = 0+width/2;
			if (x > FP.width-width/2) x = FP.width - width/2;
			
			adjustXPos();
			adjustYPos();
			super.update();
		}
		
		public function adjustXPos():void
		{
			for (var i:int = 0; i < Math.abs(dx); i++)
			{
				if (!collide("floor", x + FP.sign(dx), y))
				{
					x += FP.sign(dx);
				}
				else
				{
					dx = 0;
					break;
				}
			}
		}
		
		public function adjustYPos():void
		{
			for (var i:int = 0; i < Math.abs(dy); i ++)
			{
				if (!collide("floor", x, y + FP.sign(dy)))
				{
					onAir = true;
					y += FP.sign(dy);
				}
				else
				{
					dy = 0;
					break;
				}
				
			}
		}
			
			
		
		
	}

}