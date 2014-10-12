/**
 * Created by basti_000 on 12/10/2014.
 */
package de.conradzuse.hangman.commands {

	import de.conradzuse.hangman.constants.AppConstants;
	import de.conradzuse.hangman.controllers.SoundController;
	import de.conradzuse.hangman.models.HangmanModel;
	import de.conradzuse.hangman.models.KeyboardModel;
	import de.conradzuse.hangman.models.ScaffoldModel;
	import de.conradzuse.hangman.models.SubjectModel;
	import de.conradzuse.hangman.signals.LoseGameSignal;
	import de.conradzuse.hangman.signals.ModelUpdateSignal;
	import de.conradzuse.hangman.signals.WinGameSignal;

	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.ILogger;

	public class EvaluateKeyCommand implements ICommand{

		[Inject]
		public var modelUpdateSignal:ModelUpdateSignal;

		[Inject]
		public var loseGameSignal:LoseGameSignal;

		[Inject]
		public var winGameSignal:WinGameSignal;

		[Inject]
		public var keyboardModel:KeyboardModel;

		[Inject]
		public var scaffoldModel:ScaffoldModel;

		[Inject]
		public var hangmanModel:HangmanModel;

		[Inject]
		public var subjectModel:SubjectModel;

		[Inject]
		public var log:ILogger;

		[Inject]
		public var soundController:SoundController;

		public function execute():void {

			// play some sfx
			soundController.playClick();

			// check if key is available in solution
			var i:int;
			var isAvailable:Boolean = false;

			for(i=0; i < subjectModel.solution.length; i++) {
				if(subjectModel.solution.charAt(i) == keyboardModel.lastPressed) {
					subjectModel.progress = setCharAt(subjectModel.progress, keyboardModel.lastPressed.toUpperCase(), i);
					isAvailable = true;
				}
			}

			if(isAvailable) {
				log.info("Solution progress: " + subjectModel.progress);
				// is the word complete?
				if(subjectModel.progress == subjectModel.solution.toUpperCase()) {
					soundController.playWin();
					winGameSignal.dispatch();
					return;
				}
			} else {
				scaffoldModel.failures++;
				log.info("'"+keyboardModel.lastPressed+"' not found. Increasing failures...");
			}

			if(scaffoldModel.failures == AppConstants.NUM_HANG_IMAGES) {
				soundController.playLose();
				loseGameSignal.dispatch()
				return;
			}
			modelUpdateSignal.dispatch();
		}


		private function setCharAt(str:String, char:String,index:int):String {
			return str.substr(0,index) + char + str.substr(index + 1);
		}
	}
}
