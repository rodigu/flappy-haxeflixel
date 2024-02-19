package;

import haxe.io.Bytes;
import haxe.io.Path;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos || webassembly)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif (console || sys)
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_data_kenvector_future_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_data_kenvector_future_thin_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		data = '{"name":null,"assets":"aoy4:sizei34136y4:typey4:FONTy9:classNamey41:__ASSET__assets_data_kenvector_future_ttfy2:idy36:assets%2Fdata%2Fkenvector_future.ttfy7:preloadtgoR0i34100R1R2R3y46:__ASSET__assets_data_kenvector_future_thin_ttfR5y41:assets%2Fdata%2Fkenvector_future_thin.ttfR7tgoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txtR0zR1y4:TEXTR5R11R7tgoR10y36:assets%2Fsounds%2Fsounds-go-here.txtR0zR1R12R5R13R7tgoR10y36:assets%2Fimages%2Fimages-go-here.txtR0zR1R12R5R14R7tgoR10y28:assets%2Fimages%2Fplanes.pngR0i35745R1y5:IMAGER5R15R7tgoR10y31:assets%2Fimages%2FrockGrass.pngR0i4965R1R16R5R17R7tgoR10y33:assets%2Fimages%2FgroundGrass.pngR0i6351R1R16R5R18R7tgoR10y32:assets%2Fimages%2FgroundDirt.pngR0i6278R1R16R5R19R7tgoR10y32:assets%2Fimages%2Fbackground.pngR0i13024R1R16R5R20R7tgoR10y28:assets%2Fimages%2Fplanes.xmlR0i945R1R12R5R21R7tgoR10y27:assets%2Fimages%2Fsheet.pngR0i252033R1R16R5R22R7tgoR10y27:assets%2Fimages%2Fsheet.xmlR0i5987R1R12R5R23R7tgoR10y35:assets%2Fimages%2FrockGrassDown.pngR0i5004R1R16R5R24R7tgoR10y36:assets%2Fmusic%2Fmusic-goes-here.txtR0zR1R12R5R25R7tgoR0i8220R1y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3y9:pathGroupaR27y26:flixel%2Fsounds%2Fbeep.ogghR7tgoR0i39706R1R26R5y28:flixel%2Fsounds%2Fflixel.mp3R28aR30y28:flixel%2Fsounds%2Fflixel.ogghR7tgoR0i33629R1y5:SOUNDR5R31R28aR30R31hgoR0i6840R1R32R5R29R28aR27R29hgoR0i15744R1R2R3y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR7tgoR0i29724R1R2R3y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR7tgoR10y33:flixel%2Fimages%2Fui%2Fbutton.pngR0i248R1R16R5R37R7tgoR10y36:flixel%2Fimages%2Flogo%2Fdefault.pngR0i505R1R16R5R38R7tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

	}


}

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_kenvector_future_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_kenvector_future_thin_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_planes_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_rockgrass_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_groundgrass_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_grounddirt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_planes_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_sheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_sheet_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_rockgrassdown_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:font("export/html5/obj/webfont/kenvector_future.ttf") @:noCompletion #if display private #end class __ASSET__assets_data_kenvector_future_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/kenvector_future_thin.ttf") @:noCompletion #if display private #end class __ASSET__assets_data_kenvector_future_thin_ttf extends lime.text.Font {}
@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/planes.png") @:noCompletion #if display private #end class __ASSET__assets_images_planes_png extends lime.graphics.Image {}
@:keep @:image("assets/images/rockGrass.png") @:noCompletion #if display private #end class __ASSET__assets_images_rockgrass_png extends lime.graphics.Image {}
@:keep @:image("assets/images/groundGrass.png") @:noCompletion #if display private #end class __ASSET__assets_images_groundgrass_png extends lime.graphics.Image {}
@:keep @:image("assets/images/groundDirt.png") @:noCompletion #if display private #end class __ASSET__assets_images_grounddirt_png extends lime.graphics.Image {}
@:keep @:image("assets/images/background.png") @:noCompletion #if display private #end class __ASSET__assets_images_background_png extends lime.graphics.Image {}
@:keep @:file("assets/images/planes.xml") @:noCompletion #if display private #end class __ASSET__assets_images_planes_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/sheet.png") @:noCompletion #if display private #end class __ASSET__assets_images_sheet_png extends lime.graphics.Image {}
@:keep @:file("assets/images/sheet.xml") @:noCompletion #if display private #end class __ASSET__assets_images_sheet_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/rockGrassDown.png") @:noCompletion #if display private #end class __ASSET__assets_images_rockgrassdown_png extends lime.graphics.Image {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("/home/hiroto/haxelib/flixel/5,6,2/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/hiroto/haxelib/flixel/5,6,2/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/hiroto/haxelib/flixel/5,6,2/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:file("/home/hiroto/haxelib/flixel/5,6,2/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("/home/hiroto/haxelib/flixel/5,6,2/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("/home/hiroto/haxelib/flixel/5,6,2/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_data_kenvector_future_ttf') @:noCompletion #if display private #end class __ASSET__assets_data_kenvector_future_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/data/kenvector_future"; #else ascender = 896; descender = -256; height = 1152; numGlyphs = 217; underlinePosition = 77; underlineThickness = 51; unitsPerEM = 1024; #end name = "KenVector Future Regular"; super (); }}
@:keep @:expose('__ASSET__assets_data_kenvector_future_thin_ttf') @:noCompletion #if display private #end class __ASSET__assets_data_kenvector_future_thin_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/data/kenvector_future_thin"; #else ascender = 896; descender = -256; height = 1152; numGlyphs = 217; underlinePosition = 77; underlineThickness = 51; unitsPerEM = 1024; #end name = "KenVector Future Thin Regular"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_data_kenvector_future_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_data_kenvector_future_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_data_kenvector_future_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_data_kenvector_future_thin_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_data_kenvector_future_thin_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_data_kenvector_future_thin_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_data_kenvector_future_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_data_kenvector_future_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_data_kenvector_future_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_data_kenvector_future_thin_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_data_kenvector_future_thin_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_data_kenvector_future_thin_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end