/**
 * Created by basti_000 on 12/10/2014.
 */
package de.conradzuse.hangman.mediators {

	import de.conradzuse.hangman.models.HangmanModel;
	import de.conradzuse.hangman.signals.ModelUpdateSignal;
	import de.conradzuse.hangman.views.components.HeaderView;

	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	import robotlegs.bender.framework.api.ILogger;

	public class HeaderViewMediator implements IMediator{


		[Inject]
		public var log:ILogger;

		[Inject]
		public var view:HeaderView;

		[Inject]
		public var modelUpdateSignal:ModelUpdateSignal;

		[Inject]
		public var model:HangmanModel;

		public function initialize():void {

			log.info("Setting up headline");
			view.init();
			modelUpdateSignal.add(onModelUpdate)
		}

		private function onModelUpdate():void {
			view.setHeadline(model.winCount, model.lossCount);
		}

		public function destroy():void {
		}
	}
}
