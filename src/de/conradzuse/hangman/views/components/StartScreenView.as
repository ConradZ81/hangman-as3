/**
 * Created by basti_000 on 12/10/2014.
 */
package de.conradzuse.hangman.views.components {

	import org.osflash.signals.Signal;

	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.textures.Texture;

	public class StartScreenView extends Sprite{

		public var startClickSignal:Signal = new Signal();

		private var _hangman:Image;
		private var _background:Image;
		private var _instruction:TextField;

		private var _pressStart:TextField;

		public function StartScreenView() {
			super();
		}

		public function init():void {
			_background = new Image(Texture.fromColor(290,300,0xffffffff, true));
			_background.alpha = .7;
			_background.x = 10;
			_background.y = 50;
			addChild(_background);

			_hangman = new Image(EmbeddedTextures.HANGMAN_TEXTURE);
			addChild(_hangman);

			_instruction = new TextField(250, 280,"","Verdana", 14, 0);
			_instruction.x = 40;
			_instruction.y = 10;

			_instruction.text = "Instructions:\n" +
					"Guess the right letters\n" +
					"to save your life!\n\n" +
					"You have only 7 tries,\n" +
					"if you don't make it,\n" +
					"you will die of not very\n" +
					"comfortable causes!\n";
			addChild(_instruction);

			_pressStart = new TextField(290,140,"Click to\nStart!", "Impact", 36, 0, true);
			_pressStart.y = 210;
			addChild(_pressStart);

			addEventListener(TouchEvent.TOUCH, onTouch);

		}

		private function onTouch(event:TouchEvent):void {
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.ENDED)
				startClickSignal.dispatch();
		}



	}
}
