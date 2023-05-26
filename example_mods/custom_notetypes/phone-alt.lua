function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'phone-alt' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_phone'); --Change texture
            setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023'); --Default value is: 0.023, health gained on hit
            setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.0475'); --Default value is: 0.0475, health lost on miss
            setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);

            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
            end
        end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'phone-alt' and direction == 0 then
		characterPlayAnim('dad', 'singLEFT-alt', 24, true)
	elseif noteType == 'phone-alt' and direction == 3 then
		characterPlayAnim('dad', 'singRIGHT-alt', 24, true)
	end
end