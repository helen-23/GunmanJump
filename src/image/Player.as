package image 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import asset.Asset;
	import flash.events.AVDictionaryDataEvent;
	import flash.net.SharedObject;
	import flash.text.TextField;
	import flash.utils.Dictionary;
	import object.SuperSprite;
	import util.*;
	import screen.*;
	import image.CharacterContainer;
	import image.Weapon;
	import image.Costumes;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class Player extends SuperSprite 
	{
		//class of player
		public static var playerControl:Dictionary;
		
		public var velX:Number;
		public var velY:Number;
		
		public var playerIndex:int;
		
		public var canShoot:Boolean;
		public var isHit:int;
		public var go:Boolean;
		
		private var stickman:CharacterContainer;
		
		private var shotgun:Weapon;
		private var costume:Costumes;
		
		private var upPressed:Boolean;
		private var shootPressed:Boolean;
		private var isFreefall:Boolean;
		
		private var frameCt:int;
		private var resetted:Boolean;
		
		public var lives:int;
		public var score:int;
		public var pname:String;
		
		public function Player(playerIndex:int, playerName:String, costumeIndex:int) 
		{
			super();
			
			//stores all controls of each player
			playerControl = new Dictionary;
			playerControl["up"] = [Key.UP, Key.UP2, Key.UP3];
			playerControl["left"] = [Key.LEFT, Key.LEFT2, Key.LEFT3];
			playerControl["right"] = [Key.RIGHT, Key.RIGHT2, Key.RIGHT3];
			playerControl["shoot"] = [Key.SHOOT, Key.SHOOT2, Key.SHOOT3];
			
			lives = int(GlobalVar.t_lives.text);
			score = 0;
			go = true;
			pname = playerName;
			
			stickman = new CharacterContainer();
			addChild(stickman);
			stickman.width = GlobalVar.p_width
			stickman.height = GlobalVar.p_height;
			this.playerIndex = playerIndex;
			velX = velY = 0;
			upPressed = false;
			shootPressed = false;
			isHit = -1;
			canShoot = true;
			isFreefall = true;
			
			var startingEnd:int = Util.randomInt(1, 2);
			if(startingEnd==1) this.x = Util.random(GlobalVar.g_blockEnd - GlobalVar.g_gapEdge, GlobalVar.g_blockEnd);
			else this.x = Util.random(GlobalVar.g_blockStart, GlobalVar.g_blockStart + GlobalVar.g_gapEdge);
			this.y = GlobalVar.g_screenHeight / 2;
			
			shotgun = new Weapon();
			shotgun.x = stickman.x+15;
			shotgun.y = stickman.y+10;
			addChild(shotgun);
			
			//add costume set to player
			costume = new Costumes();
			addChild(costume);
			if (costumeIndex) costumeIndex--;
			else costumeIndex = 5;
			if(costumeIndex) costume.hats[costumeIndex].visible = true;
			costume.x = stickman.x-5;
			costume.y = stickman.y-stickman.height/2-5;
			costume.scaleX = -0.5;
			costume.scaleY = 0.5;
			
			frameCt = 0;
			resetted = true;
		}
		
		public function reset():void{
			//resets player when dead
			velX = velY = 0;
			upPressed = false;
			shootPressed = false;
			isHit = -1;
			canShoot = true;
			isFreefall = true;
			resetted = true;
			
			var startingEnd:int = Util.randomInt(0, 2);
			if(startingEnd) this.x = Util.random(GlobalVar.g_blockEnd - GlobalVar.g_gapEdge, GlobalVar.g_blockEnd);
			else this.x = Util.random(GlobalVar.g_blockStart, GlobalVar.g_blockStart + GlobalVar.g_gapEdge);
			this.y = GlobalVar.g_screenHeight / 2;
			
			shotgun.x = stickman.x+15;
			shotgun.y = stickman.y + 10;
			
			if (go) lives --;
			
			frameCt = 0;
		}
		
		override public function update():void
		{
			//update image in each frame
			
			//move left or right
			if (Input.isKeyDown[playerControl["left"][playerIndex]]){
				velX -= GlobalVar.p_acceleration;
				if (scaleX > 0) scaleX *= -1;
				stickman.getState(frameCt/GlobalVar.p_runningFrameSpeed+1);
				frameCt+=1;
			}

			if (Input.isKeyDown[playerControl["right"][playerIndex]]){
				velX += GlobalVar.p_acceleration;
				if (scaleX < 0) scaleX *= -1;
				stickman.getState(frameCt/GlobalVar.p_runningFrameSpeed+1);
				frameCt+=1;
			}
			
			//add friction
			velX *= GlobalVar.g_friction;
			
			//jump
			if (!upPressed && Input.isKeyDown[playerControl["up"][playerIndex]] && GameScreen.collisionTest(x, y + GlobalVar.p_height / 2, velY))
			{
				velY = -GlobalVar.p_jumpAcc;
				isFreefall = true;
			}
			
			if (isFreefall) velY += GlobalVar.g_gravity;
			else velY = GlobalVar.g_blockSpeed;
			
			x += velX;
			y += Util.clamp(velY, -y, GlobalVar.g_screenHeight + 1);
			
			//check if standing on block
			if (GameScreen.collisionTest(x, y + GlobalVar.p_height / 2, velY)) 
			{
				if (!resetted){
					isHit = -1;
					resetted = false;
				}
				y = GameScreen.collisionTest(x, y + GlobalVar.p_height / 2, velY);
				isFreefall = false;
			}
				
			else isFreefall = true;
			
			//check if eligible to shoot;
			if (!shootPressed && Input.isKeyDown[playerControl["shoot"][playerIndex]]) 
				canShoot = true;
			else canShoot = false;
			
			//sync upPressed and shootPressed variable
			upPressed = Input.isKeyDown[playerControl["up"][playerIndex]];
			shootPressed = Input.isKeyDown[playerControl["shoot"][playerIndex]];
			
			//update frameCt back to 1 every cycle and define it as frame 2 when player stands
			if (frameCt >= 5 * GlobalVar.p_runningFrameSpeed) frameCt = 0; 
			if (!Input.isKeyDown[playerControl["left"][playerIndex]] && !Input.isKeyDown[playerControl["right"][playerIndex]]) 
			{
				frameCt = 2;
				stickman.getState(frameCt);
			}
			
			if (lives == 1 && go) {
				go = false;
			}
			
			var liveCt:int = 0;
			for (var i:int = 0; i < GameScreen.players.length; i++){
				if (GameScreen.players[i].lives) liveCt++;
			}
			if(GameScreen.players.length ==1 && liveCt < 1) Main.state = "leaderboard";
			else if (GameScreen.players.length > 1 && liveCt ==1) Main.state = "leaderboard";
		}
		
	}

}