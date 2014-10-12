/**
 * Created by basti_000 on 12/10/2014.
 */
package de.conradzuse.hangman.mediators {

	import de.conradzuse.hangman.models.SubjectModel;
	import de.conradzuse.hangman.signals.ModelUpdateSignal;
	import de.conradzuse.hangman.signals.StartGameSignal;
	import de.conradzuse.hangman.views.components.SubjectView;

	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	import robotlegs.bender.framework.api.ILogger;

	public class SubjectViewMediator implements IMediator{

		[Inject]
		public var view:SubjectView;

		[Inject]
		public var modelUpdateSignal:ModelUpdateSignal;

		[Inject]
		public var model:SubjectModel;

		[Inject]
		public var log:ILogger;


		public function initialize():void {
			log.info("Setting up subject progress view...");

			view.init();
			modelUpdateSignal.add(onModelUpdate)
		}

		private function onModelUpdate():void {
			view.setText(model.progress);

			if(view.visible != model.visible) {
				view.visible = model.visible;
			}
		}

		public function destroy():void {
		}
	}
}
