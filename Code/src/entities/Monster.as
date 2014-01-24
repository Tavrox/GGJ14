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
	public class Monster extends Entity 
	{
		[Embed(source = "../../assets/monster.png")] public static const GRAPHIC:Class;
		public var image:Image;
		public function Monster() 
		{
			image = new Image(GRAPHIC);
			
			super(700, 200, image);
		}
		
	}

}