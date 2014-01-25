package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	import worlds.gameWorld;
	/**
	 * ...
	 * @author Zephyr Raine
	 */
	public class Monster extends Entity 
	{
		[Embed(source = "../../assets/monster.png")] public static const GRAPHIC:Class;
		[Embed(source = "../../assets/eyes.png")] private const LIGHTMONSTER:Class;
		public var image:Image;
		
		public var monsterLight:Light;
		public var imageMonsterLight:Image;
		
		public function Monster() 
		{
			imageMonsterLight = new Image(LIGHTMONSTER);
			monsterLight = new Light(this.x, this.y, imageMonsterLight);
			
			image = new Image(GRAPHIC);
			setHitbox(image.width, image.height);
			image.centerOO();
			centerOrigin();
			
			imageMonsterLight.originX = this.originX;
			imageMonsterLight.originY = this.originY-12;
			gameWorld.lighting.add(monsterLight);
			
			super(700, 200, image);
		}
		
		override public function update():void
		{
			monsterLight.x = this.x;
			monsterLight.y = this.y;
			super.update();
		}
		
	}

}