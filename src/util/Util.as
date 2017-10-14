package util 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Helen
	 */
	public class Util 
	{
		//this class keeps all the global functions useful in any other classes
		
		public static function clamp(num:Number, min:Number, max:Number):Number {
			// snap number num in range min and max
			if (num < min) return min;
			if (num > max) return max;
			return num;
		}
		
		public static function random(min:Number, max:Number):Number {
			//get a random float in range 0 to max
			//if (max <= min) return -1;
			return Math.random() * (max-min) + min;
		}
		
		public static function randomInt(min:int, max:int):int {
			//get a random integer in range min to max
			return Math.floor(Math.random() * max) + min;
		}
		
		public static function removeFromArray(array:Array, item:*):void{
			//remove an item from array
			array.splice(array.indexOf(item), 1);
		}
		
		public static function greatestToLowest(array:Array, array2:Array):void{
			//sort a number array from greatest to lowest and sort another string array accordingly
			//selection sort
			for (var i:int = 0; i < array.length; i++){
				var largestIndex:Number = i;
				for (var j:int = i; j < array.length; j++){
					if (array[j] > array[largestIndex] ) largestIndex = j;
				}
				var temp:Number = array[largestIndex];
				array[largestIndex] = array[i];
				array[i] = temp;
				
				var tempName:String = array2[largestIndex];
				array2[largestIndex] = array2[i];
				array2[i] = tempName;
			}
		}

	}

}