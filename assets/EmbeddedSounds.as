package {

	import flash.media.Sound;

	public class EmbeddedSounds {

		[Embed(source = "sounds/click.mp3")]
		private static var SFX_CLICK_CLASS:Class;
		public static var SFX_CLICK:Sound = new SFX_CLICK_CLASS() as Sound;

		[Embed(source = "sounds/win.mp3")]
		private static var SFX_WIN_CLASS:Class;
		public static var SFX_WIN:Sound = new SFX_WIN_CLASS() as Sound;

		[Embed(source = "sounds/lose.mp3")]
		private static var SFX_LOSE_CLASS:Class;
		public static var SFX_LOSE:Sound = new SFX_LOSE_CLASS() as Sound;


	}
}
