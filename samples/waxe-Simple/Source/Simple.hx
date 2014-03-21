import wx.Sizer;
import lime.Constants.Window;

class Simple
{  
    var mFrame : wx.Frame;
    var mGlCanvas : GLView;

    public function new()
    {
        var box_sizer = wx.BoxSizer.create(true);
   
        // set the window details
        mFrame = wx.Frame.create(null, null, "Simple01", null, { width: 800, height: 600 });
        mGlCanvas = GLView.create(mFrame, null, null, { width: 800, height: 300 });
        
        box_sizer.add(mGlCanvas,0,Sizer.EXPAND);
      
        mFrame.sizer = box_sizer;

        wx.App.setTopWindow(mFrame);
        mFrame.shown = true;
   }

   public static function main()
   {
      wx.App.boot(function() { new Simple(); });
   }
}
