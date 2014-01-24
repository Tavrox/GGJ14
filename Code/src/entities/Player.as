package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author Zephyr Raine
	 */
	public class Player extends Entity 
	{
		[Embed(source = "../../assets/player.png")] private const GRAPHIC:Class;
		
		public var image:Image;
		
		public function Player() 
		{
			image = new Image(GRAPHIC);
			super(0, 0, image);
			type = "player";
			//width = image.width;
			width = 32;
			//height = image.height;
			height = 32;
			
		}
		
		override public function update():void
		{
			if (collide("wall", x, y))
			{
				trace("collide");
			}
			super.update();
		}
		
	}

}