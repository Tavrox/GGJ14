package entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;

	public class MyEntity extends Entity
	{
		[Embed(source="../../assets/Brain Flower Euro.ttf", embedAsCFF = "false", fontFamily = 'My Font')] private const MY_FONT:Class;
		public function MyEntity()
		{
			Text.font = "My Font";
			graphic = new Text("Press enter to play");
			
		}
	}
}