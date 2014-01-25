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
		
		[Embed(source = "../../assets/eyes_small2.png")] private const SMALL_EYES:Class;
		[Embed(source = "../../assets/eyes_middle2.png")] private const MIDDLE_EYES:Class;
		[Embed(source = "../../assets/eyes_big2.png")] private const BIG_EYES:Class;
		[Embed(source = "../../assets/monster_small.png")] private const SMALL:Class;
		[Embed(source = "../../assets/monster_middle.png")] private const MIDDLE:Class;
		[Embed(source = "../../assets/monster_big.png")] private const BIG:Class;
		public var image:Image;
		
		public var monsterLight:Light;
		public var imageMonsterLight:Image;
		public var enervement:Number = 1;
		public function Monster() 
		{
			image = new Image(SMALL);
			imageMonsterLight = new Image(SMALL_EYES);
		
			
			monsterLight = new Light(this.x, this.y, imageMonsterLight);
			setHitbox(image.width, image.height);
			image.centerOO();
			centerOrigin();		
			imageMonsterLight.originX = this.originX;
			imageMonsterLight.originY = this.originY;
			gameWorld.lighting.add(monsterLight);
			
			super(700, 200, image);
		}
		
		override public function update():void
		{
			if (enervement == 100)
			{
					image = new Image(MIDDLE);
					imageMonsterLight = new Image(MIDDLE_EYES);
			}
			if (enervement == 200)
			{
					image = new Image(BIG);
					imageMonsterLight = new Image(BIG_EYES);
			}
		
			monsterLight.x = this.x;
			monsterLight.y = this.y;
			super.update();
		}
		
	}

}