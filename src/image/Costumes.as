package image 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import asset.Asset;
	
	/**
	 * ...
	 * @author Helen
	 */
	public class Costumes extends Sprite 
	{
		//this class is in charge of all costume images
		public var hats:Array;
		
		public function Costumes() 
		{
			//generates all the hats and make them invisible
			
			super();
			
			hats = [];
			hats.push(null);
			
			var hat:Bitmap = new Bitmap(Asset.getImage("hat1"));
			addChild(hat);
			hat.visible = false;
			hats.push(hat);
			hat = new Bitmap(Asset.getImage("hat2"));
			addChild(hat);
			hat.visible = false;
			hats.push(hat);
			hat = new Bitmap(Asset.getImage("hat3"));
			addChild(hat);
			hat.visible = false;
			hats.push(hat);
			hat = new Bitmap(Asset.getImage("hat4"));
			addChild(hat);
			hat.visible = false;
			hats.push(hat);
			hat = new Bitmap(Asset.getImage("hat5"));
			addChild(hat);
			hat.visible = false;
			hats.push(hat);
			
			for (var i:int = 1; i <= 5; i++ ){
				hats[i].x = -hats[i].width / 2;
				hats[i].y = -hats[i].height / 2;
			}
			hats[5].y += 15;
		}
		
	}

}