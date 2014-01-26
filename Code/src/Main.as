package 
{
	import net.flashpunk.*;
	import worlds.*;
	
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
			FP.world = new menuWorld();
			FP.console.enable();
			FP.console.debug = true;
		}
		
		override public function init():void
		{
			super.init();
		
		}
	}
	
	
}