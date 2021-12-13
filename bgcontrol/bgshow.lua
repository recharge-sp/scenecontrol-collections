function showbg(currentTiming, index, duration)
    if currentTiming > BaseTiming then
        local p = (currentTiming - BaseTiming) / duration
        local alpha = math.floor(Ease.Linear(0, 255, p))
        bg.setColor(255, 255, 255, alpha)
    end
end

function initshowbg(currentTiming, index, duration)
    bg.setColor(255, 255, 255, 0)
end

function onAffCommand(timing, index, duration)
    bg = Scene.getSprite("bgcontrol" .. tostring(index))
    register(bg, timing-1, 1, "initshowbg")
    register(bg, timing, duration, "showbg")
end
