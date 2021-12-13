function hidebg(currentTiming, index, duration)
    if currentTiming > BaseTiming then
        local p = (currentTiming - BaseTiming) / duration
        local alpha = math.floor(Ease.Linear(255, 0, p))
        bg.setColor(255, 255, 255, alpha)
    end
end

function inithidebg(currentTiming, index, duration)
    bg.setColor(255, 255, 255, 255)
end

function onAffCommand(timing, index, duration)
    bg = Scene.getSprite("bgcontrol" .. tostring(index))
    register(bg, timing-1, 1, "inithidebg")
    register(bg, timing, duration, "hidebg")
end
