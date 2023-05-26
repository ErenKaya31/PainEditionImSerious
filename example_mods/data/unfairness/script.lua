valueY = 15
valueScale = 0.05
mathValue = math.sin
value2 = 0.25

function onUpdate(elapsed)
	songPos = getSongPosition()
    	currentBeat = (songPos / 1000)*(bpm/60) + elapsed

	for i=0,3 do
		setPropertyFromGroup('playerStrums', i, 'x', 550 - 400 * math.sin((currentBeat + i*value2)), i) 
		setPropertyFromGroup('playerStrums', i, 'y', 250 - 250 * math.cos((currentBeat + i*value2)), i) 

		setPropertyFromGroup('opponentStrums', i, 'x', 550 - 400 * math.cos((currentBeat + i*value2)), i) 
		setPropertyFromGroup('opponentStrums', i, 'y', 250 - 250 * math.sin((currentBeat + i*value2)), i) 
	end
end