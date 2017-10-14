package util 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class Input extends Sprite 
	{
		//a class in charge of everything that involves user keyboard input
		public static var isKeyDown:Array;
		
		
		public function Input() 
		{
			super();
			
			//an array of all possible key codes
			isKeyDown = [];
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function onAddedToStage(event:Event):void
		{
			//when this is added to stage, listen to keyboard events
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		public function onKeyDown(event:KeyboardEvent):void
		{
			//when key is down, record down the key code as true
			isKeyDown[event.keyCode] = true;
		}
		
		public function onKeyUp(event:KeyboardEvent):void
		{
			//when key is down, record down the key code as false
			isKeyDown[event.keyCode] = false;
		}
		
	}

}