function initsetlayerbg(currentTiming, index, layer)
    bg.setLayerOrder(layer)
end

function onAffCommand(timing, index, layer)
    bg = Scene.createSprite("bgcontrol" .. tostring(index), tostring(index) .. ".jpg")
    register(bg, timing-1, 1, "initsetlayerbg")
end
