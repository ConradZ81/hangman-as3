/**
 * Created by basti_000 on 12/10/2014.
 */
package de.conradzuse.hangman.commands {

	import de.conradzuse.hangman.models.StartScreenModel;
	import de.conradzuse.hangman.signals.ModelUpdateSignal;

	import robotlegs.bender.extensions.commandCenter.api.ICommand;

	public class ConfigReadCommand implements ICommand {

		[Inject]
		public var startscreenModel:StartScreenModel;

		[Inject]
		public var modelUpdateSignal:ModelUpdateSignal;

		public function execute():void {
			startscreenModel.visible = true;
			modelUpdateSignal.dispatch();
		}
	}
}
