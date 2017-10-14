package 
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import asset.Asset;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Helen
	 */
	public class GlobalVar 
	{
		//this class stores all global variables relating to image position and size
		
		//g: game
		//screen
		public static const g_screenHeight:Number = 600;
		public static const g_screenWidth:Number = 900;
		//blocks
		public static const g_blockStart:Number = 80;
		public static const g_blockEnd:Number = g_screenWidth - g_blockStart;
		public static const g_gapEdge:Number = 40;
		public static const g_verticalSpace:Number = 150;
		public static const g_blockHeight:Number = 30;
		public static const g_minblockWidth:Number = 50;
		public static const g_maxblockWidth:Number = 450;
		public static const g_gapWidth:Number = 150;
		public static const g_blockSpeed:Number = 1;
		//environment
		public static const g_gravity:Number = 1;
		public static const g_friction:Number = 0.9;
		
		//p: player
		public static const ai_Num:int = 3;
		
		public static const p_height:Number = 105;
		public static const p_width:Number = 60;
		public static const p_acceleration:Number = 0.5;
		public static const p_jumpAcc:Number = 20;
		public static const p_scorePerHit:Number = 100;
		public static const p_runningFrameSpeed:Number = 4;
		
		public static const p_motionBlur:Number = 0.3;
		
		//w: weapon
		//gun and cannon
		public static const w_gunheight:Number = 30;
		public static const w_gunwidth:Number = 80;
		public static const w_cannonheight:Number = 75;
		public static const w_cannonwidth:Number = 80;
		public static const w_cannonTimerDelay:Number = 2000;
		//bullets
		public static const w_bulletHeight:Number = 7;
		public static const w_bulletWidth:Number = 7;
		public static const w_bulletSpeed:Number = 40;
		public static const w_bulletRate:Number = 10;
		public static const w_bulletForceMul:Number = 0.7;
		public static const w_bulletRecoilMul:Number = 0.15;
		
		//s: status bar
		public static const s_height:Number = 70;
		public static const s_width:Number = 225;
		public static const s_alpha:Number = 0.4;
		
		//b:buttons
		public static const b_playY:Number = 250;
		public static const b_playX:Number = 150;
		public static const b_controlsY:Number = 390;
		public static const b_controlsX:Number = 280;
		public static const b_settingsY:Number = 480;
		public static const b_settingsX:Number = 180;
		public static const b_enterY:Number = 450;
		public static const b_enterX:Number = 500;
		
		//i:input
		public static const i_space:Number = 30;
		
		//m:music
		public static var introMusic:Sound = (new Asset.IntroMusic) as Sound;
		public static var introChannel:SoundChannel;
		public static var gameMusic:Sound = (new Asset.GameMusic) as Sound;
		public static var gameChannel:SoundChannel;
		
		//t:text
		public static var t_lives:TextField = new TextField();
	}

}