package image 
{
	import flash.display.Bitmap;
	import object.SuperSprite;
	import asset.Asset;
	import util.Input;
	import screen.GameScreen;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class Bullet extends SuperSprite 
	{
		//bullet image class
		public var bitmap_bullet:Bitmap;
		public var bullet_of:int; //the player this bullet belongs to
		public var bulletVel:Number; //velocity
		
		private var destroy:Boolean;
		public function Bullet(p:int, v:Number) 
		{
			//creates a bullet belonging to player with direction v (+/-)
			super();
			bitmap_bullet  = new Bitmap(Asset.getImage("bullet"));
			addChild(bitmap_bullet);
			bitmap_bullet.width = GlobalVar.w_bulletWidth;
			bitmap_bullet.height = GlobalVar.w_bulletHeight;
			bitmap_bullet.x = -GlobalVar.w_bulletWidth/2;
			bitmap_bullet.y = -GlobalVar.w_bulletHeight / 2;
			
			bullet_of = p;
			bulletVel = v;
			
			destroy = false;
		}
		
		override public function update():void
		{
			//keep track of the bullet accross the screen, if player is hit, player backs up, destroy bullet
			//destroy off-screen bullet
			x += bulletVel;
			y += GlobalVar.g_blockSpeed;
			
			for (var i:int = 0; i < GameScreen.players.length; i++){
				if (bullet_of!=i && GameScreen.players[i].hitTestPoint(x, y, false))
				{
					GameScreen.players[i].velX += GlobalVar.w_bulletForceMul * bulletVel;
					destroy = true;
					GameScreen.players[i].isHit = bullet_of;
				}
			}
			
			//if cannon is hit in single player mode, if cannon is hit, destroy bullet
			//destroy off-screen cannon
			if (GameScreen.cannons.length){
				for (var i:int = 0; i < GameScreen.cannons.length; i++){
					if (bullet_of!=-1 && GameScreen.cannons[i].hitTestPoint(x, y, false))
					{
						GameScreen.cannons[i].remove();
						GameScreen.cannons.splice(i, 1);
						destroy = true;
						GameScreen.players[0].score += GlobalVar.p_scorePerHit;
					}
					else if (GameScreen.cannons[i].y > GlobalVar.g_screenHeight)
					{
						GameScreen.cannons[i].remove();
						GameScreen.cannons.splice(i, 1);
					}
				}
			}
			
			if (x < 0 || x>GlobalVar.g_screenWidth || y < 0 || y > GlobalVar.g_screenHeight)
			{
				destroy = true;
			}
			
			if (destroy)
			{
				this.remove();
				GameScreen.bullets.splice(GameScreen.bullets.indexOf(this, 0), 1);
			}
		}
	}

}