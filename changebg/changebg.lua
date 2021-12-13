function changebg(currentTiming, duration, index)
    if currentTiming > BaseTiming then
        local p = (currentTiming - BaseTiming) / duration
        local alpha = math.floor(Ease.Linear(0, 255, p))
        bg.setColor(255, 255, 255, alpha)
    end
end

function initbg(currentTiming, duration, index)
    local alpha = (active == 1) and 255 or 0
    bg.setColor(255, 255, 255, alpha)
end

function onAffCommand(timing, duration, index)
    bg = Scene.createSprite(tostring(index) .. EventID, tostring(index) .. ".jpg")
    register(bg, timing-1, 1, "initbg")
    register(bg, timing, duration, "changebg")
end
