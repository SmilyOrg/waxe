package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("Beep", __ASSET__assets_data_beep_wav);
		type.set ("Beep", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/data/autotiles.png", __ASSET__assets_data_autotiles_png);
		type.set ("assets/data/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/autotiles_alt.png", __ASSET__assets_data_autotiles_alt_png);
		type.set ("assets/data/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/base.png", __ASSET__assets_data_base_png);
		type.set ("assets/data/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/beep.mp3", __ASSET__assets_data_beep_mp3);
		type.set ("assets/data/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/data/beep.wav", __ASSET__assets_data_beep_wav1);
		type.set ("assets/data/beep.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/data/button.png", __ASSET__assets_data_button_png);
		type.set ("assets/data/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_a.png", __ASSET__assets_data_button_a_png);
		type.set ("assets/data/button_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_b.png", __ASSET__assets_data_button_b_png);
		type.set ("assets/data/button_b.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_c.png", __ASSET__assets_data_button_c_png);
		type.set ("assets/data/button_c.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_down.png", __ASSET__assets_data_button_down_png);
		type.set ("assets/data/button_down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_left.png", __ASSET__assets_data_button_left_png);
		type.set ("assets/data/button_left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_right.png", __ASSET__assets_data_button_right_png);
		type.set ("assets/data/button_right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_up.png", __ASSET__assets_data_button_up_png);
		type.set ("assets/data/button_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_x.png", __ASSET__assets_data_button_x_png);
		type.set ("assets/data/button_x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_y.png", __ASSET__assets_data_button_y_png);
		type.set ("assets/data/button_y.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/courier.ttf", __ASSET__assets_data_courier_ttf);
		type.set ("assets/data/courier.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/data/cursor.png", __ASSET__assets_data_cursor_png);
		type.set ("assets/data/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/default.png", __ASSET__assets_data_default_png);
		type.set ("assets/data/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/fontData10pt.png", __ASSET__assets_data_fontdata10pt_png);
		type.set ("assets/data/fontData10pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/fontData11pt.png", __ASSET__assets_data_fontdata11pt_png);
		type.set ("assets/data/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/handle.png", __ASSET__assets_data_handle_png);
		type.set ("assets/data/handle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/logo.png", __ASSET__assets_data_logo_png);
		type.set ("assets/data/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/logo_corners.png", __ASSET__assets_data_logo_corners_png);
		type.set ("assets/data/logo_corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/logo_light.png", __ASSET__assets_data_logo_light_png);
		type.set ("assets/data/logo_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/nokiafc22.ttf", __ASSET__assets_data_nokiafc22_ttf);
		type.set ("assets/data/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/data/stick.png", __ASSET__assets_data_stick_png);
		type.set ("assets/data/stick.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/flixel.png", __ASSET__assets_data_vcr_flixel_png);
		type.set ("assets/data/vcr/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/open.png", __ASSET__assets_data_vcr_open_png);
		type.set ("assets/data/vcr/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/pause.png", __ASSET__assets_data_vcr_pause_png);
		type.set ("assets/data/vcr/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/play.png", __ASSET__assets_data_vcr_play_png);
		type.set ("assets/data/vcr/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/record_off.png", __ASSET__assets_data_vcr_record_off_png);
		type.set ("assets/data/vcr/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/record_on.png", __ASSET__assets_data_vcr_record_on_png);
		type.set ("assets/data/vcr/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/restart.png", __ASSET__assets_data_vcr_restart_png);
		type.set ("assets/data/vcr/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/step.png", __ASSET__assets_data_vcr_step_png);
		type.set ("assets/data/vcr/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/stop.png", __ASSET__assets_data_vcr_stop_png);
		type.set ("assets/data/vcr/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vis/bounds.png", __ASSET__assets_data_vis_bounds_png);
		type.set ("assets/data/vis/bounds.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/HaxeFlixel.svg", __ASSET__assets_haxeflixel_svg);
		type.set ("assets/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		
		
		#elseif html5
		
		addExternal("Beep", "sound", "assets/data/beep.wav");
		addExternal("assets/data/autotiles.png", "image", "assets/data/autotiles.png");
		addExternal("assets/data/autotiles_alt.png", "image", "assets/data/autotiles_alt.png");
		addExternal("assets/data/base.png", "image", "assets/data/base.png");
		addExternal("assets/data/beep.mp3", "music", "assets/data/beep.mp3");
		addExternal("assets/data/beep.wav", "sound", "assets/data/beep.wav");
		addExternal("assets/data/button.png", "image", "assets/data/button.png");
		addExternal("assets/data/button_a.png", "image", "assets/data/button_a.png");
		addExternal("assets/data/button_b.png", "image", "assets/data/button_b.png");
		addExternal("assets/data/button_c.png", "image", "assets/data/button_c.png");
		addExternal("assets/data/button_down.png", "image", "assets/data/button_down.png");
		addExternal("assets/data/button_left.png", "image", "assets/data/button_left.png");
		addExternal("assets/data/button_right.png", "image", "assets/data/button_right.png");
		addExternal("assets/data/button_up.png", "image", "assets/data/button_up.png");
		addExternal("assets/data/button_x.png", "image", "assets/data/button_x.png");
		addExternal("assets/data/button_y.png", "image", "assets/data/button_y.png");
		addEmbed("assets/data/courier.ttf", "font", __ASSET__assets_data_courier_ttf);
		addExternal("assets/data/cursor.png", "image", "assets/data/cursor.png");
		addExternal("assets/data/default.png", "image", "assets/data/default.png");
		addExternal("assets/data/fontData10pt.png", "image", "assets/data/fontData10pt.png");
		addExternal("assets/data/fontData11pt.png", "image", "assets/data/fontData11pt.png");
		addExternal("assets/data/handle.png", "image", "assets/data/handle.png");
		addExternal("assets/data/logo.png", "image", "assets/data/logo.png");
		addExternal("assets/data/logo_corners.png", "image", "assets/data/logo_corners.png");
		addExternal("assets/data/logo_light.png", "image", "assets/data/logo_light.png");
		addEmbed("assets/data/nokiafc22.ttf", "font", __ASSET__assets_data_nokiafc22_ttf);
		addExternal("assets/data/stick.png", "image", "assets/data/stick.png");
		addExternal("assets/data/vcr/flixel.png", "image", "assets/data/vcr/flixel.png");
		addExternal("assets/data/vcr/open.png", "image", "assets/data/vcr/open.png");
		addExternal("assets/data/vcr/pause.png", "image", "assets/data/vcr/pause.png");
		addExternal("assets/data/vcr/play.png", "image", "assets/data/vcr/play.png");
		addExternal("assets/data/vcr/record_off.png", "image", "assets/data/vcr/record_off.png");
		addExternal("assets/data/vcr/record_on.png", "image", "assets/data/vcr/record_on.png");
		addExternal("assets/data/vcr/restart.png", "image", "assets/data/vcr/restart.png");
		addExternal("assets/data/vcr/step.png", "image", "assets/data/vcr/step.png");
		addExternal("assets/data/vcr/stop.png", "image", "assets/data/vcr/stop.png");
		addExternal("assets/data/vis/bounds.png", "image", "assets/data/vis/bounds.png");
		addExternal("assets/HaxeFlixel.svg", "text", "assets/HaxeFlixel.svg");
		
		
		#else
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<AssetData> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							path.set (asset.id, asset.path);
							type.set (asset.id, asset.type);
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest");
				
			}
			
		} catch (e:Dynamic) {
			
			trace ("Warning: Could not load asset manifest");
			
		}
		
		#end
		
	}
	
	
	#if html5
	private function addEmbed(id:String, kind:String, value:Dynamic):Void {
		className.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	
	
	private function addExternal(id:String, kind:String, value:String):Void {
		path.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	#end
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

class __ASSET__assets_data_beep_wav extends null { }
class __ASSET__assets_data_autotiles_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_autotiles_alt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_base_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_beep_mp3 extends null { }
class __ASSET__assets_data_beep_wav1 extends null { }
class __ASSET__assets_data_button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_b_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_c_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_down_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_left_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_right_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_up_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_x_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_y_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_courier_ttf extends null { }
class __ASSET__assets_data_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_default_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_fontdata10pt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_fontdata11pt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_handle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_logo_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_logo_corners_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_logo_light_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_nokiafc22_ttf extends null { }
class __ASSET__assets_data_stick_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_flixel_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_open_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_pause_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_play_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_record_off_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_record_on_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_restart_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_step_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_stop_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vis_bounds_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_haxeflixel_svg extends null { }


#elseif html5

















class __ASSET__assets_data_courier_ttf extends flash.text.Font { }








class __ASSET__assets_data_nokiafc22_ttf extends flash.text.Font { }














#end
