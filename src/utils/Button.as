package utils 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * ...
	 * @author Kit van de Bunt
	 */
	public class Button extends Sprite
	{
		private var buttonText:TextField = new TextField();
		private var textStyle:TextFormat = new TextFormat();
		private var button:Sprite;
		
		private var text:String;
		private var buttonWidth:int;
		private var buttonHeight:int;
		
		private var textColor:uint;
		private var backgroundColor:uint;
		private var borderColor:uint;
		
		private var normalTextColor:uint;
		private var normalBackgroundColor:uint;
		private var normalBorderColor:uint;
		
		private var hoverTextColor:uint;
		private var hoverBackgroundColor:uint;
		private var hoverBorderColor:uint;
		
		private var clickTextColor:uint;
		private var clickBackgroundColor:uint;
		private var clickBorderColor:uint;
		private var clickTimer:int;
		private var clickTime:int =15;
		
		
		public function Button($text:String = "Text",
		$textColor:uint = 0xffffff, $backgroundColor:uint = 0x000000, $borderColor:uint = 0xffffff ,
		$hoverTextColor:uint = 0xff0000, $hoverBackgroundColor:uint = 0x000000, $hoverBorderColor:uint = 0xffffff ,
		$clickTextColor:uint = 0x00ffff, $clickBackgroundColor:uint = 0x000000, $clickBorderColor:uint = 0xffffff ,
		$width:int = 100,$height:int = 20) 
		{
			text = $text;
			
			normalTextColor = $textColor;
			normalBackgroundColor = $backgroundColor;
			normalBorderColor = $borderColor;
			
			hoverTextColor = $hoverTextColor;
			hoverBackgroundColor = $hoverBackgroundColor;
			hoverBorderColor = $hoverBorderColor;
			
			clickTextColor = $clickTextColor;
			clickBackgroundColor = $clickBackgroundColor;
			clickBorderColor = $clickBorderColor;
			
			buttonWidth = $width;
			buttonHeight = $height;	
			
			textColor = normalTextColor;
			backgroundColor = normalBackgroundColor;
			borderColor = normalBorderColor;
			drawbutton();
			
			
			
			addEventListener(MouseEvent.ROLL_OVER,mouseOn);
			addEventListener(MouseEvent.ROLL_OUT,mouseOff);
			addEventListener(MouseEvent.MOUSE_DOWN,mouseClick);
			addEventListener(MouseEvent.MOUSE_UP,mouseOn);
		}
		
		private function clickTimerLoop(e:Event):void {
			
		}
		
		private function mouseOff(m:MouseEvent):void {
			textColor = normalTextColor;
			backgroundColor = normalBackgroundColor;
			borderColor = normalBorderColor;
			drawbutton();
		}
		
		private function mouseOn(m:MouseEvent):void {
			textColor = hoverTextColor;
			backgroundColor = hoverBackgroundColor;
			borderColor = hoverBorderColor;
			drawbutton();
		}
		
		private function mouseClick(m:MouseEvent):void {
			textColor = clickTextColor;
			backgroundColor = clickBackgroundColor;
			borderColor = clickBorderColor;
			drawbutton();
		}
		
		private function drawbutton():void {
			button = new Sprite();
			//trace(textColor);
			//style
			textStyle.align = TextFormatAlign.CENTER;
			textStyle.size = buttonHeight -5;
			//button
			button.graphics.beginFill(backgroundColor);
			button.graphics.lineStyle(3, borderColor);
			button.graphics.drawRect( -buttonWidth / 2, -buttonHeight / 2, buttonWidth, buttonHeight);
			button.graphics.endFill();
			addChild(button);
			//text
			buttonText.x = -buttonWidth / 2;
			buttonText.y = -buttonHeight / 2;
			buttonText.width = buttonWidth;
			buttonText.height = buttonHeight;
			buttonText.textColor = textColor;
			buttonText.text = text; 
			buttonText.mouseEnabled = false;
			addChild(buttonText);
			buttonText.setTextFormat(textStyle);
			
			this.buttonMode = true;
		}
	}
}