package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.*;
	import net.flashpunk.*;
	
	/**
	 * ...
	 * @author Zephyr Raine
	 */
	public class Player extends Entity 
	{
		// GRAPH //
		[Embed(source = "../../assets/player.png")] private const GRAPHIC:Class;
		
		// SOUNDS //
		
		public var image:Image;
		
		public var dy:Number;
		public var dx:Number;
		
		public var speed:Number;
		
		public var gravity:Number;
		
		public var fricty:Number;
		public var frictx:Number;
		
		public var ObjBravoure : Bravoure;
		
		public var lightOn:Boolean = true;
		public var debug:Boolean = true;
		
		
		public function Player() 
		{
			image = new Image(GRAPHIC);
			super(200, 100, image);
			name = "player";
			type = "player";
			ObjBravoure = new Bravoure();
			width = 32;
			//width = image.width;
			//height = image.height;
			height = 32;
			
			speed = 10;
			
			dy = 0;
			dx = 0;
			
			gravity = 0.4;
			fricty = 0.92;
			frictx = 0.92;
			
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
			
			super.update();
		}		
	}

}