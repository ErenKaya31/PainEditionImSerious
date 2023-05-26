function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'phone' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_phone'); --Change texture
            scaleObject('unspawnNotes', 0.8, 0.8)
            setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023'); --Default value is: 0.023, health gained on hit
            setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.07'); --Default value is: 0.0475, health lost on miss
            setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);

            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
            end
        end
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'phone' then
	characterPlayAnim('dad', 'singThrow', 24, true)
	characterPlayAnim('boyfriend', 'dodge', 24, true)
    elseif noteType == 'phone' and dadName == 'bambi-angey' then
	characterPlayAnim('dad', 'throw', 24, true)
	characterPlayAnim('boyfriend', 'dodge', 24, true)
    end
end

function noteMiss(id, noteData, noteType, isSustainNote)
    if noteType == 'phone' then
	characterPlayAnim('dad', 'singThrow', 24, true)
	characterPlayAnim('boyfriend', 'hurt', 24, true)
	setPropertyFromGroup('playerStrums', noteData, 'alpha', 0.01)
	noteTweenAlpha('s', noteData, 1, 7, 'expoIn')
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'phone' then
		characterPlayAnim('dad', 'singSmash', 24, true)
	end
end