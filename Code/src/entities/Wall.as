package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.*;
	/**
	 * ...
	 * @author Zephyr Raine
	 */
	public class Wall extends Entity
	{
		
		//[Embed(source = "../../assets/walldebug.png")] private const GRAPHIC:Class;
		public var image:Image;
		public var direction:String;
		public var style:String;
		public var ref:Player;
		public function Wall(_x:int, _y:int, _width:int, _height:int, _type:String = "", _direction:String = "", reference:Player=null) 
		{
			//image = new Image(GRAPHIC);
			
			super(_x, _y);
			setHitbox(_width, _height);
			if (_type == "ennemy") type = "ennemy";
			else if (_type == "toilets") type = "toilets";
			else type = "floor";
			style = _type;
			ref = reference;
			if (style == "stairs") centerOrigin();
			direction = _direction;
		}
		
		override public function update():void
		{
			
			if (ref && ref.onFloor && style == "stairs") this.collidable = false;
		    else if (ref && (this.y - ref.y) < 20 && style == "stairs") this.collidable = false;
			else this.collidable = true;
			
			
			super.update();
		}
		
	}

}