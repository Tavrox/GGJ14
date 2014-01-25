package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
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
		[Embed(source = "../../assets/player.png")] private const GRAPHIC:Class;
		[Embed(source = "../../assets/circle_gradient.png")] private const LIGHT:Class;
		[Embed(source = "../../assets/lightPerso.png")] private const LIGHTPERSO:Class;
		
		// SOUNDS //
		
		public var image:Image;
		
		public var dy:Number;
		public var dx:Number;
		
		public var speed:Number;
		
		public var gravity:Number;
		
		public var fricty:Number;
		public var frictx:Number;
		
		//public var ObjBravoure : Bravoure;
		
		public var lightOn:Boolean = true;
		public var debug:Boolean = true;
		
		public var imageMouseLight:Image;
		public var imagePersoLight:Image;
		
		public var mouseLight:Light;
		public var persoLight:Light;
		
		public var angle:Number;
		
		public function Player() 
		{
			x = 200;
			y = 100;
			image = new Image(GRAPHIC);
			name = "player";
			type = "player";
			
			//ObjBravoure = new Bravoure();
			
			//width = image.width;
			//height = image.height;
			width = 32;
			height = 32;
			image.centerOO();
			
			centerOrigin();
			graphic = image;
			speed = 3;
			
			dy = 0;
			dx = 0;
			
			gravity = 0.4;
			fricty = 0.92;
			frictx = 0.92;
			
			imageMouseLight = new Image(LIGHT);
			imageMouseLight.originX = this.originX-8;
			imageMouseLight.originY = this.originY - 8;
			
			imagePersoLight = new Image(LIGHTPERSO);
			imagePersoLight.originX = this.originX - 8;
			imagePersoLight.originY = this.originY - 8;
			
			
			mouseLight = new Light(this.x, this.y, imageMouseLight, 4, 1);
			persoLight = new Light(this.x, this.y, imagePersoLight, 4, 1);
			
			gameWorld.lighting.add(persoLight);
			gameWorld.lighting.add(mouseLight);
			
		}
		
		override public function update():void
		{
			if (collide("ennemy", x, y))
			{
				FP.world.remove(this);
			}
			if (collide("wall",  x, y))
			{
				trace ("collision");
			}
			
			if (debug)
			{
				if (Input.check(Key.LEFT)) dx = -speed;
				else if (Input.check(Key.RIGHT)) dx = speed;
				
				if (Input.check(Key.UP)) dy = -speed;
				else if (Input.check(Key.DOWN)) dy = speed;
			}
			
			
			else
			{
				if (Input.check(Key.LEFT)) dx = -speed;
				else if (Input.check(Key.RIGHT)) dx = speed;
				
				if (Input.pressed(Key.UP) && dy == 0) dy = -speed;
			//else if (Input.check(Key.DOWN)) dy = speed;
			}
			
			if (Input.mouseDown) lightOn = true;
			else lightOn = false;
	
			//dy += gravity;
			dy *= fricty;
			
			
			dx *= frictx;
			
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
	}

}