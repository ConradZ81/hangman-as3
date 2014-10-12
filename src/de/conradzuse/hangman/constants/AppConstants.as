/**
 * Created by basti_000 on 01/10/2014.
 */
package de.conradzuse.hangman.constants {

	import flash.geom.Point;

	public class AppConstants {

		public static const WIDTH_HEIGHT_RATIO:Number = 1.451612903225806; // ratio of the original background (height / width)

		public static const RENDER_WIDTH:Number = 310;
		public static const RENDER_HEIGHT:Number = 450;

		public static const KEYBOARD_LAYOUT:Array = [
			["q","w","e","r","t","z","u","i","o","p"],
			["a","s","d","f","g","h","j","k","l"],
			["y","x","c","v","b","n","m"]
		];

		public static const KEYBOARD_ROW_OFFSETS:Array = [0, 10, 20];
		public static const KEYBOARD_SCREEN_OFFSET:Point = new Point(5,320);
		public static const STARTSCREEN_SCREEN_OFFSET:Point = new Point(0,80);
		public static const SUBJECTVIEW_SCREEN_OFFSET:Point = new Point(0,80);

		public static const HANG_IMAGES_OFFSETS:Vector.<Point> = new <Point>[
			new Point(50,100),
			new Point(50,130),
			new Point(140,-60),
			new Point(-96,-244),
			new Point(-70,-263),
			new Point(220,-60),
			new Point(210,-60)
		];

		public static const NUM_HANG_IMAGES:int = 7;

		public static const SCAFFOLD_SCREEN_OFFSET:Point = new Point(0,210);

	}
}
