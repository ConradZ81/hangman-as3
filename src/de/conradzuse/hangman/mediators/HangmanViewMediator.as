/**
 * Created by basti_000 on 11/10/2014.
 */
package de.conradzuse.hangman.mediators {

	import de.conradzuse.hangman.views.HangmanView;

	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	import robotlegs.bender.framework.api.ILogger;

	public class HangmanViewMediator implements IMediator {

		[Inject]
		public var view:HangmanView;

		[Inject]
		public var log:ILogger;

		public function HangmanViewMediator() {
		}

		public function initialize():void {
			log.info("Preparing textures");
			EmbeddedTextures.initTextures();

			log.info("Initializing Hangman View");
			view.init();
		}

		public function destroy():void {
		}
	}
}
