package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.*;
	
	/**
	 * ...
	 * @author Zephyr Raine
	 */
	public class Player extends Entity 
	{
		[Embed(source = "../../assets/player.png")] private const GRAPHIC:Class;
		
		public var image:Image;
		
		public var dy:Number;
		public var dx:Number;
		
		public var speed:Number;
		
		public var gravity:Number;
		
		public var fricty:Number;
		public var frictx:Number;
		
		public function Player() 
		{
			image = new Image(GRAPHIC);
			super(200, 100, image);
			type = "player";
			//width = image.width;
			width = 32;
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
			if (collide("wall", x, y))
			{
				dy = 0;
			}
			else
			{
				dy += gravity;
				dy *= fricty;
			}
			
			if (Input.check(Key.LEFT)) dx = -speed;
			else if (Input.check(Key.RIGHT)) dx = speed;
			
			if (Input.pressed(Key.UP) && dy == 0) dy = -speed;
			else if (Input.check(Key.DOWN)) dy = speed;
	
			dx *= frictx;
			
			y += dy;
			x += dx;
			
			super.update();
			
			
		}
		
	}

}