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
		public var imageSmall:Image;
		public var imageMiddle:Image;
		public var imageBig:Image;
		
		public var monsterLight:Light;
		public var imageMonsterLight:Image;
		public var enervement:Number = 1;
		public var palier:int;
		public function Monster() 
		{
			imageSmall = new Image(SMALL);
			imageMiddle = new Image(MIDDLE);
			imageBig = new Image(BIG);
			
			
			monsterLight = new Light(this.x, this.y, imageMonsterLight);
			
			changePalier(1);
			imageSmall.centerOO();
			imageMiddle.centerOO();
			imageBig.centerOO();
			centerOrigin();		
			imageMonsterLight.originX = this.originX;
			imageMonsterLight.originY = this.originY;
			gameWorld.lighting.add(monsterLight);
			
			super(700, 200, imageSmall);
		}
		
		override public function update():void
		{
			if (enervement >= 10 && palier == 1)
			{
				changePalier(2);
			}
			if (enervement >= 25 && palier == 2)
			{
				changePalier(3);
			}
		
			monsterLight.x = this.x;
			monsterLight.y = this.y;
			super.update();
		}
		
		public function changePalier(papa:int):void
		{
			palier = papa;
			switch(palier)
			{
				case 1:
					graphic = imageSmall;
					setHitbox(imageSmall.width, imageSmall.height);
					centerOrigin();		
					monsterLight.image = imageMonsterLight = new Image(SMALL_EYES);
					imageMonsterLight.originX = this.originX;
					imageMonsterLight.originY = this.originY;
					break;
				case 2:
					graphic = imageMiddle;
					setHitbox(imageMiddle.width, imageMiddle.height);
					centerOrigin();		
					monsterLight.image = imageMonsterLight = new Image(MIDDLE_EYES);
					imageMonsterLight.originX = this.originX;
					imageMonsterLight.originY = this.originY;
					break;
				case 3:
					graphic = imageBig;
					setHitbox(imageBig.width, imageBig.height);
					centerOrigin();		
					monsterLight.image = imageMonsterLight = new Image(BIG_EYES);
					imageMonsterLight.originX = this.originX;
					imageMonsterLight.originY = this.originY;
					break;
					
			}
		}
	}

}