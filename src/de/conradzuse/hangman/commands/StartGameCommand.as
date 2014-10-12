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
	import de.conradzuse.hangman.views.components.KeyboardView;
	import de.conradzuse.hangman.views.components.ScaffoldView;

	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.ILogger;

	public class StartGameCommand implements ICommand{

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

			log.info("Starting game ...");

			scaffoldModel.failures = 0;
			scaffoldModel.visible = true;

			keyboardModel.lastPressed = "";
			keyboardModel.visible = true;

			var solution:String = hangmanModel.availableWords[Math.floor(Math.random()*hangmanModel.availableWords.length)];
			var maskedSolution:String = "";

			for(var i:int = 0; i < solution.length; i++) maskedSolution += "_";

			subjectModel.solution = solution;
			subjectModel.progress = maskedSolution;
			subjectModel.visible = true;

			startscreenModel.visible = false;

			modelUpdateSignal.dispatch();
		}
	}
}
