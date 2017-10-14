package backGround 
{
	import flash.display.Bitmap;
	import object.SuperSprite;
	import asset.Asset;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class Clouds extends SuperSprite 
	{
		//cloud image class
		public var clouds:Array;
		
		public function Clouds() 
		{
			//makes an array of clouds on screen (3 rows)
			super();
			
			clouds = [];
			for (var i:int = 0; i < 3; i++)
			{
				var cloud:Bitmap = new Bitmap(Asset.getImage("clouds"));
				addChild(cloud);
				clouds.push(cloud);
				cloud.width = GlobalVar.g_screenWidth;
				cloud.height = 300;
				cloud.y = i*300-300;
			}
		}
		
		override public function update():void
		{
			//check if cloud is still on screen each frame
			//if not, remove the cloud and make a new one on top
			for (var i:int = 0; i < clouds.length; i++)
			{
				clouds[i].y += 0.7*GlobalVar.g_blockSpeed;
				if (clouds[i].y >= GlobalVar.g_screenHeight)
				{
					this.removeChild(clouds[i]);
					clouds.splice(i, 1);
					var cloud:Bitmap = new Bitmap(Asset.getImage("clouds"));
					addChild(cloud);
					clouds.push(cloud);
					cloud.width = GlobalVar.g_screenWidth;
					cloud.height = 300;
					cloud.y = -300;
				}
			}
		}
		
	}

}