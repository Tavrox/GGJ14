package worlds
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Stamp;
	import entities.*;
	
	public class menuWorld extends World
	{
		[Embed(source = "../../assets/sfx/music.mp3")] private const MUSIC:Class;
		[Embed(source="../../assets/switch.png")] private const GRAPHIC1:Class;
		[Embed(source = "../../assets/MainMenu.png")] private const GRAPHIC2:Class;
		
		public var sf:Sfx;
		public function menuWorld()
		{
			add(new MyEntity());
			add(new Entity(0, 0, new Image(GRAPHIC2)));
			add(new Entity(890, 510, new Image(GRAPHIC1)));
			add(new Entity(890, 460, new Image(GRAPHIC1)));
			//PRESS ENTER 
			sf = new Sfx(MUSIC);
			sf.loop();
			var PlayText:Text = new Text("Click to turn on the light",0,0,640,480);
            PlayText.color = 0x006699;
            PlayText.size = 35;
			PlayText.font = "My Font";
            var PlayEntity:Entity = new Entity(0,0,PlayText);
            PlayEntity.x = 360;
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
		
		override public function end():void 
		{
			sf.stop();
			super.end();
		}
		
		override public function update():void
		{
			if (Input.mousePressed)
			{
				if (mouseX > 905 && mouseX < 935 && mouseY > 510 && mouseY < 540)
				{
					FP.world = new creditsWorld();
					trace("credits button click");
				}
				else if (mouseX > 905 && mouseX < 935 && mouseY > 460 && mouseY < 490)
				{
					FP.world = new helpWorld();
					trace("Help button click");
				}
				else 
				{
					
				FP.world = new gameWorld();
				}
			}
		}
	}
}