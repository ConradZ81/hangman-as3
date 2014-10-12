/**
 * Created by basti_000 on 12/10/2014.
 */
package de.conradzuse.hangman.controllers {


	import flash.media.SoundChannel;
	import flash.media.SoundTransform;

	public class SoundController {

		private var sfxClickChannel:SoundChannel;
		private var sfxLoseChannel:SoundChannel;
		private var sfxWinChannel:SoundChannel;
		private var sfxTransform:SoundTransform;


		public function playClick():void {
			if (sfxClickChannel != null) {
				sfxClickChannel.stop();
				sfxClickChannel = null;
			}
			if (sfxTransform == null) {
				sfxTransform = new SoundTransform(1, 0);
			}
			sfxClickChannel = EmbeddedSounds.SFX_CLICK.play(0, 0, sfxTransform);
		}

		public function playLose():void {
			if (sfxLoseChannel != null) {
				sfxLoseChannel.stop();
				sfxLoseChannel = null;
			}
			if (sfxLoseChannel == null) {
				sfxTransform = new SoundTransform(1, 0);
			}
			sfxLoseChannel = EmbeddedSounds.SFX_LOSE.play(0, 0, sfxTransform);
		}

		public function playWin():void {
			if (sfxWinChannel != null) {
				sfxWinChannel.stop();
				sfxWinChannel = null;
			}
			if (sfxLoseChannel == null) {
				sfxTransform = new SoundTransform(1, 0);
			}
			sfxWinChannel = EmbeddedSounds.SFX_WIN.play(0, 0, sfxTransform);
		}

	}
}
