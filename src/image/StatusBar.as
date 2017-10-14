package image 
{
	import flash.display.Bitmap;
	import flash.text.TextField;
	import object.SuperSprite;
	import asset.Asset;
	import screen.GameScreen;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class StatusBar extends SuperSprite 
	{
		//status bar image class
		public var statusBar:Bitmap;
		
		private var displayName:TextField = new TextField();
		private var displayLives:TextField = new TextField();
		private var displayScore:TextField = new TextField();
		
		private var id:int;
		
		public function StatusBar(player:int) 
		{
			//creates a status bar for player (player)
			super();
			
			id = player;
			
			statusBar = new Bitmap(Asset.getImage("bar"));
			addChild(statusBar);
			statusBar.height = GlobalVar.s_height;
			statusBar.width = GlobalVar.s_width;
			statusBar.alpha = GlobalVar.s_alpha;
			
			this.x = 10 + (id) * (GlobalVar.s_width + 10);
			this.y = GlobalVar.g_screenHeight - GlobalVar.s_height - 10;
			
			displayName.text = GameScreen.players[id].pname;
			addChild(displayName);
			displayName.x = 20;
			displayName.y = 5;
			displayName.scaleX = 2;
			displayName.scaleY = 2;
			
			displayLives.text = "Lives Left: 10";
			addChild(displayLives);
			displayLives.x = GlobalVar.s_width/2+10;
			displayLives.y = 15;
			
			displayScore.text = "Score: 0";
			addChild(displayScore);
			displayScore.x = 30;
			displayScore.y = 50;
		}
		
		override public function update():void
		{
			//updates score on status bar
			displayLives.text = "Lives Left: " + GameScreen.players[id].lives;
			displayScore.text = "Score:" + GameScreen.players[id].score;
		}
		
	}

}