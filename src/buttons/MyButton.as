package buttons 
{
	import flash.display.Bitmap;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import object.SuperSprite;
	import asset.Asset;
	import flash.events.*;
	import screen.InputScreen;
	import screen.SelectionScreen;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class MyButton extends SuperSprite 
	{
		//button image class
		private var up:Bitmap; //normal state of button
		private var over:Bitmap; //sate of button when mouse is hovered on top
		
		private var bounce:Number; // speed at which the button floats up and down
		private var myButton:SimpleButton; 
		
		private var pos:Number;
		private var id:String; //type of button
		
		public var costumeCt:int; //keeps track of costume selected
		public var costumeId:int; //set of costumes this button belongs to (only for costume buttons)
		
		public function MyButton(a:String, b:String) 
		{
			super();
			//constructs a button
			//image "a" as its normal mode, image "b" is the mode when mouse is hovered over
			up = new Bitmap(Asset.getImage(a));
			over = new Bitmap(Asset.getImage(b));
			id = a;
			costumeCt = 1;
			
			addChild(up);
			addChild(over);
			
			up.x = over.x = -up.width / 2;
			up.y = over.y = -up.height / 2;
			
			if (id == "play" || id =="enter"){
				height = 130;
				width = 230;
			}
			else{
				height = 100;
				width = 200;
			}

			myButton = new SimpleButton();
			myButton.overState = over;
			myButton.downState = myButton.upState = myButton.hitTestState = up;
			addChild(myButton);
			
			//make button according to its type
			if (id == "play"){
				x = GlobalVar.b_playX;
				y = GlobalVar.b_playY;
				bounce = -0.1;
				pos = GlobalVar.b_playY;
			}
			else if(id == "controls"){
				x = GlobalVar.b_controlsX;
				y = GlobalVar.b_controlsY;
				bounce = -0.2
				pos = GlobalVar.b_controlsY;
			}
			else if(id == "settings"){
				x = GlobalVar.b_settingsX;
				y = GlobalVar.b_settingsY;
				bounce = -0.2
				pos = GlobalVar.b_settingsY;
			}
			else if(id == "enter"){
				x = GlobalVar.b_enterX;
				y = GlobalVar.b_enterY;
				width = 150;
				height = 100;
				bounce = 0;
				pos = GlobalVar.b_enterY;
			}
			
			else if (id == "main"){
				x = 600;
				y = 400;
				bounce = 0;
				pos = GlobalVar.b_enterY;
			}
			
			else if (id == "resume"){
				x = 200;
				y = 400;
				bounce = 0;
				pos = GlobalVar.b_enterY;
			}
			
			else if (id == "costume"){
				x = 200;
				y = 400;
				bounce = 0;
				pos = GlobalVar.b_enterY;
			}
			myButton.addEventListener( MouseEvent.CLICK, onMouseClick);
		}
		
		public function onMouseClick(event:MouseEvent):void{
			
			//when clicked, check whcih button is pressed and react accordingly
			
			if (id == "play"){
				if (Main.prevState == "intro" || Main.prevState == "instruction") Main.state = "input";
				else if (Main.prevState!="play") Main.state = "game";
			}
			else if (id == "enter"){
				if (Main.prevState == "input"){
					Main.names[InputScreen.playerName.text] = SelectionScreen.costumeButtons[0].costumeCt;
					Main.prevGameType = "single player";
				}
				else if (Main.prevState == "multi"){
					if(SelectionScreen.name1.text.length) Main.names[SelectionScreen.name1.text] = SelectionScreen.costumeButtons[1].costumeCt;
					if(SelectionScreen.name2.text.length) Main.names[SelectionScreen.name2.text] = SelectionScreen.costumeButtons[2].costumeCt;
					if(SelectionScreen.name3.text.length) Main.names[SelectionScreen.name3.text] = SelectionScreen.costumeButtons[3].costumeCt;
					Main.prevGameType = "multi player";
				}
				
				Main.state = "game";
			}
			
			else if (id == "main") {
				if (Main.state == "paused") stage.frameRate = 60;
				Main.state = "intro";
			}
			else if (id == "resume"){
				stage.frameRate = 60;
				GlobalVar.gameChannel = GlobalVar.gameMusic.play(0, 999);
				Main.state = "resumed";
			}
			else if (id == "controls"){
				Main.state = "instruction";
			}
			else if (id == "settings"){
				Main.state = "multi";
			}
			
			else if (id == "costume"){
				if (costumeCt == 0){
					SelectionScreen.costumes[costumeId].hats[5].visible = false;
					costumeCt++;
				}
				else{
					if (costumeCt == 1) SelectionScreen.costumes[costumeId].hats[1].visible = true;
					else{
						SelectionScreen.costumes[costumeId].hats[costumeCt - 1].visible = false;
						SelectionScreen.costumes[costumeId].hats[costumeCt].visible = true;
					}
					if (costumeCt + 1 > 5) costumeCt = 0;
					else costumeCt++;
				}
			}
		}
		
		override public function update():void
		{
			//bouncing button motion
			if (y >= pos+12 || y <= pos) bounce *= -1;
			y += bounce;
		}
	}

}