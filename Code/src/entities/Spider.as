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
	public class Spider extends Entity 
	{
		[Embed(source = "../../assets/spider.png")] private const GRAPHIC:Class;
		public function Spider(_x:int, _y:int) 
		{
			super(_x, _y, new Image(GRAPHIC));
			type = "ennemy";
			height = width = 16;
		}
		
	}

}