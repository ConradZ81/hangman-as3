/**
 * Created by basti_000 on 12/10/2014.
 */
package de.conradzuse.hangman.controllers {

	import de.conradzuse.hangman.models.HangmanModel;
	import de.conradzuse.hangman.signals.ConfigReadSignal;

	import flash.events.Event;

	import flash.net.URLLoader;

	import flash.net.URLRequest;

	import robotlegs.bender.framework.api.ILogger;

	public class ConfigController {

		[Inject]
		public var hangmanModel:HangmanModel;

		[Inject]
		public var configReadSignal:ConfigReadSignal;

		[Inject]
		public var log:ILogger;

		public function readConfig():void {

			log.info("Loading: config.xml");
			var request:URLRequest = new URLRequest("config.xml");
			var loader:URLLoader = new URLLoader(request);
			loader.addEventListener(Event.COMPLETE, parseConfig)
			loader.load(request);

		}

		private function parseConfig(event:Event):void {

			log.info("Parsing config");

			var result:XML = new XML(event.target.data);
			hangmanModel.availableWords = new Vector.<String>();

			var i:int = 0;
			for(i = 0; i < result.word.length(); i++) {
				var solution:String = result.word[i];
				log.info("Adding possible solution: " + solution);
				hangmanModel.availableWords.push(solution);
			}
			configReadSignal.dispatch();
		}


	}
}
