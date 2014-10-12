/**
 * Created by basti_000 on 11/10/2014.
 */
package de.conradzuse.hangman.views.components {

	import de.conradzuse.hangman.constants.AppConstants;

	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.data.ListCollection;

	import flash.text.TextFormat;

	import org.osflash.signals.Signal;

	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;

	public class KeyboardView extends Sprite {

		public var keyPressedSignal:Signal = new Signal(String);

		private var _buttonGroups:Vector.<ButtonGroup>;

		public function KeyboardView() {
			super();
		}

		/**
		 * sets up visual representation
		 */
		public function setupKeyboard():void {

			_buttonGroups = new Vector.<ButtonGroup>(3, true);

			var i:int = 0;

			for (i = 0; i < 3; i++) {

				var bg:ButtonGroup = new ButtonGroup();

				bg.buttonFactory = generateButton;
				bg.gap = 5;

				bg.direction = ButtonGroup.DIRECTION_HORIZONTAL;
				var dataProvider:ListCollection = new ListCollection();
				for each(var label:String in AppConstants.KEYBOARD_LAYOUT[i]) {
					dataProvider.addItem({label: label.toUpperCase(), triggered: onKeyPressed});
				}
				bg.dataProvider = dataProvider;
				_buttonGroups[i] = bg;
				addChild(bg);
				bg.y = i * 40;
				bg.x = AppConstants.KEYBOARD_ROW_OFFSETS[i];
			}
		}

		private function generateButton():Button {
			var button:Button = new Button();
			button.labelFactory = function ():ITextRenderer {
				var textRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				textRenderer.textFormat = new TextFormat("Impact", 20, 0x000000);
				return textRenderer;
			}

			var downSkin:Image = new Image(Texture.fromColor(25, 35, 0xffffffff, true));
			downSkin.alpha = 1;

			var upSkin:Image = new Image(Texture.fromColor(25, 35, 0xffffffff, true));
			upSkin.alpha = .5;

			button.downSkin = downSkin;
			button.upSkin = upSkin;
			button.hoverSkin = upSkin;

			return button;
		}

		private function onKeyPressed(event:Event):void {
			var button:Button = Button(event.currentTarget);
			keyPressedSignal.dispatch(button.label.toLowerCase());
		}

	}
}
