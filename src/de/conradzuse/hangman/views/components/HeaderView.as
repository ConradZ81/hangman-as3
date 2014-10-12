/**
 * Created by basti_000 on 12/10/2014.
 */
package de.conradzuse.hangman.views.components {

	import de.conradzuse.hangman.constants.AppConstants;

	import starling.display.Sprite;

	import starling.text.TextField;

	public class HeaderView extends Sprite{

		private var _text:TextField;

		public function HeaderView() {
			super();
		}

		public function init():void {
			_text = new TextField(AppConstants.RENDER_WIDTH, 30,"Hangman - Wins: 0 - Losses: 0", "Impact", 24, 0xffffffff, false);
			addChild(_text);
		}


		public function setHeadline(wins:int, losses:int):void {
			_text.text = "Hangman - Wins: " + wins + " - Losses: " + losses;
		}

	}
}
