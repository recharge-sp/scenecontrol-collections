function onAffCommand(timing, durationInSeconds, alpha)
    track = Scene.getSprite("Track")
    OldAlpha = track.getColorAt(timing).a
    divideLine01 = Scene.getSprite("DivideLine01")
    divideLine12 = Scene.getSprite("DivideLine12")
    divideLine23 = Scene.getSprite("DivideLine23")
    divideLineReverse01 = Scene.getSprite("DivideLineReverse01")
    divideLineReverse12 = Scene.getSprite("DivideLineReverse12")
    divideLineReverse23 = Scene.getSprite("DivideLineReverse23")
    darkenbg = Scene.getSprite("darkenbg")
    DarkenOldAlpha = darkenbg.getColorAt(timing).a
    duration = durationInSeconds * 1000
    if durationInSeconds <= 0 then duration = 1000 end
    register(track, timing, duration, "trackDisplay")
    darkenAlpha = 255
    if alpha == 255 then darkenAlpha = 0 end
    register(darkenbg, timing, 250, "darkenDisplay")
end

function trackDisplay(currentTiming, durationInSeconds, alpha)
    local p = (currentTiming - BaseTiming) / duration
    local a = Ease.Linear(OldAlpha, alpha, p)
    track.setColor(255, 255, 255, a)
    divideLine01.setColor(255, 255, 255, a)
    divideLine12.setColor(255, 255, 255, a)
    divideLine23.setColor(255, 255, 255, a)
    divideLineReverse01.setColor(255, 255, 255, a)
    divideLineReverse12.setColor(255, 255, 255, a)
    divideLineReverse23.setColor(255, 255, 255, a)
end

function darkenDisplay(currentTiming, durationInSeconds, alpha)
    local p = (currentTiming - BaseTiming) / 250
    darkenbg.setColor(0, 0, 0, Ease.Linear(DarkenOldAlpha, darkenAlpha, p))
end
