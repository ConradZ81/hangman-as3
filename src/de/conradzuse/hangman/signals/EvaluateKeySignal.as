/**
 * Created by basti_000 on 11/10/2014.
 */
package de.conradzuse.hangman.signals {

	import org.osflash.signals.Signal;

	/**
	 * gets dispatched, when key is pressed on keyboard
	 */
	public class EvaluateKeySignal extends Signal {
		public function EvaluateKeySignal() {
			super();
		}
	}
}
