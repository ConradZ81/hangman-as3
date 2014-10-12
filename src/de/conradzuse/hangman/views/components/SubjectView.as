/**
 * Created by basti_000 on 12/10/2014.
 */
package de.conradzuse.hangman.views.components {

	import starling.display.Sprite;
	import starling.text.TextField;

	public class SubjectView extends Sprite {

		private var _text:TextField;

		public function SubjectView() {
			super();
		}

		public function init():void {

			_text = new TextField(310,100,"","Impact",48,0xff0000,true);
			addChild(_text);
		}


		public function setText(value:String) {
			var i:int;
			var text:String = "";

			for(i=0; i < value.length;i++) {
				text += value.charAt(i).toUpperCase();
				if(i < value.length-1) text += " ";
			}
			_text.text = text;
		}


	}
}
