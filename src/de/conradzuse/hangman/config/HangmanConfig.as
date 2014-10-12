/**
 * Created by basti_000 on 11/10/2014.
 */
package de.conradzuse.hangman.config {

	import de.conradzuse.hangman.commands.ConfigReadCommand;
	import de.conradzuse.hangman.commands.EvaluateKeyCommand;
	import de.conradzuse.hangman.commands.LoseGameCommand;
	import de.conradzuse.hangman.commands.StartGameCommand;
	import de.conradzuse.hangman.commands.WinGameCommand;
	import de.conradzuse.hangman.controllers.ConfigController;
	import de.conradzuse.hangman.controllers.SoundController;
	import de.conradzuse.hangman.mediators.HangmanViewMediator;
	import de.conradzuse.hangman.mediators.HeaderViewMediator;
	import de.conradzuse.hangman.mediators.KeyboardViewMediator;
	import de.conradzuse.hangman.mediators.ScaffoldViewMediator;
	import de.conradzuse.hangman.mediators.StartScreenViewMediator;
	import de.conradzuse.hangman.mediators.SubjectViewMediator;
	import de.conradzuse.hangman.models.HangmanModel;
	import de.conradzuse.hangman.models.KeyboardModel;
	import de.conradzuse.hangman.models.ScaffoldModel;
	import de.conradzuse.hangman.models.StartScreenModel;
	import de.conradzuse.hangman.models.SubjectModel;
	import de.conradzuse.hangman.signals.ConfigReadSignal;
	import de.conradzuse.hangman.signals.EvaluateKeySignal;
	import de.conradzuse.hangman.signals.LoseGameSignal;
	import de.conradzuse.hangman.signals.ModelUpdateSignal;
	import de.conradzuse.hangman.signals.StartGameSignal;
	import de.conradzuse.hangman.signals.WinGameSignal;
	import de.conradzuse.hangman.views.HangmanView;
	import de.conradzuse.hangman.views.components.HeaderView;
	import de.conradzuse.hangman.views.components.KeyboardView;
	import de.conradzuse.hangman.views.components.ScaffoldView;
	import de.conradzuse.hangman.views.components.StartScreenView;
	import de.conradzuse.hangman.views.components.SubjectView;

	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.api.ILogger;
	import robotlegs.bender.framework.api.LogLevel;

	/**
	 * HangmanConfig - will setup starling context and map necessary stuff
	 */
	public class HangmanConfig implements IConfig {

		[Inject]
		public var injector:IInjector;

		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var commandMap:ISignalCommandMap;

		[Inject]
		public var contextView:ContextView;

		[Inject]
		public var log:ILogger;

		[Inject]
		public var context:IContext;


		/**
		 * gets called from starling
		 */
		public function configure():void {

			context.logLevel = LogLevel.INFO;
			log.info("Now applying application configuration...");

			// map models
			injector.map(HangmanModel).asSingleton();
			injector.map(KeyboardModel).asSingleton();
			injector.map(ScaffoldModel).asSingleton();
			injector.map(StartScreenModel).asSingleton();
			injector.map(SubjectModel).asSingleton();

			// map views
			mediatorMap.map(HangmanView).toMediator(HangmanViewMediator);
			mediatorMap.map(KeyboardView).toMediator(KeyboardViewMediator);
			mediatorMap.map(ScaffoldView).toMediator(ScaffoldViewMediator);
			mediatorMap.map(HeaderView).toMediator(HeaderViewMediator);
			mediatorMap.map(StartScreenView).toMediator(StartScreenViewMediator);
			mediatorMap.map(SubjectView).toMediator(SubjectViewMediator);

			// map commands
			commandMap.map(EvaluateKeySignal).toCommand(EvaluateKeyCommand);
			commandMap.map(StartGameSignal).toCommand(StartGameCommand);
			commandMap.map(LoseGameSignal).toCommand(LoseGameCommand);
			commandMap.map(WinGameSignal).toCommand(WinGameCommand);
			commandMap.map(ConfigReadSignal).toCommand(ConfigReadCommand);

			// map signals
			injector.map(ModelUpdateSignal).asSingleton();

			// map controllers
			injector.map(SoundController).asSingleton();
			injector.map(ConfigController).asSingleton();
		}

	}
}
