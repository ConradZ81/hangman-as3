/**
 * Created by basti_000 on 12/10/2014.
 */
package de.conradzuse.hangman.views.components {

	import de.conradzuse.hangman.constants.AppConstants;
	import starling.display.Image;
	import starling.display.Sprite;

	public class ScaffoldView extends Sprite {

		private var _images:Vector.<Image>;

		public function ScaffoldView() {
			super();
		}

		/**
		 * prepare textures and positions
		 */
		public function init():void {

			_images = new Vector.<Image>(7);

			var i:int;

			for(i = 0; i < AppConstants.NUM_HANG_IMAGES;i++){

				var scaffoldPart:Image = new Image(EmbeddedTextures.HANG_IMAGES[i]);
				scaffoldPart.x = AppConstants.HANG_IMAGES_OFFSETS[i].x;
				scaffoldPart.y = AppConstants.HANG_IMAGES_OFFSETS[i].y;
				addChild(scaffoldPart);
				_images[i] = scaffoldPart;
			}
		}

		public function hide():void {
			visible = false;
		}

		public function show():void {
			visible = true;
		}

		/**
		 * set number of failures (= visible scaffolding parts)
		 * @param value
		 */
		public function setNumFailures(value:int) {
			var i:int = 0;
			for(i=0; i < AppConstants.NUM_HANG_IMAGES; i++) {
				if(i < value)
					_images[i].visible = true;
				else
					_images[i].visible = false;
			}
		}
	}
}
