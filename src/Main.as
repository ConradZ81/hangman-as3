package {

	import de.conradzuse.hangman.config.HangmanConfig;
	import de.conradzuse.hangman.constants.AppConstants;
	import de.conradzuse.hangman.views.HangmanView;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;

	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.extensions.starlingViewMap.StarlingViewMapExtension;
	import robotlegs.bender.framework.impl.Context;

	import starling.core.Starling;
	import starling.events.ResizeEvent;

	[SWF(frameRate=60, width=310, height=450)]
	public class Main extends Sprite {

		private var _context:Context;
		private var _starling:Starling;

		/** main app entrypoint */
		public function Main() {
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		/**
		 * set up application
		 * @param event
		 */
		private function onAddedToStage(event:Event):void {

			mouseChildren = mouseEnabled = false;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			var screenWidth:Number = stage.stageWidth;
			var screenHeight:Number = stage.stageHeight;

			CONFIG::isMobile {

				trace("Applying mobile config...");
				stage.addEventListener(ResizeEvent.RESIZE, resizeStage);
				screenWidth = stage.fullScreenWidth;
				screenHeight = stage.fullScreenHeight;
			}

			var viewPortRectangle:Rectangle = new Rectangle();

			viewPortRectangle.width = screenWidth;
			viewPortRectangle.height = viewPortRectangle.width * AppConstants.WIDTH_HEIGHT_RATIO;

			if (viewPortRectangle.height > screenHeight) {
				viewPortRectangle.height = screenHeight;
				viewPortRectangle.width = screenHeight / AppConstants.WIDTH_HEIGHT_RATIO;
			}
			viewPortRectangle.x = (screenWidth - viewPortRectangle.width) / 2;
			viewPortRectangle.y = (screenHeight - viewPortRectangle.height) / 2;

			Starling.handleLostContext = true;
			_starling = new Starling(HangmanView, stage, viewPortRectangle, null, "auto", "baseline");
			_starling.antiAliasing = 4;
			_starling.showStats = false;
			_starling.stage.stageWidth  = AppConstants.RENDER_WIDTH;
			_starling.stage.stageHeight = AppConstants.RENDER_HEIGHT;
			_starling.start();

			_context = new Context();
			_context.install(MVCSBundle, StarlingViewMapExtension, SignalCommandMapExtension);
			_context.configure(new ContextView(this), _starling);
			_context.configure(HangmanConfig);

		}

		/**
		 * resize starling container on app resize/rotate
		 * @param event
		 */
		private function resizeStage(event:Event):void {

			var screenWidth:Number = stage.fullScreenWidth;
			var screenHeight:Number = stage.fullScreenHeight;
			var viewPortRectangle:Rectangle = new Rectangle();

			viewPortRectangle.width = screenWidth;
			viewPortRectangle.height = viewPortRectangle.width * AppConstants.WIDTH_HEIGHT_RATIO;
			if (viewPortRectangle.height > screenHeight) {
				viewPortRectangle.height = screenHeight;
				viewPortRectangle.width = viewPortRectangle.height / AppConstants.WIDTH_HEIGHT_RATIO;
			}
			viewPortRectangle.x = (screenWidth - viewPortRectangle.width) / 2;
			viewPortRectangle.y = (screenHeight - viewPortRectangle.height) / 2;

			Starling.current.viewPort = viewPortRectangle;
		}
	}
}
