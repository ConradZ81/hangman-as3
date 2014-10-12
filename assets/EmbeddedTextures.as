package {

	import flash.display.Bitmap;

	import starling.textures.Texture;

	public class EmbeddedTextures {


		[Embed(source = "images/bg.jpg")]
		private static var BACKGROUND:Class;
		public static var BACKGROUND_TEXTURE:Texture;

		[Embed(source = "images/V1.png")]
		private static var V1:Class;

		[Embed(source = "images/V2.png")]
		private static var V2:Class;

		[Embed(source = "images/V3.png")]
		private static var V3:Class;

		[Embed(source = "images/V4.png")]
		private static var V4:Class;

		[Embed(source = "images/V5.png")]
		private static var V5:Class;

		[Embed(source = "images/V6.png")]
		private static var V6:Class;

		[Embed(source = "images/man.png")]
		private static var MAN:Class;

		public static var HANG_IMAGES:Vector.<Texture>;

		[Embed(source = "images/hangman.png")]
		private static var HANGMAN:Class;
		public static var HANGMAN_TEXTURE:Texture;


		/**
		 * prepare textures just once
		 */
		public static function initTextures():void {
			BACKGROUND_TEXTURE = Texture.fromBitmap((new BACKGROUND() as Bitmap));
			HANGMAN_TEXTURE = Texture.fromBitmap((new HANGMAN() as Bitmap));

			HANG_IMAGES = new <Texture>[
				Texture.fromBitmap((new V1() as Bitmap)),
				Texture.fromBitmap((new V2() as Bitmap)),
				Texture.fromBitmap((new V3() as Bitmap)),
				Texture.fromBitmap((new V4() as Bitmap)),
				Texture.fromBitmap((new V5() as Bitmap)),
				Texture.fromBitmap((new V6() as Bitmap)),
				Texture.fromBitmap((new MAN() as Bitmap))
			];
		}

	}

}