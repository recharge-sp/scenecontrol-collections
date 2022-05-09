function onAffCommand(timing, dur, destAlpha)
    UIPause = Scene.getUIPause()
    UIInfo = Scene.getUIInfo()
    UIPauseAlpha = UIPause.getColorAt(timing).a
    UIInfoAlpha = UIInfo.getColorAt(timing).a
    duration = dur * 1000
    if dur == 0 then duration = 1000 end
    register(UIPause, timing, duration, "setAlpha")
    register(UIInfo, timing, duration, "setAlpha")
end

function setAlpha(timing, dur, destAlpha)
    local p = (timing - BaseTiming) / duration
    UIPause.setColor(255, 255, 255, Ease.Linear(UIPauseAlpha,destAlpha, p))
    UIInfo.setColor(255, 255, 255, Ease.Linear(UIInfoAlpha,destAlpha, p))
end
