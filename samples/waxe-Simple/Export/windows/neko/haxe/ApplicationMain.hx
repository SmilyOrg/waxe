import Simple;

import lime.Lime;

class ApplicationMain {

    public static var _lime : Lime;

    public static function main ()
    {
        var _self = new ApplicationMain();

        //Create the runtime
        _lime = new Lime();

        var config = {
            fullscreen		: false,
            resizable 		: true,
            borderless		: true,//false,
            antialiasing    : 0,
            stencil_buffer 	: false,
            depth_buffer 	: false,
            vsync 			: false,
            fps				: 30,
            width 			: 1,//800, 
            height 			: 1,//600, 
            title 			: "Simple01"
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
        wx.App.boot(function() { new Simple(); });
    }
}