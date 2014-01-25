package 
{
	import net.flashpunk.*;
	import worlds.gameWorld;
	
	/**
	 * ...
	 * @author Zephyr Raine
	 */
	public class Main extends Engine 
	{
		/*
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}*/
		public function Main():void
		{
			super(960, 600, 60, false);
			FP.world = new gameWorld();
			FP.console.debug = true;
			FP.console.enable();
		}
		
		override public function init():void
		{
			super.init();
		
		}
	}
	
	
}