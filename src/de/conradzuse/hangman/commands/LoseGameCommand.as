/**
 * Created by basti_000 on 12/10/2014.
 */
package de.conradzuse.hangman.commands {

	import de.conradzuse.hangman.models.HangmanModel;
	import de.conradzuse.hangman.models.KeyboardModel;
	import de.conradzuse.hangman.models.ScaffoldModel;
	import de.conradzuse.hangman.models.StartScreenModel;
	import de.conradzuse.hangman.models.SubjectModel;
	import de.conradzuse.hangman.signals.ModelUpdateSignal;

	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.ILogger;

	public class LoseGameCommand implements ICommand {

		[Inject]
		public var keyboardModel:KeyboardModel;

		[Inject]
		public var scaffoldModel:ScaffoldModel;

		[Inject]
		public var hangmanModel:HangmanModel;

		[Inject]
		public var startscreenModel:StartScreenModel;

		[Inject]
		public var subjectModel:SubjectModel;

		[Inject]
		public var modelUpdateSignal:ModelUpdateSignal;

		[Inject]
		public var log:ILogger;

		public function execute():void {

			log.info("Not solved. Incrasing loss count...");
			hangmanModel.lossCount ++;

			// go back to startscreen state
			keyboardModel.visible = false;
			subjectModel.visible = false;
			startscreenModel.visible = true;

			modelUpdateSignal.dispatch();
		}
	}
}
