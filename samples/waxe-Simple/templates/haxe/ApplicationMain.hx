import ::APP_MAIN::;

import lime.Lime;

class ApplicationMain {

    public static var _lime : Lime;

    public static function main ()
    {
        var _self = new ApplicationMain();

        //Create the runtime
        _lime = new Lime();

        var config = {
            fullscreen		: ::WIN_FULLSCREEN::,
            resizable 		: ::WIN_RESIZABLE::,
            borderless		: true,//::WIN_BORDERLESS::,
            antialiasing    : ::WIN_ANTIALIASING::,
            stencil_buffer 	: ::WIN_STENCIL_BUFFER::,
            depth_buffer 	: ::WIN_DEPTH_BUFFER::,
            vsync 			: ::WIN_VSYNC::,
            fps				: ::WIN_FPS::,
            width 			: 1,//::WIN_WIDTH::, 
            height 			: 1,//::WIN_HEIGHT::, 
            title 			: "::APP_TITLE::"
        };

        // hack: setup opengl using lime then shutdown immediately in _self.ready
        _lime.init( _self, config );
        
        // show the real window now
        _self.run();
    }
    
    public function new() {}
    
    public function ready(lime:Lime):Void
    {
        lime.shutdown();
    }
   
    public function run()
    {
        wx.App.boot(function() { new ::APP_MAIN::(); });
    }
}