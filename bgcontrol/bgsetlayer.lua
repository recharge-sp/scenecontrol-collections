function initsetlayerbg(currentTiming, index, layer)
    bg.setLayerOrder(layer)
end

function onAffCommand(timing, index, layer)
    bg = Scene.getSprite("bgcontrol" .. tostring(index))
    register(bg, timing-1, 1, "initsetlayerbg")
end
