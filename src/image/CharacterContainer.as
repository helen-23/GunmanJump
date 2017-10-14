package image 
{
	import object.SuperSprite;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import asset.Asset;
	import image.Player;
	import image.Block;
	import util.Util;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class CharacterContainer extends SuperSprite 
	{
		//class that makes all images of players (animation)
		public var p_state:int;
		
		private var p_frame1:Bitmap;
		private var p_frame2:Bitmap;
		private var p_frame3:Bitmap;
		private var p_frame4:Bitmap;
		
		public function CharacterContainer() 
		{
			//when instantiated, adds all player states
			super();
			p_state = 2;
			p_frame1 = new Bitmap(Asset.getImage("stickman"));
			addChild(p_frame1);
			
			p_frame2 = new Bitmap(Asset.getImage("stickman2"));
			addChild(p_frame2);
			
			p_frame3 = new Bitmap(Asset.getImage("stickman3"));
			addChild(p_frame3);
			
			p_frame4 = new Bitmap(Asset.getImage("stickman4"));
			addChild(p_frame4);
			
			p_frame1.x = p_frame2.x = p_frame3.x = p_frame4.x = -p_frame1.width / 2;
			p_frame1.y = p_frame2.y = p_frame3.y = p_frame4.y = -p_frame1.height / 2;
			p_frame1.alpha = p_frame2.alpha = p_frame3.alpha = p_frame4.alpha = 0;
			getState(p_state);
		}
		
		public function getState(state:int):void
		{
			//makes the right player mode visible
			p_state = state;
			if (p_state == 1) p_frame1.alpha = 1;
			else if(p_frame1.alpha>0) p_frame1.alpha-=GlobalVar.p_motionBlur;
			if (p_state == 2 || p_state == 6) p_frame2.alpha = 1;
			else if(p_frame2.alpha>0) p_frame2.alpha-=GlobalVar.p_motionBlur;
			if (p_state == 3 || p_state == 5) p_frame3.alpha = 1;
			else if(p_frame3.alpha>0) p_frame3.alpha-=GlobalVar.p_motionBlur;
			if (p_state == 4) p_frame4.alpha = 1;
			else if(p_frame4.alpha>0) p_frame4.alpha-=GlobalVar.p_motionBlur;
		}
	}

}