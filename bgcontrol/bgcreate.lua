function initcreatebg(currentTiming, index)
    bg.setColor(255, 255, 255, 0)
    bg.setLayerName("Background")
end

function onAffCommand(timing, index)
    bg = Scene.createSprite("bgcontrol" .. tostring(index), tostring(index) .. ".jpg")
    register(bg, timing-1, 1, "initcreatebg")
end
