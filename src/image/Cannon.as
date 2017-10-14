package image 
{
	import flash.display.Bitmap;
	import flash.utils.Timer;
	import object.SuperSprite;
	import asset.Asset;
	import util.*;
	import flash.events.TimerEvent;
	import screen.GameScreen;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class Cannon extends SuperSprite 
	{
		//cannon image class
		private var cannon:Bitmap;
		private var timer:Timer;
		public var triggered:Boolean;
		
		public function Cannon(posX:Number, posY:Number) 
		{
			//create a cannon at position (posX, posY)
			super();
			
			cannon  = new Bitmap(Asset.getImage("cannon"));
			addChild(cannon);
			cannon.width = GlobalVar.w_cannonwidth;
			cannon.height = GlobalVar.w_cannonheight;
			cannon.x = -GlobalVar.w_cannonwidth/2;
			
			x = posX;
			y = posY;
			
			//triggered every 3 seconds
			timer = new Timer(GlobalVar.w_cannonTimerDelay);
			triggered = false;
			
			timer.addEventListener(TimerEvent.TIMER, timerListener);
			timer.start();
		}
		
		private function timerListener (e:TimerEvent):void{
			triggered = true;
		}
		
		override public function update():void{
			//move cannon down with blocks
			y += GlobalVar.g_blockSpeed;
		}
		
	}

}