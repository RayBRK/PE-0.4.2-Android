function onCreate()

    makeLuaSprite('theground','Ground', -300,500)
    addLuaSprite('theground',false)
    setLuaSpriteScrollFactor('theground', 0.8, 0.8);

    close(true)
end

function onBeatHit( ... )--for every beat
    -- body
end

function onStepHit( ... )-- for every step
    -- body
end

function onUpdate( ... )
    -- body
end

