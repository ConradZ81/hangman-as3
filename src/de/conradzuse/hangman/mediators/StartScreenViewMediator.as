/**
 * Created by basti_000 on 12/10/2014.
 */
package de.conradzuse.hangman.mediators {

	import de.conradzuse.hangman.controllers.ConfigController;
	import de.conradzuse.hangman.models.StartScreenModel;
	import de.conradzuse.hangman.signals.ModelUpdateSignal;
	import de.conradzuse.hangman.signals.StartGameSignal;
	import de.conradzuse.hangman.views.components.StartScreenView;

	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	import robotlegs.bender.framework.api.ILogger;

	public class StartScreenViewMediator implements IMediator{

		[Inject]
		public var view:StartScreenView;

		[Inject]
		public var startGameSignal:StartGameSignal;

		[Inject]
		public var modelUpdateSignal:ModelUpdateSignal;

		[Inject]
		public var model:StartScreenModel;

		[Inject]
		public var configController:ConfigController;

		[Inject]
		public var log:ILogger;

		public function initialize():void {
			log.info("Initializing start screen...");
			view.init();
			view.startClickSignal.add(onStartGame);
			modelUpdateSignal.add(onModelUpdate);

			configController.readConfig();
		}

		private function onModelUpdate():void {
			if(view.visible != model.visible) {
				view.visible = model.visible;
			}
		}

		private function onStartGame():void {
			startGameSignal.dispatch();
		}

		public function destroy():void {
		}
	}
}
