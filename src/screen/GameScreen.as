
package screen 
{
	import backGround.Clouds;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import asset.Asset;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	import image.Cannon;
	import image.Player;
	import image.Block;
	import image.StatusBar;
	import object.SuperSprite;
	import util.Util;
	import util.Input;
	import image.Bullet;
	import util.*;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class GameScreen extends SuperSprite
	{
		//gamescreen image class
		private var scene:Clouds;
		
		public static var players:Array;
		public static var cannons:Array;
		
		public static var steps:Array;
		public var step:Block;
		public var stepContainer:Sprite;
		
		public var totalRow:int;
		
		public static var bullets:Array;
		public var bulletVel:Number;
		
		public var displayName:Array;
		
		public static var statusBars:Array;
		
		//single player or multiplayer
		public var type:String; 
		
		public function GameScreen(type:String) 
		{
			//creates a game screen when called
			super();
			
			this.type = type;
			
			//add a background
			scene = new Clouds();
			addChild(scene);
			
			//add reminder for how to pause game
			var textReminder:TextField = new TextField();
			
			textReminder.text = "press SPACE to pause";
			addChild(textReminder);
			textReminder.width = 200;
			
			stepContainer = new Sprite();
			addChild(stepContainer);
			
			//stores all steps, players, and bullets on screen
			steps = [];
			players = [];
			bullets = [];
			cannons = [];
			displayName = [];
			statusBars = [];
			
			totalRow = Math.ceil(GlobalVar.g_screenHeight / GlobalVar.g_verticalSpace) + 1;
			
			//create rows of blocks by looping
			for (var i:int = 0; i < totalRow; i++)
			{
				var yPos:Number = GlobalVar.g_verticalSpace * (i - 1);
				steps.push(createRow(GlobalVar.g_blockStart, yPos, []));
			}
			
			if (type == "multi player") multiPlayerModeSetup();
			else singlePlayerModeSetup();
			
			//play music
			GlobalVar.gameChannel = GlobalVar.gameMusic.play(0, 999);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
		private function multiPlayerModeSetup():void{
			//make players for multi player mode, display their names, and name status bars for each player
			var player:Player;
			var p_name:TextField;
			var bar:StatusBar;
			var i:int = 0;
			for (var key:String in Main.names)
			{
				player = new Player(i, key, Main.names[key]);
				addChild(player);
				players.push(player);
				
				p_name = new TextField()
				p_name.text = player.pname;
				addChild(p_name);
				displayName.push(p_name);
				p_name.x = player.x;
				p_name.y = player.y - GlobalVar.p_height / 2 - 20;
				
				bar = new StatusBar(i);
				addChild(bar);
				statusBars.push(bar);
				i++;
			}
		}
		
		private function singlePlayerModeSetup():void{
			//make players, display their names, and name status bars for each player
			for (var key:String in Main.names)
			{
				var player:Player = new Player(0, key, Main.names[key]);
				addChild(player);
				players.push(player);
			}
			
			var p_name:TextField = new TextField()
			p_name.text = player.pname;
			addChild(p_name);
			displayName.push(p_name);
			p_name.x = player.x;
			p_name.y = player.y - GlobalVar.p_height / 2 - 20;
			
			var bar:StatusBar = new StatusBar(0);
			addChild(bar);
			statusBars.push(bar);
			trace("hi");
		}
		
		private function createRow(xPos:Number, yPos:Number, currentRow:Array):Array 
		{
			//randomly generate a row of blocks using recursion
			var blockWidth:Number = Util.random(GlobalVar.g_minblockWidth, GlobalVar.g_maxblockWidth);
			if (xPos + blockWidth + GlobalVar.g_gapWidth + GlobalVar.g_gapEdge >= GlobalVar.g_blockEnd)
			{
				step = new Block(xPos, yPos, GlobalVar.g_blockEnd);
				stepContainer.addChild(step);
				currentRow.push(step);
				
				return currentRow;
			}
			step = new Block(xPos, yPos, xPos + blockWidth);
			stepContainer.addChild(step);
			currentRow.push(step);
			
			//randomely generate cannons on blocks in single player mode
			if (type == "single player"){
				var cannonOrNot:int = Util.randomInt(1, 2);
				if (cannonOrNot == 1){
					var randomX:Number = Util.random(xPos, xPos + blockWidth);
					var cannon:Cannon = new Cannon(randomX, yPos-GlobalVar.w_cannonheight);
					addChild(cannon);
					if(cannon.x > GlobalVar.g_blockEnd-200) cannon.scaleX *=-1;
					else if(cannon.x > GlobalVar.g_blockStart+200){
						var orientation:int = Util.randomInt(1, 2);
						if (orientation == 1) cannon.scaleX *=-1;
					}
					cannons.push(cannon);
				}
			}
			
			return createRow(xPos + blockWidth + GlobalVar.g_gapWidth, yPos, currentRow);
		}
		
		public static function collisionTest(xPos:Number, yPos:Number, status:Number):Number {
			//check if player is falling onto a block or is standing on a block
			//status refers to if player1 is falling back down onto a block
			for (var i:int = 0; i < steps.length; i++) 
			{
				for (var j:int = 0; j < steps[i].length; j++) 
				{
					if (steps[i][j].hitTestPoint(xPos, yPos, true) && yPos<=steps[i][j].y+GlobalVar.g_blockHeight/2 && status >= 0)
					{
						return steps[i][j].y - GlobalVar.p_height / 2 + 3;
					}
				}
			}
			return 0;
		}
		
		override public function update():void
		{			
			//check if game paused
			if (Input.isKeyDown[Key.SPACE]){
				GlobalVar.gameChannel.stop();
				Main.state = "paused";
			}
			
			//destroy blocks out of screen and make new ones on top
			if (steps[steps.length - 1][0].y > GlobalVar.g_screenHeight)
			{
				for (var j:int = 0; j < steps[steps.length - 1].length; j++)
				{
					steps[steps.length - 1][j].remove();
				}
				steps.splice(steps.length - 1, 1);

				steps.unshift(createRow(GlobalVar.g_blockStart, -GlobalVar.g_verticalSpace, []));
			}
			
			//Checks to see if each player shoots and makes a bullet for player
			
			for (var i:int = 0; i < players.length; i++)
			{				
				if (Input.isKeyDown[Player.playerControl["shoot"][i]] && players[i].canShoot)
				{
					var bullet:Bullet;
					if (players[i].scaleX > 0)
					{
						bullet = new Bullet(i, GlobalVar.w_bulletSpeed);
						bullet.x = players[i].x + GlobalVar.w_gunwidth / 2;
						players[i].velX -= GlobalVar.w_bulletSpeed * GlobalVar.w_bulletRecoilMul;
					}
					else
					{
						bullet = new Bullet(i, -GlobalVar.w_bulletSpeed);
						bullet.x = players[i].x - GlobalVar.w_gunwidth / 2;
						players[i].velX += GlobalVar.w_bulletSpeed * GlobalVar.w_bulletRecoilMul;
					}
					addChild(bullet);
					bullets.push(bullet);
					bullet.y = players[i].y + 2;
				}
				
				//destroy players out of screen and create a new one
				if (players[i].y > GlobalVar.g_screenHeight)
				{
					if (players[i].isHit !=-1 && type=="multi player") players[players[i].isHit].score+= GlobalVar.p_scorePerHit;
					if (players[i].go) players[i].reset();
					else if (players[i].lives == 1) players[i].lives--;
				}
				
				displayName[i].x = players[i].x;
				displayName[i].y = players[i].y - GlobalVar.p_height / 2 - 20;
			}
			
			//in single player mode, create bullets for each cannon
			if (type == "single player"){
				for (var i:int = 0; i < cannons.length; i++){
					if (cannons[i].triggered){
						cannons[i].triggered = false;
						var bullet:Bullet;
						if (cannons[i].scaleX > 0){
							bullet = new Bullet(-1, GlobalVar.w_bulletSpeed);
							bullet.x = cannons[i].x + GlobalVar.w_cannonwidth / 2;
						}
						else{
							bullet = new Bullet(-1, -GlobalVar.w_bulletSpeed);
							bullet.x = cannons[i].x - GlobalVar.w_cannonwidth / 2;
						}
						addChild(bullet);
						bullets.push(bullet);
						bullet.y = cannons[i].y + GlobalVar.w_cannonheight/2;
					}
				}
			}
			
		}
		
		private function onRemovedFromStage(event:Event):void{
			//stops music when game screen is removed from screen
			GlobalVar.gameChannel.stop();
			this.removeEventListener(Event.EXIT_FRAME, onRemovedFromStage);
		}
		
	}

}