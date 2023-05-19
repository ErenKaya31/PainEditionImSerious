package;

import flixel.util.FlxColor;
import flixel.util.FlxSave;

using StringTools;

class LyricsManager
{
	public static var currentLocaleList:Array<String>;
	public static var save:FlxSave;

	public static function initSave()
	{
		save = new FlxSave();
		save.bind('language', 'ninjamuffin99');
	}

	public static function init()
	{
		LyricsManager.currentLocaleList = CoolUtil.coolTextFile(Paths.file('locale/subtitles/subtitle.txt', TEXT,
			'preload'));
	}

	public static function getTextString(stringName:String):String
	{
		var returnedString:String = '';
		for (i in 0...currentLocaleList.length)
		{
			var currentValue = currentLocaleList[i].trim().split('==');
			if (currentValue[0] != stringName)
			{
				continue;
			}
			else
			{
				returnedString = currentValue[1];
			}
		}
		if (returnedString == '')
		{
			return stringName;
		}
		else
		{
			returnedString = returnedString.replace(':linebreak:', '\n');
			returnedString = returnedString.replace(':addquote:', '\"');
			return returnedString;
		}
	}
}