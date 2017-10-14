package screen 
{
	import buttons.*;
	import flash.display.Bitmap;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import object.SuperSprite;
	import backGround.Clouds;
	import asset.Asset;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class IntroScreen extends SuperSprite 
	{
		//main screen class
		private var figureContainer:Sprite;
		private var titleContainer:Sprite;
		
		private var figure:Bitmap;
		private var bkgd:Bitmap;
		private var title:Bitmap;
		
		private var playButton:MyButton;
		private var controlsButton:MyButton;
		private var multiButton:MyButton;
		
		private var fzoom:Number; //speed at which the figure decoration on screen is zooming in and out
		
		public function IntroScreen() 
		{
			//constructs a new "main screen" upon instantiation
			super();
			
			//background, title, and decorations
			bkgd = new Bitmap(Asset.getImage("mBackground"));
			addChild(bkgd);
			bkgd.height = GlobalVar.g_screenHeight;
			bkgd.width = GlobalVar.g_screenWidth;
			
			figureContainer = new Sprite;
			titleContainer = new Sprite;
			
			figure = new Bitmap(Asset.getImage("mFigure"));
			//makes the reference point of figure at center
			figureContainer.addChild(figure);
			figure.y = -figure.height/2;
			figure.x = -figure.width / 2;
			addChild(figureContainer);
			figureContainer.x = 600;
			figureContainer.y = 450;
			figureContainer.height = 4*GlobalVar.p_height;
			figureContainer.width = 8 * GlobalVar.p_width;
			
			title = new Bitmap(Asset.getImage("mTitle"));
			//makes the reference point of title at center
			titleContainer.addChild(title);
			title.y = -title.height/2;
			title.x = -title.width / 2;
			addChild(titleContainer);
			titleContainer.x = 350;
			titleContainer.y = 80;
			titleContainer.height = 150;
			titleContainer.width = 650;
			
			
			//buttons
			playButton = new MyButton("play", "playOver");
			addChild(playButton);
			controlsButton = new MyButton("controls", "controlsOver");
			addChild(controlsButton);
			multiButton = new MyButton("settings", "settingsOver");
			addChild(multiButton);

			fzoom = 1.001;
			
			//add music
			GlobalVar.introChannel = GlobalVar.introMusic.play(0, 999);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
		override public function update():void
		{
			//keeps track of animation for the fugure decoration
			if (figureContainer.height >= 4.5 * GlobalVar.p_height && fzoom==1.001) fzoom = 0.999;
			else if (figureContainer.height <= 4 * GlobalVar.p_height && fzoom==0.999) fzoom =1.001;
			else{
				figureContainer.height *= fzoom;
				figureContainer.width *= fzoom;
			}

		}
		
		private function onRemovedFromStage(event:Event):void{
			//stops music when screen is removd from stage
			GlobalVar.introChannel.stop();
			this.removeEventListener(Event.EXIT_FRAME, onRemovedFromStage);
		}
	}

}