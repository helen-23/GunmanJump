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
	import image.Costumes;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class InputScreen extends SuperSprite 
	{
		//single player input screen class
		private var box:Bitmap;
		public static var playerName:TextField = new TextField();
		private var enterButton:MyButton;
		private var mainButton:MyButton;
		
		public function InputScreen() 
		{
			//constructs a new input screen (for single players) when instantiated
			super();
			
			//background
			box = new Bitmap(Asset.getImage("input_name"));
			addChild(box);
			box.x = 0;
			box.y = 0;
			
			//name input box
			playerName.type = TextFieldType.INPUT;
			playerName.background = true;
			playerName.x = 520;
			playerName.y = 160;
			playerName.height = 30;
			playerName.width = 140;
			addChild(playerName);
			
			//lives input box
			GlobalVar.t_lives.type = TextFieldType.INPUT;
			GlobalVar.t_lives.background = true;
			GlobalVar.t_lives.x = 520;
			GlobalVar.t_lives.y = 240;
			GlobalVar.t_lives.height = 30;
			GlobalVar.t_lives.width = 140;
			addChild(GlobalVar.t_lives);
			
			//buttons
			enterButton = new MyButton("enter", "enterOver");
			addChild(enterButton);
			enterButton.x = 630;
			enterButton.y = 500;
			mainButton = new MyButton("main", "mainOver");
			addChild(mainButton);
			mainButton.width = 150;
			mainButton.height = 100;
			mainButton.x = 260;
			mainButton.y = 500;
			
			//push the button into the selection screen
			SelectionScreen.costumeButtons = [];
			SelectionScreen.costumes = [];
			
			var cButton:MyButton = new MyButton("costume", "costumeOver");
			addChild(cButton);
			cButton.costumeId = 0;
			cButton.x = 450;
			cButton.y = 380;
			SelectionScreen.costumeButtons.push(cButton);
			
			var c:Costumes = new Costumes();
			addChild(c);
			c.x = cButton.x - 155;
			c.y = cButton.y - 230;
			c.scaleX = 0.75;
			c.scaleY = 0.75;
			SelectionScreen.costumes.push(c);
		}
	}

}