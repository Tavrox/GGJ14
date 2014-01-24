package 
{
	import net.flashpunk.*;
	
	/**
	 * ...
	 * @author Zephyr Raine
	 */
	public class Main extends Game 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
	}
	
}