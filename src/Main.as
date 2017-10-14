package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import screen.*;
	import asset.Asset;
	import flash.net.SharedObject;
	import flash.utils.Dictionary;
	import util.Input;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class Main extends Sprite 
	{
		public var gameScreen:GameScreen;
		public var introScreen:IntroScreen;
		public var inputScreen:InputScreen;
		public var leaderBoard:Leaderboard;
		public var pausedScreen:PausedScreen;
		public var instructionScreen:InstructionScreen;
		public var selectionScreen:SelectionScreen;
		public var input:Input;
		
		public static var updateList:Array;
		
		public static var state:String;
		public static var prevState:String;
		public static var prevGameType:String;
		
		public static var names:Object;
		
		public function Main() 
		{
			input = new Input();
			addChild(input);
			
			//stores event  handlers from all objects instantiated 
			//(all draw function code, runs every frame)
			updateList = [];
			Asset.init();
			state = "intro";
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function onEnterFrame(event:Event):void
		{
			//switch screen according to current state
			
			if (state == "intro" && prevState != "intro"){
				removeChildren();
				updateList = [];
				names = new Object();
				introScreen = new IntroScreen();
				instructionScreen = new InstructionScreen();
				instructionScreen.visible = false;
				addChild(introScreen);
				addChild(instructionScreen);
				prevState = "intro";
			}
			else if (state == "game" && prevState != "game"){
				removeChildren();
				updateList = [];
				gameScreen = new GameScreen(prevGameType);
				pausedScreen = new PausedScreen();
				addChild(gameScreen);
				addChild(pausedScreen);
				pausedScreen.visible = false;
				prevState = "game";
			}
			
			else if (state == "input" && prevState != "input"){
				inputScreen = new InputScreen();
				addChild(inputScreen);
				prevState = "input";
			}
			
			else if (state == "multi" && prevState != "multi"){
				selectionScreen = new SelectionScreen();
				addChild(selectionScreen);
				prevState = "multi";
			}
			
			else if (state == "leaderboard" && prevState!="leaderboard"){
				leaderBoard = new Leaderboard();
				addChild(leaderBoard);
				prevState = "leaderboard";
			}
			else if (state == "paused" && prevState != "paused"){
				stage.frameRate = 0;
				pausedScreen.visible = true;
				prevState = "paused";
			}
			else if (state == "resumed" && prevState != "resumed"){
				pausedScreen.visible=false;
				prevState = "game";
			}
			else if (state == "instruction" && prevState != "instruction"){
				instructionScreen.visible = true;
				prevState = "instruction";
			}

			
			for (var i:int = 0; i < updateList.length; i++)
			{
				//loop through all animations each frame
				updateList[i]();
			}
			
			
		}
		
		
	}
	
}