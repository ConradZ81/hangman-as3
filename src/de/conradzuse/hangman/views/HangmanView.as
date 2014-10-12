/**
 * Created by basti_000 on 11/10/2014.
 */
package de.conradzuse.hangman.views {

	import de.conradzuse.hangman.constants.AppConstants;
	import de.conradzuse.hangman.views.components.HeaderView;
	import de.conradzuse.hangman.views.components.KeyboardView;
	import de.conradzuse.hangman.views.components.ScaffoldView;
	import de.conradzuse.hangman.views.components.StartScreenView;
	import de.conradzuse.hangman.views.components.SubjectView;

	import starling.display.Image;
	import starling.display.Sprite;


	public class HangmanView extends Sprite {

		private var _background:Image;
		private var _keyboard:KeyboardView;
		private var _scaffoldView:ScaffoldView;
		private var _subjectView:SubjectView;

		private var _header:HeaderView;
		private var _startScreen:StartScreenView;

		public function HangmanView() {
			super();

		}


		public function init():void {

			_background = new Image(EmbeddedTextures.BACKGROUND_TEXTURE);
			addChild(_background);

			_header = new HeaderView();
			addChild(_header);

			_scaffoldView = new ScaffoldView();
			_scaffoldView.x = AppConstants.SCAFFOLD_SCREEN_OFFSET.x;
			_scaffoldView.y = AppConstants.SCAFFOLD_SCREEN_OFFSET.y;
			_scaffoldView.visible = false;
			addChild(_scaffoldView);
			_scaffoldView.setNumFailures(0);

			_keyboard = new KeyboardView();
			_keyboard.x = AppConstants.KEYBOARD_SCREEN_OFFSET.x;
			_keyboard.y = AppConstants.KEYBOARD_SCREEN_OFFSET.y;
			_keyboard.visible = false;
			addChild(_keyboard);

			_subjectView = new SubjectView();
			_subjectView.x = AppConstants.SUBJECTVIEW_SCREEN_OFFSET.x;
			_subjectView.y = AppConstants.SUBJECTVIEW_SCREEN_OFFSET.y;
			_subjectView.visible = false;
			addChild(_subjectView);

			_startScreen = new StartScreenView();
			_startScreen.x = AppConstants.STARTSCREEN_SCREEN_OFFSET.x;
			_startScreen.y = AppConstants.STARTSCREEN_SCREEN_OFFSET.y;
			_startScreen.visible = false;
			addChild(_startScreen);
		}
	}
}
