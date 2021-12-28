FADE_DURATION=500

function fadeintutorial(timing, duration, atbottom, ...)
    local currentTiming = timing
    if currentTiming > BaseTiming then
        local p = (currentTiming - BaseTiming) / FADE_DURATION
        local alpha = math.floor(Ease.OutQuad(0, 255, p))
        bg.setColor(255, 255, 255, alpha)
        text.setAlpha(alpha)
    end
end

function fadeouttutorial(timing, duration, atbottom, ...)
    local currentTiming = timing
    local realBaseTiming = BaseTiming + duration
    if currentTiming > realBaseTiming then
        local p = (currentTiming - realBaseTiming) / FADE_DURATION
        local alpha = math.floor(Ease.InQuad(255, 0, p))
        bg.setColor(255, 255, 255, alpha)
        text.setAlpha(alpha)
    end
end

function inttutorial(timing, duration, atbottom, ...)
    bg.setColor(255, 255, 255, 0)
    bg.setLayerName("Topmost")
    bg.setLayerOrder(100)
    bg.setTranslation(0, 50 + 300 * (-1)^atbottom, 0)
    inputstr = ""
    for i,v in ipairs({...}) do
        inputstr = inputstr .. string.char(v)
    end
    text.setAlpha(0)
    text.setLayerName("Topmost")
    text.setLayerOrder(200)
    text.setText(inputstr)
    text.setTranslation(0, 24 + 50 + 300 * (-1)^atbottom, 0)
end

function onAffCommand(timing, duration, atbottom, ...)
    bg = Scene.createSprite("bg" .. EventID, "tutorial_back.png")
    text = Scene.createText("text" .. EventID, -1, -1, 48, 1.25, "MiddleCenter", true)
    register(bg, timing-1, 1, "inttutorial")
    register(text, timing-1, 1, "inttutorial")
    register(bg, timing, FADE_DURATION, "fadeintutorial")
    register(text, timing, FADE_DURATION, "fadeintutorial")
    register(bg, timing, FADE_DURATION, "fadeouttutorial")
    register(text, timing+duration, FADE_DURATION, "fadeouttutorial")
end
