package image 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import asset.Asset;
	import object.SuperSprite;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class Block extends SuperSprite 
	{
		//class of block
		public var block:Bitmap;
		
		public function Block(xPosStart:Number, yPos:Number, xPosEnd:Number) 
		{
			//makes a block starting at xPosStart and end at xPosEnd
			super();
			
			block = new Bitmap(Asset.getImage("block"));
			addChild(block);
			block.width = xPosEnd - xPosStart;
			block.height = GlobalVar.g_blockHeight;
			this.x = xPosStart;
			this.y = yPos;
		}
		
		override public function update():void
		{
			//moves block down the screen each frame
			this.y += GlobalVar.g_blockSpeed;
		}
		
	}

}