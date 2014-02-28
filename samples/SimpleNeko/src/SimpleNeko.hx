import wx.App;
import wx.BoxSizer;
import wx.Button;
import wx.Frame;
import wx.ListBox;
import wx.ListView;
import wx.StaticText;
class SimpleNeko {

	public static function main() { App.boot(init); }
	private static function init() { new SimpleNeko(); }
	
	public function new() {
		
		/**
		 * Components other than those listed might need small fixes regarding
		 * assigning [] to a var explicitly typed to Array<Dynamic> and fixing
		 * getters/setters into haxe3 style.
		 */
		
		var frame = Frame.create(null, null, "Hello World!", null, { width: 800, height: 600 });
		
		
		/**
		 * Override ugly gray color, more familiar solution would be to
		 * create a Sizer in expand mode with a Panel that has everything in it,
		 * but API might need addition for expand mode, haven't explored it much.
		 * 
		 * @link http://wiki.wxwidgets.org/WxFAQ#Why_are_backgrounds_of_windows_ugly.2C_dark_grey_on_Windows.3F_I_want_them_like_my_dialog_boxes.
		 */
		frame.backgroundColour = 0xFFFFFF;
		
		var boxSizer = BoxSizer.create(true);
		frame.sizer = boxSizer;
		
		boxSizer.add(StaticText.create(frame, null, "Hi! You opened me on " + Date.now()));
		
		boxSizer.add(ListBox.create(frame, null, null, null, ["lorem", "ipsum", "dolor", "sit", "amet"]));
		
		/**
		 * At the time of writing, ListView is VERY bare-bones, not usable yet.
		 */
		var list = ListView.create(frame, null, null, null, ListView.REPORT);
		list.appendColumn("a");
		list.appendColumn("b");
		list.appendColumn("c");
		list.insertItem(0, "abc");
		list.insertItem(1, "def");
		boxSizer.add(list);
		
		var hbox = BoxSizer.create(false);
		boxSizer.add(hbox);
		
		hbox.add(Button.create(frame, null, "Pretty"));
		hbox.add(Button.create(frame, null, "buttons"));
		hbox.add(Button.create(frame, null, "with"));
		hbox.add(Button.create(frame, null, "manifests!"));
		
		App.setTopWindow(frame);
		frame.shown = true;
		
	}
}
