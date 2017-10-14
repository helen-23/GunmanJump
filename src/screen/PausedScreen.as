package screen 
{
	import buttons.MyButton;
	import flash.display.Bitmap;
	import flash.display3D.Context3DTextureFilter;
	import flash.text.*;
	import flash.events.TextEvent;
	import object.SuperSprite;
	import asset.Asset;
	import util.Input;
	import util.Key;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class PausedScreen extends SuperSprite 
	{
		//paused screen class
		private var box:Bitmap;
		private var mainButton:MyButton;
		private var resumeButton:MyButton;
		
		public function PausedScreen() 
		{
			//constructs a paused screen when instantiated
			super();
			
			//background
			box = new Bitmap(Asset.getImage("paused"));
			addChild(box);
			box.x = 0; 
			box.y = 0;
			
			//buttons
			mainButton = new MyButton("main", "mainOver");
			addChild(mainButton);
			mainButton.x = 350;
			mainButton.y = 480;
			
			resumeButton = new MyButton("resume", "resumeOver");
			addChild(resumeButton);
			resumeButton.x = 280;
			resumeButton.y = 350;
		}
	}

}