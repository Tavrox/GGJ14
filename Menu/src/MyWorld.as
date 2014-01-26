package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Stamp;
	
	public class MyWorld extends World
	{
		FP.console.debug = true;
		FP.console.enable();
		[Embed(source="pict/switch.png")] private const SWITCH:Class;
		[Embed(source = "pict/MainMenu.png")] private const WALL:Class;
		public function MyWorld()
		{
			add(new MyEntity());
			add(new Entity(0, 0, new Image(WALL)));
			add(new Entity(890, 510, new Image(SWITCH)));
			add(new Entity(890, 460, new Image(SWITCH)));
			//PRESS ENTER 
			var PlayText:Text = new Text("Press Enter to play",0,0,640,480);
            PlayText.color = 0x006699;
            PlayText.size = 35;
			PlayText.font = "My Font";
            var PlayEntity:Entity = new Entity(0,0,PlayText);
            PlayEntity.x = 380
            PlayEntity.y = 390;
            add(PlayEntity);
			//CREDITS TEXT
			var CreditText:Text = new Text("CREDITS");
            CreditText.color = 0x808080;
            CreditText.size = 30;
            var CreditEntity:Entity = new Entity(0,0,CreditText);
            CreditEntity.x = 835;
            CreditEntity.y = 510;
            add(CreditEntity);
			//HELP TEXT
			var HelpText:Text = new Text("HELP");
            HelpText.color = 0x808080;
            HelpText.size = 30;
            var HelpEntity:Entity = new Entity(0,0,HelpText);
            HelpEntity.x = 860;
            HelpEntity.y = 460;
            add(HelpEntity);
		}
		override public function update():void
		{
			if (Input.pressed(Key.ENTER))
			{
				//lancer le jeux
				trace("PLAY");
			}
			else if(Input.pressed(Key.NUMPAD_ENTER))
			{
				//lancer le jeux
				trace("PLAY");
			}
			if (Input.mousePressed)
			{
				if (mouseX > 905 && mouseX < 935 && mouseY > 510 && mouseY < 540)
				{
					FP.world = new CreditsWorld;
					trace("credits button click");
				}
				else if (mouseX > 905 && mouseX < 935 && mouseY > 460 && mouseY < 490)
				{
					FP.world = new HelpWorld;
					trace("Help button click");
				}
			}
		}
	}
}