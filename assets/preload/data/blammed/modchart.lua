local l1 = false
local l1c = false
local l2 = false
local l3 = false
local b1 = false
local b2 = false
local ex1 = false
local l11 = false
local swaybg = false
local swayingForce = 1;
local wbfb = false
local waitForTween = false
local move = false
local camerabeat = false

function beatHit (beat)
    if wbfb then
	    waitForBeat = false
    end
    if camerabeat then
        setCamZoom(1)
    end
end

function resetTween()
	waitForTween = false
end

function setDefault(id)
	move = true
	swayingForce = 0
	_G['defaultStrum'..id..'X'] = getActorX(id)
	print('angle 0')
	setActorAngle(0,id)
end

function update (elapsed)
    local currentBeat = (songPos / 1000)*(bpm/60)
	if l1 then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 36 * math.sin((currentBeat + i*0.32)), i)
		end
	end
    if l1c then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 140 * math.sin((currentBeat + i*0.25)), i)
		end
	end
    if l11 then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin(currentBeat * math.pi + i*0.32),i)
            setActorY(_G['defaultStrum'..i..'Y'] + 64 * math.cos(currentBeat * math.pi + i*0.24),i)
		end
	end
    if l2 then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 72 * math.sin((currentBeat + i*0.30)), i)
		end
	end
    if l3 then
        for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 137 * math.sin((currentBeat + i*0.20)), i)
		end
	end
    if b1 then
        for i=0,7 do
            setActorY(defaultStrum0Y + 32 * math.cos((currentBeat + i*0.10) * math.pi), i)
            setActorX(_G['defaultStrum'..i..'X'] + 28 * math.sin((currentBeat + i*0)), i)
        end
    end
    if b2 then
        for i=0,7 do
            setActorY(defaultStrum0Y + 64 * math.cos((currentBeat + i*0.18) * math.pi), i)
            setActorX(_G['defaultStrum'..i..'X'] + 42 * math.sin((currentBeat + i*0.10)), i)
        end
    end
    if ex1 then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 12 * math.sin((currentBeat + i*0.08) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 58 * math.cos((currentBeat + i*0.06) * math.pi), i)
		end
	end
    if swaybg then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 16 * math.cos((currentBeat + i*5) * math.pi) ,i)
		end
	end
end

function stepHit (step)
    if step == 1 then
       swayingForce = 4;
       l1 = true
	end
    if step == 750 then
        strumLine1Visible = false
        showOnlyStrums = true
        l2 = false
        l1c = true
        for i = 4, 7 do -- go to the center
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 275,getActorAngle(i) + 360, 0.1, 'setDefault')
        end
     end
     if step == 1030 then
        showOnlyStrums = true
        l2 = true
        l1c = false
        l1 = false
        l11 = false
        b1 = false
        for i = 4, 7 do -- go to the default place
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 290,getActorAngle(i) + 360, 0.1, 'setDefault')
        end
     end
     if step == 1279 then
        showOnlyStrums = false
        strumLine1Visible = true
        l2 = false
        l1 = false
        l3 = true
        b1 = false
        camerabeat = true
     end
     if step == 1794 then
        showOnlyStrums = true
        strumLine1Visible = true
        l2 = false
        l1 = false
        l3 = false
        b1 = true
        camerabeat = false
     end
     if step == 2055 then
        showOnlyStrums = false
        strumLine1Visible = true
        l2 = false
        l1 = false
        l3 = false
        b1 = false
        b2 = true
     end
     if step == 2428 then
        showOnlyStrums = true
        strumLine1Visible = false
        l2 = false
        l1 = false
        l3 = false
        b1 = false
        b2 = false
        ex1 = false
        swaybg = true
        camerabeat = true
     end
     if step == 2687 then
        showOnlyStrums = true
        strumLine1Visible = true
     end
     if step == 2954 then
        showOnlyStrums = false
        strumLine1Visible = true
        ex1 = false
        swaybg = false
        camerabeat = false
     end
    if curStep == 30 or curStep == 75 or curStep == 115 or curStep == 146 or curStep == 177 or curStep == 160 or curStep == 194 or curStep == 240 or curStep == 286 or curStep == 320 or curStep == 365 or curStep == 388 or curStep == 415 or curStep == 445 or curStep == 480 or curStep == 525 or curStep == 560 or curStep == 595 or curStep == 636 or curStep == 665 or curStep == 690 or curStep == 730 then
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.6, 'setDefault')
        end
    end
end