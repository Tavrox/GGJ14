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
	public class Stairs extends Entity 
	{
		[Embed(source = "../../assets/escalier.png")] private const GRAPHIC:Class;
		public var image:Image;
		
		public function Stairs() 
		{
			image = new Image(GRAPHIC);
			super(120, 160, image);
			setHitbox(image.width, image.height);
<<<<<<< HEAD
			type = "stairs";
		
			
=======
			//type = "wall";
>>>>>>> 694d5f8aaa0167d7495e4e46a3bc42ed40553d52
		}
		
	}

}