function onAffCommand(timing)
    track = Scene.getSprite("Track")
    BaseAlpha = track.getColorAt(timing).a
    criticalLine = Scene.getSprite("CriticalLine")
    divideLine01 = Scene.getSprite("DivideLine01")
    divideLine12 = Scene.getSprite("DivideLine12")
    divideLine23 = Scene.getSprite("DivideLine23")
    divideLineReverse01 = Scene.getSprite("DivideLineReverse01")
    divideLineReverse12 = Scene.getSprite("DivideLineReverse12")
    divideLineReverse23 = Scene.getSprite("DivideLineReverse23")
    darkenbg = Scene.getSprite("darkenbg")
    register(track, timing, 2000, "hideTrack")
end

function hideTrack(currentTiming)
    local duration = 1000
    local p = (currentTiming - BaseTiming) / duration
    track.setColor(255, 255, 255, Ease.Linear(BaseAlpha, 255, p))
    criticalLine.setColor(255, 255, 255, Ease.Linear(BaseAlpha, 255, p))
    divideLine01.setColor(255, 255, 255, Ease.Linear(BaseAlpha, 255, p))
    divideLine12.setColor(255, 255, 255, Ease.Linear(BaseAlpha, 255, p))
    divideLine23.setColor(255, 255, 255, Ease.Linear(BaseAlpha, 255, p))
    divideLineReverse01.setColor(255, 255, 255, Ease.Linear(BaseAlpha, 255, p))
    divideLineReverse12.setColor(255, 255, 255, Ease.Linear(BaseAlpha, 255, p))
    divideLineReverse23.setColor(255, 255, 255, Ease.Linear(BaseAlpha, 255, p))
    local pd = (currentTiming - BaseTiming) / 250
    darkenbg.setColor(0, 0, 0, Ease.Linear(255-BaseAlpha, 0, pd))
end
