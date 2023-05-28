function onCreate()
	makeLuaSprite('bg', 'backgrounds/shared/sky_night', -600, -200)
	setScrollFactor('bg', 0.6, 0.6)
	addLuaSprite('bg')

	makeLuaSprite('flatgrass', 'backgrounds/farm/gm_flatgrass', 350, 75)
	setScrollFactor('flatgrass', 0.65, 0.65)
	scaleObject('flatgrass', 0.34, 0.34)
	updateHitbox('flatgrass')
	addLuaSprite('flatgrass')

	makeLuaSprite('hills', 'backgrounds/farm/orangey hills', -173, 100)
	setScrollFactor('hills', 0.65, 0.65)
	addLuaSprite('hills')

	makeLuaSprite('farmHouse', 'backgrounds/farm/funfarmhouse', 100, 125)
	setScrollFactor('farmHouse', 0.7, 0.7)
	scaleObject('farmHouse', 0.9, 0.9)
	updateHitbox('farmHouse')
	addLuaSprite('farmHouse')

	makeLuaSprite('grassLand', 'backgrounds/farm/grass lands', -600, 500)
	addLuaSprite('grassLand')

	makeLuaSprite('cornFence', 'backgrounds/farm/cornFence', -400, 200)
	addLuaSprite('cornFence')

	makeLuaSprite('cornFence2', 'backgrounds/farm/cornFence2', 1100, 200)
	addLuaSprite('cornFence2')

	makeLuaSprite('cornBag', 'backgrounds/farm/cornbag', 1200, 550)
	addLuaSprite('cornBag')

	makeLuaSprite('sign', 'backgrounds/farm/sign', 0, 350)
	addLuaSprite('sign')
end

function onUpdate()
	setProperty('boyfriend.color', 0x878787)
	setProperty('gf.color', 0x878787)
	setProperty('dad.color', 0x878787)

	setProperty('flatgrass.color', 0x878787)
	setProperty('hills.color', 0x878787)
	setProperty('farmHouse.color', 0x878787)
	setProperty('grassLand.color', 0x878787)
	setProperty('cornFence.color', 0x878787)
	setProperty('cornFence2.color', 0x878787)
	setProperty('cornBag.color', 0x878787)
	setProperty('sign.color', 0x878787)

	if not mustHitSection then
		cameraTarget('dad')
	end
end