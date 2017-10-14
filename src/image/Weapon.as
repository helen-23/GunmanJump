package image 
{
	import flash.display.Bitmap;
	import object.SuperSprite;
	import asset.Asset;
	import util.Input;
	import image.Bullet;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class Weapon extends SuperSprite 
	{
		//gun image class
		public var gun:Bitmap;
		
		public function Weapon() 
		{
			//creates a new gun
			super();
			
			gun  = new Bitmap(Asset.getImage("shotgun"));
			addChild(gun);
			gun.width = GlobalVar.w_gunwidth;
			gun.height = GlobalVar.w_gunheight;
			gun.x = -GlobalVar.w_gunwidth/2;
			gun.y = -GlobalVar.w_gunheight/2;
		}

		
	}

}