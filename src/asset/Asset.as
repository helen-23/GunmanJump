package asset 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Helen
	 */
	public class Asset 
	{
		//this class embed all images and soundfiles relating to the game and make the images as class
		
		//block
		[Embed(source="/../asset/block.png")]
		public static const Image_block:Class;
		
		//stickman
		[Embed(source = "/../asset/stickman_right.png")]
		public static const Image_stickman_right:Class;
		[Embed(source="/../asset/stickman2.png")]
		public static const Image_stickman2:Class;
		[Embed(source="/../asset/stickman3.png")]
		public static const Image_stickman3:Class;
		[Embed(source="/../asset/stickman4.png")]
		public static const Image_stickman4:Class;
		
		//weapons
		[Embed(source = "/../asset/shotgun.png")]
		public static const Image_shotgun:Class;
		[Embed(source = "/../asset/cannon.png")]
		public static const Image_cannon:Class;
		[Embed(source="/../asset/bullet.png")]
		public static const Image_bullet:Class;
		
		//background
		[Embed(source="/../asset/clouds.png")]
		public static const Image_clouds:Class;
		
		//status bar
		[Embed(source="/../asset/bar.png")]
		public static const Image_bar:Class
		
		//costumes
		[Embed(source="/../asset/hat1.png")]
		public static const Image_hat1:Class;
		[Embed(source="/../asset/hat2.png")]
		public static const Image_hat2:Class;
		[Embed(source="/../asset/hat3.png")]
		public static const Image_hat3:Class;
		[Embed(source="/../asset/hat4.png")]
		public static const Image_hat4:Class;
		[Embed(source="/../asset/hat5.png")]
		public static const Image_hat5:Class;
		
		//buttons (up)
		[Embed(source = "/../asset/playButton.png")]
		public static const Button_play:Class;
		[Embed(source="/../asset/controlsButton.png")]
		public static const Button_controls:Class;
		[Embed(source="/../asset/settingsButton.png")]
		public static const Button_settings:Class;
		[Embed(source="/../asset/enterButton.png")]
		public static const Button_enter:Class;
		[Embed(source="/../asset/mainButton.png")]
		public static const Button_main:Class;
		[Embed(source="/../asset/resumeButton.png")]
		public static const Button_resume:Class;
		[Embed(source="/../asset/costumeButton.png")]
		public static const Button_costume:Class;
		
		
		//buttons (when mouse hovers over button)
		[Embed(source = "/../asset/playButtonOver.png")]
		public static const Button_play_over:Class;
		[Embed(source="/../asset/controlsButtonOver.png")]
		public static const Button_controls_over:Class;
		[Embed(source="/../asset/settingsButtonOver.png")]
		public static const Button_settings_over:Class;
		[Embed(source="/../asset/enterButtonOver.png")]
		public static const Button_enter_over:Class;
		[Embed(source="/../asset/mainButtonOver.png")]
		public static const Button_main_over:Class;
		[Embed(source="/../asset/resumeButtonOver.png")]
		public static const Button_resume_over:Class;
		[Embed(source="/../asset/costumeButtonOver.png")]
		public static const Button_costume_over:Class;

		//relating to screens
		[Embed(source="/../asset/main_background.png")]
		public static const Main_background:Class;
		[Embed(source="/../asset/main_figure.png")]
		public static const Main_figure:Class;
		[Embed(source="/../asset/title.png")]
		public static const Main_title:Class;
		
		[Embed(source="/../asset/inputbox.png")]
		public static const Input_name:Class;
		[Embed(source="/../asset/leaderboard.png")]
		public static const Screen_leaderboard:Class;
		[Embed(source="/../asset/pausedScreen.png")]
		public static const Screen_paused:Class;
		[Embed(source="/../asset/instructionScreen.png")]
		public static const Screen_instruction:Class;
		[Embed(source="/../asset/selectionScreen.png")]
		public static const Screen_selection:Class;
		
		//music
		[Embed(source="/../asset/gameMusic.mp3")]
		public static const GameMusic:Class;
		[Embed(source="/../asset/introMusic.mp3")]
		public static const IntroMusic:Class;
		
		private static var dict:Dictionary;
		
		public static function init():void
		{
			//this can be called from Main class without an Asset object being instantiated
			dict = new Dictionary();
			
			//associate images with string typed names
			dict["stickman"] = (new Image_stickman_right() as Bitmap).bitmapData;
			dict["stickman2"] = (new Image_stickman2() as Bitmap).bitmapData;
			dict["stickman3"] = (new Image_stickman3() as Bitmap).bitmapData;
			dict["stickman4"] = (new Image_stickman4() as Bitmap).bitmapData;
			dict["block"] = (new Image_block() as Bitmap).bitmapData;
			dict["shotgun"] = (new Image_shotgun() as Bitmap).bitmapData;
			dict["cannon"] = (new Image_cannon() as Bitmap).bitmapData;
			dict["bullet"] = (new Image_bullet() as Bitmap).bitmapData;
			dict["clouds"] = (new Image_clouds() as Bitmap).bitmapData;
			dict["bar"] = (new Image_bar() as Bitmap).bitmapData;
			dict["hat1"] = (new Image_hat1() as Bitmap).bitmapData;
			dict["hat2"] = (new Image_hat2() as Bitmap).bitmapData;
			dict["hat3"] = (new Image_hat3() as Bitmap).bitmapData;
			dict["hat4"] = (new Image_hat4() as Bitmap).bitmapData;
			dict["hat5"] = (new Image_hat5() as Bitmap).bitmapData;
			
			dict["mBackground"] = (new Main_background() as Bitmap).bitmapData;
			dict["mFigure"] = (new Main_figure() as Bitmap).bitmapData;
			dict["mTitle"] = (new Main_title() as Bitmap).bitmapData;
			dict["play"] = (new Button_play() as Bitmap).bitmapData;
			dict["controls"] = (new Button_controls() as Bitmap).bitmapData;
			dict["settings"] = (new Button_settings() as Bitmap).bitmapData;
			dict["enter"] = (new Button_enter() as Bitmap).bitmapData;
			dict["main"] = (new Button_main() as Bitmap).bitmapData;
			dict["resume"] = (new Button_resume() as Bitmap).bitmapData;
			dict["costume"] = (new Button_costume() as Bitmap).bitmapData;
			dict["playOver"] = (new Button_play_over() as Bitmap).bitmapData;
			dict["controlsOver"] = (new Button_controls_over() as Bitmap).bitmapData;
			dict["settingsOver"] = (new Button_settings_over() as Bitmap).bitmapData;
			dict["enterOver"] = (new Button_enter_over() as Bitmap).bitmapData;
			dict["mainOver"] = (new Button_main_over() as Bitmap).bitmapData;
			dict["resumeOver"] = (new Button_resume_over() as Bitmap).bitmapData;
			dict["costumeOver"] = (new Button_costume_over() as Bitmap).bitmapData;
			
			dict["input_name"] = (new Input_name() as Bitmap).bitmapData;
			dict["leaderboard"] = (new Screen_leaderboard() as Bitmap).bitmapData;
			dict["paused"] = (new Screen_paused() as Bitmap).bitmapData;
			dict["instruction"] = (new Screen_instruction() as Bitmap).bitmapData;
			dict["selection"] = (new Screen_selection() as Bitmap).bitmapData;
		}
		
		public static function getImage(name:String):BitmapData
		{
			//get image by passing in name of image as a string
			return dict[name];
		}
	}

}