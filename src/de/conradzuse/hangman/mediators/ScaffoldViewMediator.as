/**
 * Created by basti_000 on 12/10/2014.
 */
package de.conradzuse.hangman.mediators {

	import de.conradzuse.hangman.models.HangmanModel;
	import de.conradzuse.hangman.models.ScaffoldModel;
	import de.conradzuse.hangman.signals.EvaluateKeySignal;
	import de.conradzuse.hangman.signals.ModelUpdateSignal;
	import de.conradzuse.hangman.views.components.ScaffoldView;

	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	import robotlegs.bender.framework.api.ILogger;

	public class ScaffoldViewMediator implements IMediator{

		[Inject]
		public var log:ILogger;

		[Inject]
		public var view:ScaffoldView;

		[Inject]
		public var modelUpdateSignal:ModelUpdateSignal;

		[Inject]
		public var model:ScaffoldModel;


		public function initialize():void {
			log.info("Preparing scaffolding... ");
			view.init();
			modelUpdateSignal.add(onModelUpdate);
		}

		private function onModelUpdate():void {

			view.setNumFailures(model.failures);
			if(model.visible != view.visible)
				view.visible = model.visible;
		}


		public function destroy():void {
		}
	}
}
