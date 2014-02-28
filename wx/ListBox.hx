package wx;

import wx.Window;

class ListBox extends ControlWithItems
{
   public static inline var NO_SELECTION = -1;

	//public var label(getLabel,setLabel):String;
	public var onSelected(null,set_onSelected) : Dynamic->Void;
	public var onDClick(null,set_onDClick) : Dynamic->Void;
   public var selection(get_selection,set_selection) : Int;

   public static function create(inParent:Window, ?inID:Null<Int>,
	                ?inPosition:Position,
                   ?inSize:Size, ?inValues:Array<String>, ?inStyle:Int )
   {
		if (inParent==null)
			throw Error.INVALID_PARENT;
      var args:Array<Dynamic> = [inParent.wxHandle, inID, "", inPosition, inSize, inStyle];
      var handle = wx_list_box_create( args, inValues );
      return new ListBox(handle);
   }


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }

	function set_onSelected(f:Dynamic->Void)
	   {setHandler(wx.EventID.COMMAND_LISTBOX_SELECTED,f); return f;}
	function set_onDClick(f:Dynamic->Void)
	   {setHandler(wx.EventID.COMMAND_LISTBOX_DOUBLECLICKED,f); return f;}
   public function get_selection() : Int { return wx_list_box_get_selection(wxHandle); }
   public function set_selection(val:Int) : Int
   {
      wx_list_box_set_selection(wxHandle,val);
      return val;
   }

   public function getString(inI:Int) : String
   {
      return wx_list_box_get_string(wxHandle,inI);
   }
   public function setString(inI:Int,inString:String)
   {
      wx_list_box_set_string(wxHandle,inString,inI);
   }





   public function set(insertArray:Array<String>)  { wx_list_box_set(wxHandle,insertArray); }
   static var wx_list_box_set = Loader.load("wx_list_box_set",2);
   


   static var wx_list_box_create = Loader.load("wx_list_box_create",2);
   static var wx_list_box_get_selection = Loader.load("wx_list_box_get_selection",1);
   static var wx_list_box_set_selection = Loader.load("wx_list_box_set_selection",2);
   static var wx_list_box_get_string = Loader.load("wx_list_box_get_string",2);
   static var wx_list_box_set_string = Loader.load("wx_list_box_set_string",3);
}
