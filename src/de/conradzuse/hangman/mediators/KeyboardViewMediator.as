/**
 * Created by basti_000 on 11/10/2014.
 */
package de.conradzuse.hangman.mediators {

	import de.conradzuse.hangman.models.KeyboardModel;
	import de.conradzuse.hangman.signals.EvaluateKeySignal;
	import de.conradzuse.hangman.signals.ModelUpdateSignal;
	import de.conradzuse.hangman.views.components.KeyboardView;

	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	import robotlegs.bender.framework.api.ILogger;

	public class KeyboardViewMediator implements IMediator {

		[Inject]
		public var view:KeyboardView;

		[Inject]
		public var log:ILogger;

		[Inject]
		public var model:KeyboardModel;

		[Inject]
		public var evaluateKeySignal:EvaluateKeySignal;

		[Inject]
		public var modelUpdateSignal:ModelUpdateSignal;

		public function initialize():void {

			log.info("Setting up virtual keyboard");
			view.setupKeyboard();
			view.keyPressedSignal.add(onKeyPressed);
			modelUpdateSignal.add(onModelUpdate)
		}

		private function onModelUpdate():void {
			if(model.visible != view.visible) {
				view.visible = model.visible;
			}
		}

		private function onKeyPressed(value:String):void {
			model.lastPressed = value;
			evaluateKeySignal.dispatch();
		}

		public function destroy():void {
		}
	}
}
