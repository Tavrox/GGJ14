package worlds
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Stamp;
	
	public class helpWorld extends World
	{
		[Embed(source = "../../assets/controls.png")] private const WALL:Class;
		[Embed(source="../../assets/switch.png")] private const SWITCH:Class;
		public function helpWorld()
		{
			add(new Entity(0, 0, new Image(WALL)));
			add(new Entity(15, 500, new Image(SWITCH)));
			//Main Menu Text
			var BackText:Text = new Text("MAIN MENU");
            BackText.color = 0x808080;
            BackText.size = 30;
            var BackEntity:Entity = new Entity(0,0,BackText);
            BackEntity.x = 70
            BackEntity.y = 500;
            add(BackEntity);
		}
		override public	function update():void
		{
			if (Input.mousePressed)
			{
				if (mouseX > 30 && mouseX < 60 && mouseY > 500 && mouseY < 530)
				{
					FP.world = new menuWorld;
					trace("escape");
				}
			}
		}
	}
}