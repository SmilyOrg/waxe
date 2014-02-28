package wx;

import wx.Window;

class StaticText extends Window
{
	public var label(get_label, set_label):String;

   public static function create(inParent:Window, ?inID:Null<Int>, inText:String="",
	                ?inPosition:Position,
                   ?inSize:Size, ?inStyle:Int )
   {
		if (inParent==null)
			throw Error.INVALID_PARENT;
      var args:Array<Dynamic> = [inParent.wxHandle, inID, inText, inPosition, inSize, inStyle];
      var handle = wx_static_text_create(args);
      return new StaticText(handle);
   }


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }

	public function set_label(inString:String) : String
	{
		wx_static_text_set_label(wxHandle,inString);
		return inString;
	}
	public function get_label() : String
	{
		return wx_static_text_get_label(wxHandle);
	}


   static var wx_static_text_create = Loader.load("wx_static_text_create",1);
   static var wx_static_text_get_label = Loader.load("wx_static_text_get_label",1);
   static var wx_static_text_set_label = Loader.load("wx_static_text_set_label",2);
}
