package;

import flixel.FlxG;
import openfl.utils.Assets;
import lime.utils.Assets as LimeAssets;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
#if sys
import sys.io.File;
import sys.FileSystem;
#else
import openfl.utils.Assets;
#end

using StringTools;

class CoolUtil
{
	// [Difficulty name, Chart file suffix]
	public static var currentLocaleList:Array<String>;
	public static var difficultyStuff:Array<Dynamic> = [
		['Normal', '']
	];

	public static function init()
		{
			CoolUtil.currentLocaleList = CoolUtil.coolTextFile(Paths.file('lyrics/lyrcis.txt', TEXT, 'text'));
		}

	public static function difficultyString():String
	{
		return difficultyStuff[PlayState.storyDifficulty][0].toUpperCase();
	}

	public static function boundTo(value:Float, min:Float, max:Float):Float {
		var newValue:Float = value;
		if(newValue < min) newValue = min;
		else if(newValue > max) newValue = max;
		return newValue;
	}

	public static function coolTextFile(path:String):Array<String>
		{
			var daList:Array<String> = Assets.getText(path).trim().split('\n');
	
			for (i in 0...daList.length)
			{
				daList[i] = daList[i].trim();
			}
			return daList;
		}

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}

	public static function getMinAndMax(value1:Float, value2:Float):Array<Float>
		{
			var minAndMaxs = new Array<Float>();
	
			var min = Math.min(value1, value2);
			var max = Math.max(value1, value2);
	
			minAndMaxs.push(min);
			minAndMaxs.push(max);
	
			return minAndMaxs;
		}

	//uhhhh does this even work at all? i'm starting to doubt
	public static function precacheSound(sound:String, ?library:String = null):Void {
		if(!Assets.cache.hasSound(Paths.sound(sound, library))) {
			FlxG.sound.cache(Paths.sound(sound, library));
		}
	}

	public static function browserLoad(site:String) {
		#if linux
		Sys.command('/usr/bin/xdg-open', [site, "&"]);
		#else
		FlxG.openURL(site);
		#end
	}
}
