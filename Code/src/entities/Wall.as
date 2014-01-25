package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Zephyr Raine
	 */
	public class Wall extends Entity
	{
		
		//[Embed(source = "../../assets/walldebug.png")] private const GRAPHIC:Class;
		public var image:Image;
		public var direction:String;
		public function Wall(_x:int, _y:int, _width:int, _height:int, stairs:Boolean = false, _direction:String = "") 
		{
			//image = new Image(GRAPHIC);
			
			super(_x, _y);
			setHitbox(_width, _height);
			if(stairs)centerOrigin();
			if (stairs) type = "stairs";
			else type = "wall";
			direction = _direction;
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}