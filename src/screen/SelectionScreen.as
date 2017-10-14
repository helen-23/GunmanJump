package screen 
{
	import buttons.MyButton;
	import flash.display.Bitmap;
	import flash.display3D.Context3DTextureFilter;
	import flash.text.*;
	import flash.events.TextEvent;
	import image.Costumes;
	import object.SuperSprite;
	import asset.Asset;
	import util.Input;
	import util.Key;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class SelectionScreen extends SuperSprite 
	{
		//multiplayer input screen class
		
		private var box:Bitmap;
		public static var name1:TextField = new TextField();
		public static var name2:TextField = new TextField();
		public static var name3:TextField = new TextField();
		
		private var enterButton:MyButton;
		private var mainButton:MyButton;
		
		public static var costumeButtons:Array;
		public static var costumes:Array;
		
		public function SelectionScreen() 
		{
			//constructs a new input screen (ful multiplayer mode) when instantiated
			super();
			
			//background
			box = new Bitmap(Asset.getImage("selection"));
			addChild(box);
			box.x = 0;
			box.y = 0;
			
			//input box for a maximum of 3 players
			name1.type = TextFieldType.INPUT;
			name1.background = true;
			name1.x = 100;
			name1.y = 360;
			name1.height = 30;
			name1.width = 150;
			addChild(name1);
			
			name2.type = TextFieldType.INPUT;
			name2.background = true;
			name2.x = 410;
			name2.y = 360;
			name2.height = 30;
			name2.width = 150;
			addChild(name2);
			
			name3.type = TextFieldType.INPUT;
			name3.background = true;
			name3.x = 720;
			name3.y = 360;
			name3.height = 30;
			name3.width = 150;
			addChild(name3);
			
			//input box for number of lives
			GlobalVar.t_lives.type = TextFieldType.INPUT;
			GlobalVar.t_lives.background = true;
			GlobalVar.t_lives.x = 430;
			GlobalVar.t_lives.y = 535;
			GlobalVar.t_lives.height = 30;
			GlobalVar.t_lives.width = 100;
			addChild(GlobalVar.t_lives);
			
			//buttons
			enterButton = new MyButton("enter", "enterOver");
			addChild(enterButton);
			enterButton.x = 770;
			enterButton.y = 550;
			mainButton = new MyButton("main", "mainOver");
			addChild(mainButton);
			mainButton.width = 150;
			mainButton.height = 100;
			mainButton.x = 100;
			mainButton.y = 550;
			
			costumeButtons = [];
			costumes = [];
			costumeButtons.push(null);
			costumes.push(null);
			
			for (var i:int = 1; i <= 3; i++){
				//array of 3 costume buttons for each player
				var cButton:MyButton = new MyButton("costume", "costumeOver");
				addChild(cButton);
				cButton.costumeId = i;
				cButton.x = 305 * i - 160;
				cButton.y = 450;
				cButton.scaleX = 0.8;
				cButton.scaleY = 0.8;
				costumeButtons.push(cButton);
				
				//array of 3 costume sets for each player
				var c:Costumes = new Costumes();
				addChild(c);
				c.x = cButton.x+25;
				c.y = cButton.y - 310;
				c.scaleX = 0.9;
				c.scaleY = 0.9;
				costumes.push(c);
			}
			
		}
		
	}

}