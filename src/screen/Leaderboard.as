package screen 
{
	import buttons.MyButton;
	import flash.display.Bitmap;
	import flash.display3D.Context3DTextureFilter;
	import flash.text.*;
	import flash.events.TextEvent;
	import flash.net.SharedObject;
	import flash.utils.Dictionary;
	import object.SuperSprite;
	import asset.Asset;
	import util.Input;
	import util.Key;
	import util.Util;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class Leaderboard extends SuperSprite 
	{
		//leaderboard screen class
		private var board:Bitmap;
		private var texts:Array;
		private var playButton:MyButton;
		private var mainButton:MyButton;
		
		//save data on local hardware
		public var ranking:SharedObject = SharedObject.getLocal("gunman_jump_data");
		public var savedData:Object; //equivalent of dictionary
		
		//output
		private var rankingText:TextField = new TextField();
		private var myFormat:TextFormat = new TextFormat();

		
		public function Leaderboard() 
		{
			//constructs a leaderboard screen when instantiated
			super();
			
			//background
			board = new Bitmap(Asset.getImage("leaderboard"));
			addChild(board);
			board.x = 100;
			board.y = 100;
			board.height = 400;
			board.width = 600;			

			savedData = ranking.data.namescore;
			
			//finds player in saved data
			//if found, change best score of theat player accordingly
			//if not found, makes new data foe new player
			for (var i:int = 0; i < GameScreen.players.length; i++){
				if (savedData != null){
					if (savedData.hasOwnProperty(GameScreen.players[i].pname)){
						savedData[GameScreen.players[i].pname] = Math.max(GameScreen.players[i].score, savedData[GameScreen.players[i].pname]);
					}
					else savedData[GameScreen.players[i].pname] = GameScreen.players[i].score;
				}
				else {
					savedData = new Object();
					savedData[GameScreen.players[i].pname] = GameScreen.players[i].score;
				}
			}
			ranking.data.namescore = savedData;
			
			var scores:Array = [];
			var names:Array = [];

			for (var key:String in ranking.data.namescore){
				names.push(key);
				scores.push(ranking.data.namescore[key]);
			}
			
			//sorts the player scores and player names accordingly
			Util.greatestToLowest(scores, names);
			
			//prints the leaderboard data
			myFormat.size = 30;
			rankingText.defaultTextFormat = myFormat;
			rankingText.text = "";
			for (var i:int = 0; i < 6; i++){
				if (names[i] != undefined){
					rankingText.text += ((i + 1) + ":\t" + names[i] +"\t\t\t(Best Score:" + scores[i] + ")\n");
				}
				else rankingText.text += ((i + 1) + "\t--\n");
			}

			addChild(rankingText);
			rankingText.height = 500;
			rankingText.width = 700;
			rankingText.x = 160;
			rankingText.y = 200;
			
			//buttons
			mainButton = new MyButton("main", "mainOver");
			addChild(mainButton);
			mainButton.x = 700;
			mainButton.width = 150;
			
			
			playButton = new MyButton("play", "playOver");
			addChild(playButton);
			playButton.x = 700
			playButton.height = 100;
			playButton.width = 150;
		}
	}

}