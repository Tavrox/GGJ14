package 
{
	import net.flashpunk.Engine;
	import mx.core.ButtonAsset;
	import net.flashpunk.*;
	
	public class Main extends Engine 
	{
		public function Main()
		{
			super(960, 600, 60, false);
			FP.world = new MyWorld();
		}
	}
}