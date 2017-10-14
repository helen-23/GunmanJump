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
	public class InstructionScreen extends SuperSprite 
	{
		//instruction screen class 
		//(rules of game, controls of players)
		private var box:Bitmap;
		private var mainButton:MyButton;
		private var gameButton:MyButton;
		private var multiButton:MyButton;
		
		public function InstructionScreen() 
		{
			//constructs an instruction screen upon instantiation
			super();
			
			//background
			box = new Bitmap(Asset.getImage("instruction"));
			addChild(box);
			box.x = 0; 
			box.y = 0;
			
			//buttons
			mainButton = new MyButton("main", "mainOver");
			addChild(mainButton);
			mainButton.x = 80;
			mainButton.y = 550;
			mainButton.height = 100;
			mainButton.width = 150;
			
			gameButton = new MyButton("settings", "settingsOver");
			addChild(gameButton);
			gameButton.x = 455;
			gameButton.y = 550;
			gameButton.height = 100;
			gameButton.width = 150;
			
			gameButton = new MyButton("play", "playOver");
			addChild(gameButton);
			gameButton.x = 830;
			gameButton.y = 550;
			gameButton.height = 100;
			gameButton.width = 150;
		}
		
	}

}