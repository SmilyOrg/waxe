package wx;

import haxe.Int64;
import wx.Window;

class ListView extends Window {
	
	// Style flags
	public static inline var LIST            = 0x0010;
	public static inline var REPORT          = 0x0020;
	public static inline var VIRTUAL         = 0x0200;
	public static inline var ICON            = 0x0004;
	public static inline var SMALL_ICON      = 0x0008;
	public static inline var ALIGN_TOP       = 0x0040;
	public static inline var ALIGN_LEFT      = 0x0080;
	public static inline var AUTOARRANGE     = 0x0100;
	public static inline var EDIT_LABELS     = 0x0400;
	public static inline var NO_HEADER       = 0x0800;
	public static inline var SINGLE_SEL      = 0x2000;
	public static inline var SORT_ASCENDING  = 0x4000;
	public static inline var SORT_DESCENDING = 0x8000;
	public static inline var HRULES          = 0x0002;
	public static inline var VRULES          = 0x0001;
	public static inline var DEFAULT_STYLE   = ICON;
	
	public static function create(inParent:Window, ?inID:Null<Int>,	?inPosition:Position, ?inSize:Size, ?inStyle:Int = DEFAULT_STYLE) {
		if (inParent == null) throw Error.INVALID_PARENT;
		var args:Array<Dynamic> = [inParent.wxHandle, inID, "", inPosition, inSize, inStyle];
		var handle = wx_list_view_create( args );
		return new ListView(handle);
	}
	
	public function new(inHandle:Dynamic) {
		super(inHandle);
	}
	
	public function appendColumn(heading:String) {
		wx_list_view_append_column(wxHandle, heading);
	}
	
	public function insertItem(index:Int, label:String) {
		wx_list_view_insert_item(wxHandle, index, label);
	}
	
	static var wx_list_view_create = Loader.load("wx_list_view_create", 1);
	static var wx_list_view_append_column = Loader.load("wx_list_view_append_column", 2);
	static var wx_list_view_insert_item = Loader.load("wx_list_view_insert_item", 3);
}