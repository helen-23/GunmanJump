package object 
{
	import flash.display.Sprite;
	import util.Util;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class SuperSprite extends Sprite 
	{
		//extends features of the sprite class according to my game
		public function SuperSprite() 
		{
			super();
			
			//add animation into the list of commands "onEnterFrame"
			Main.updateList.push(update);
		}
		
		public function update(): void
		{
			//will be override by subclass
		}
		
		public function remove():void
		{
			parent.removeChild(this);
			//remove from update list
			Util.removeFromArray(Main.updateList, update);
		}
	}

}