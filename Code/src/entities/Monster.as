package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
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
		public var imageSmall:Spritemap;
		public var imageMiddle:Spritemap;
		public var imageBig:Spritemap;
		
		public var monsterLight:Light;
		public var imageMonsterLight:Image;
		public var enervement:Number = 1;
		public var palier:int;
		
		public var orientation:String;
		public function Monster() 
		{
			imageSmall = new Spritemap(SMALL, 56, 37);
			imageMiddle = new Spritemap(MIDDLE, 70, 43);
			imageBig = new Spritemap(BIG, 103, 58);
			
			
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
			switch(palier)
			{
				case 1:
					if (orientation == "LEFT") imageSmall.play("walkLeft");
					else imageSmall.play("walkRight");
					break;
				case 2:
					if (orientation == "LEFT") imageMiddle.play("walkLeft");
					else imageMiddle.play("walkRight");
					imageMiddle.play("walkLeft");
					break;
				case 3:
					if (orientation == "LEFT") imageBig.play("walkLeft");
					else imageBig.play("walkRight");
					break;
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
					imageSmall.add("walkLeft", [0, 1], 12, true);
					imageSmall.add("walkRight", [2, 3], 12, true);
					graphic = imageSmall;
					setHitbox(imageSmall.width, imageSmall.height);
					centerOrigin();		
					monsterLight.image = imageMonsterLight = new Image(SMALL_EYES);
					imageMonsterLight.originX = this.originX;
					imageMonsterLight.originY = this.originY;
					break;
				case 2:
					imageMiddle.add("walkLeft", [0, 1], 12, true);
					imageMiddle.add("walkRight", [2, 3], 12, true);
					graphic = imageMiddle;
					setHitbox(imageMiddle.width, imageMiddle.height);
					centerOrigin();		
					monsterLight.image = imageMonsterLight = new Image(MIDDLE_EYES);
					imageMonsterLight.originX = this.originX;
					imageMonsterLight.originY = this.originY;
					break;
				case 3:
					imageBig.add("walkLeft", [0, 1, 2], 12, true);
					imageBig.add("walkRight", [3, 4, 5], 12, true);
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