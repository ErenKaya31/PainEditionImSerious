package;

import sys.FileSystem;
import flixel.group.FlxSpriteGroup;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.math.FlxMath;

typedef SongHeading =
{
	var path:String;
	var antiAliasing:Bool;
	var ?animation:Animation;
	var iconOffset:Float;
}

class CreditsPopUp extends FlxSpriteGroup
{
	public var bg:FlxSprite;
	public var bgHeading:FlxSprite;

	public var funnyText:FlxText;
	public var funnyIcon:FlxSprite;

	var iconOffset:Float;
	var curHeading:SongHeading;

	public function new(x:Float, y:Float)
	{
		super(x, y);
		bg = new FlxSprite().makeGraphic(400, 50, FlxColor.WHITE);
		add(bg);
		var songCreator:String = '';
		var songCreatorIcon:String = '';
		var headingPath:SongHeading = null;

		switch (Paths.formatToSongPath(PlayState.SONG.song))
		{
			case 'corn-theft' | 'indignancy' | 'unfairness':
				songCreator = 'MoldyGH';
			case 'blocked' | 'get-out' | 'the-phone' | 'mazeophobia':
				songCreator = 'Eren Kaya';
			case 'flintcorn':
				songCreator = 'BobbbyOfficial\nRemake by Eren Kaya';
                songCreatorIcon = 'BobbbyOfficial';
			case 'last-reality':
				songCreator = 'BobbbyOfficial & Eren Kaya';
			case 'cheating':
				songCreator = 'MoldyGH\nVoices by Eren Kaya';
				songCreatorIcon = 'MoldyGH';
			case 'exploitation':
				songCreator = 'Oxygen\nRemix by IndigoVoidigo';
			case 'kuruwa-seru':
				songCreator = 'Null_y34r';
			case 'disruption':
				songCreator = 'Sky!\nRemix by Eren Kaya\nVoices by tiledmind';
			case 'reality-breaking':
				songCreator = 'Pyramix';
			case 'traumatism':
				songCreator = 'naether';
		}
		switch (PlayState.storyWeek)
		{
            case 0 | 1 | 2 | 3:
                headingPath = {
					path: 'songHeadings/bambiHeading',
					antiAliasing: true,
					iconOffset: 0
				};
		}
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'cheating':
                headingPath = {
					path: 'songHeadings/cheatingHeading',
					antiAliasing: true,
					animation: new Animation('cheating', 'Cheating', 24, true, [false, false]),
					iconOffset: 0
				};
			case 'unfairness':
                headingPath = {
					path: 'songHeadings/unfairHeading',
					antiAliasing: true,
					animation: new Animation('unfair', 'Unfairness', 24, true, [false, false]),
					iconOffset: 0
				};
            case 'exploitation':
                headingPath = {
                    path: 'songHeadings/expungedHeading',
                    antiAliasing: true,
                    animation: new Animation('expunged', 'Expunged', 24, true, [false, false]),
                    iconOffset: 0
                };
			case 'traumatism':
				headingPath = {path: 'songHeadings/traumatismHeading', antiAliasing: false, iconOffset: 0};
		}

		switch (PlayState.SONG.player2.toLowerCase()) {
			case 'oppositionexpunged':
				headingPath = {path: 'songHeadings/oppExpungedHeading', antiAliasing: false, iconOffset: 0};
			case 'thearchyexpunged':
				headingPath = {path: 'songHeadings/oppExpungedHeading', antiAliasing: false, iconOffset: 0};
		}

		if (headingPath != null)
		{
			if (headingPath.animation == null)
			{
				bg.loadGraphic(Paths.image(headingPath.path));
			}
			else
			{
				var info = headingPath.animation;
				bg.frames = Paths.getSparrowAtlas(headingPath.path);
				bg.animation.addByPrefix(info.name, info.prefixName, info.frames, info.looped, info.flip[0], info.flip[1]);
				bg.animation.play(info.name);
			}
			bg.antialiasing = headingPath.antiAliasing;
			curHeading = headingPath;
		}
		createHeadingText('Song by ' + songCreator);
		funnyIcon = new FlxSprite(0, 0, Paths.image('songCreators/${songCreatorIcon != '' ? songCreatorIcon : songCreator}'));
		if (!Paths.fileExists('songCreators/' + newIcon, IMAGE)) {
			funnyIcon.loadGraphic(Paths.image('songCreators/none'));
		}
		rescaleIcon();
		add(funnyIcon);

		rescaleBG();

		var yValues = CoolUtil.getMinAndMax(bg.height, funnyText.height);
		funnyText.y = funnyText.y + ((yValues[0] - yValues[1]) / 2);
	}

	public function switchHeading(newHeading:SongHeading)
	{
		if (bg != null)
		{
			remove(bg);
		}
		bg = new FlxSprite().makeGraphic(400, 50, FlxColor.WHITE);
		if (newHeading != null)
		{
			if (newHeading.animation == null)
			{
				bg.loadGraphic(Paths.image(newHeading.path));
			}
			else
			{
				var info = newHeading.animation;
				bg.frames = Paths.getSparrowAtlas(newHeading.path);
				bg.animation.addByPrefix(info.name, info.prefixName, info.frames, info.looped, info.flip[0], info.flip[1]);
				bg.animation.play(info.name);
			}
		}
		bg.antialiasing = newHeading.antiAliasing;
		curHeading = newHeading;
		add(bg);

		rescaleBG();
	}

	public function changeText(newText:String, newIcon:String, rescaleHeading:Bool = true)
	{
		createHeadingText(newText);

		if (funnyIcon != null)
		{
			remove(funnyIcon);
		}
		funnyIcon = new FlxSprite(0, 0, Paths.image('songCreators/' + newIcon));
		rescaleIcon();
		add(funnyIcon);

		if (rescaleHeading)
		{
			rescaleBG();
		}
	}

	function createHeadingText(text:String)
	{
		if (funnyText != null)
		{
			remove(funnyText);
		}
		funnyText = new FlxText(1, 0, 650, text, 16);
		funnyText.setFormat('Comic Sans MS Bold', 30, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		funnyText.borderSize = 2;
		funnyText.antialiasing = true;
		add(funnyText);
	}

	public function rescaleIcon()
	{
		var offset = (curHeading == null ? 0 : curHeading.iconOffset);

		var scaleValues = CoolUtil.getMinAndMax(funnyIcon.height, funnyText.height);
		funnyIcon.setGraphicSize(Std.int(funnyIcon.height / (scaleValues[1] / scaleValues[0])));
		funnyIcon.updateHitbox();

		var heightValues = CoolUtil.getMinAndMax(funnyIcon.height, funnyText.height);
		funnyIcon.setPosition(funnyText.textField.textWidth + offset, (heightValues[0] - heightValues[1]) / 2);
	}

	function rescaleBG()
	{
		bg.setGraphicSize(Std.int((funnyText.textField.textWidth + funnyIcon.width + 0.5)), Std.int(funnyText.height + 0.5));
		bg.updateHitbox();
	}
}