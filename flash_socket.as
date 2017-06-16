package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.external.ExternalInterface;
	import flash.display.Sprite;
	import flash.NET.XMLSocket;
	import flash.system.Security;
	
	public class Main extends Sprite 
	{
		private var socket:XMLSocket = null;
		
		public function Main() 
		{
			ExternalInterface.addCallback('sendToFlash', recvFromJs);
			aaa();
			//if (stage) init();
			//else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			//removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
		private recvFromJs(msg:String = null):void{
			ExternalInterface.call('recvFromFlash', msg);
		}
		
		private function aaa():void{
			//Security.allowDomain("localhost:10000");
			btn.addEventListener(MouseEvent.CLICK,onClick)
			socket = new XMLSocket();
		 
			// Add an event listener to be notified when the connection is made
			socket.addEventListener( Event.CONNECT, onConnect );
		 
			// Connect to the server
			socket.connect( "localhost", 10000 );
 
		}
   
	    private function onClick(event:MouseEvent):void
	    {
			trace("点击鼠标了")
			socket.send("12321321321321321");
	    }
   
		private function onConnect( event:Event ):void {
			Security.loadPolicyFile("xmlsocket://localhost:843");
			trace( "The xml socket is now connected..." );
		}
   
		
	}
	
}
