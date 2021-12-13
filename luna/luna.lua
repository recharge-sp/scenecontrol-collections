-- [[ config ]] --

DARKEN_DELAY = 1000
DARKEN_ALPHA = 255
DARKEN_R = 0
DARKEN_G = 0
DARKEN_B = 0
SHOW_TIMING = 500
HIDE_TIMING = 500
MOVE_TIMING = 5000
MOVE_THRESHOLD = 10
CHAR_SCALE = 2
X_OFFSET = 0
Y_OFFSET = -800
HIDE_AFTER_END = false
MOVE_UP_AFTER_SHOW_TRACK = true
Y_OFFSET_AFTER_SHOWTRACK = -600
BIG_AF_VALUE = 777777

-- [[ end of config ]] --


function initChar(timing, duration)
    char.setColor(255, 255, 255, 0)
    char.setLayerOrder(-2)
    char.setScale(CHAR_SCALE, CHAR_SCALE, 0)
end

function showChar(timing, duration)
    local CommandTiming = BaseTiming-SHOW_TIMING
    if timing > CommandTiming then
        local p = (timing - CommandTiming) / SHOW_TIMING
        local y = Ease.Linear(64+Y_OFFSET, -MOVE_THRESHOLD+Y_OFFSET, p)
        local a = Ease.OutSine(0, 255, p)
        char.setColor(255, 255, 255, a)
        char.setTranslation(X_OFFSET, y, 0)
    end
end

function moveChar(timing, duration)
    if timing > BaseTiming then
        local p = ((timing - BaseTiming)%MOVE_TIMING) / MOVE_TIMING * 2
        local y = Y_OFFSET
        if p <= 1 then
            y = y + Ease.InOutSine(-MOVE_THRESHOLD, MOVE_THRESHOLD, p)
        else
            y = y + Ease.InOutSine(MOVE_THRESHOLD, -MOVE_THRESHOLD, p-1)
        end
        char.setTranslation(X_OFFSET, y, 0)
    end
end

function hideChar(timing, duration)
    local CommandTiming = BaseTiming+duration
    if timing > CommandTiming then
        local oldy = char.getTranslationAt(CommandTiming).y
        local p = (timing - CommandTiming) / HIDE_TIMING
        local y = Ease.Linear(oldy, 64+Y_OFFSET, p)
        local a = Ease.OutSine(255, 0, p)
        char.setColor(255, 255, 255, a)
        char.setTranslation(X_OFFSET, y, 0)
    end
end

function moveChar2(timing, duration)
    local CommandTiming = BaseTiming+duration+HIDE_TIMING
    if timing > BaseTiming then
        local p = ((timing - BaseTiming)%MOVE_TIMING) / MOVE_TIMING * 2
        local y = Y_OFFSET_AFTER_SHOWTRACK
        if p <= 1 then
            y = y + Ease.InOutSine(-MOVE_THRESHOLD, MOVE_THRESHOLD, p)
        else
            y = y + Ease.InOutSine(MOVE_THRESHOLD, -MOVE_THRESHOLD, p-1)
        end
        char.setTranslation(X_OFFSET, y, 0)
    end
end

function moveupChar(timing, duration)
    local CommandTiming = BaseTiming+duration
    if timing > CommandTiming then
        local oldy = char.getTranslationAt(CommandTiming).y
        local p = (timing - CommandTiming) / HIDE_TIMING
        local y = Ease.Linear(oldy, Y_OFFSET_AFTER_SHOWTRACK-MOVE_THRESHOLD, p)
        char.setTranslation(X_OFFSET, y, 0)
    end
end

function initHideTrack(currentTiming, duration)
    sprites = { 
        Scene.getSprite("Track"),
        Scene.getSprite("DivideLine01"),
        Scene.getSprite("DivideLine12"),
        Scene.getSprite("DivideLine23"),
    }
    for _, sprite in pairs(sprites) do
        sprite.setColor(255, 255, 255, 255)
    end
    darken.setLayerOrder(-1)
    darken.setColor(DARKEN_R, DARKEN_G, DARKEN_B, 0)
end

function hideTrack(currentTiming, duration)
    local CommandTiming = BaseTiming-SHOW_TIMING
    local DarkenTiming = CommandTiming+DARKEN_DELAY
    if currentTiming > CommandTiming then
        local p = (currentTiming - CommandTiming) / SHOW_TIMING
        local dp = (currentTiming - DarkenTiming) / SHOW_TIMING
        local track_alpha = math.floor(Ease.Linear(255, 0, p))
        local darken_alpha = math.floor(Ease.Linear(0, DARKEN_ALPHA, dp))
        sprites = { 
            Scene.getSprite("Track"),
            Scene.getSprite("DivideLine01"),
            Scene.getSprite("DivideLine12"),
            Scene.getSprite("DivideLine23"),
        }
        for _, sprite in pairs(sprites) do
            sprite.setColor(255, 255, 255, track_alpha)
        end
        darken.setColor(DARKEN_R, DARKEN_G, DARKEN_B, darken_alpha)
    end
end

function showTrack(currentTiming, duration)
    local CommandTiming = BaseTiming+duration
    if currentTiming > CommandTiming then
        local p = (currentTiming - CommandTiming) / HIDE_TIMING
        local track_alpha = math.floor(Ease.Linear(0, 255, p))
        local darken_alpha = math.floor(Ease.Linear(DARKEN_ALPHA, 0, p))
        sprites = { 
            Scene.getSprite("Track"),
            Scene.getSprite("DivideLine01"),
            Scene.getSprite("DivideLine12"),
            Scene.getSprite("DivideLine23"),
        }
        for _, sprite in pairs(sprites) do
            sprite.setColor(255, 255, 255, track_alpha)
        end
        darken.setColor(DARKEN_R, DARKEN_G, DARKEN_B, darken_alpha)
    end
end

function onAffCommand(timing, duration)
    char = Scene.createSprite("char" .. EventID, "char.png")
    darken = Scene.createSprite("darken" .. EventID, "bg_darken.png")
    register(char, timing-SHOW_TIMING-1, 1, "initChar")
    register(darken, timing-SHOW_TIMING-1, 1, "initHideTrack")
    register(char, timing-SHOW_TIMING, SHOW_TIMING, "showChar")
    register(darken, timing-SHOW_TIMING, SHOW_TIMING+DARKEN_DELAY, "hideTrack")
    register(darken, timing+duration, HIDE_TIMING, "showTrack")
    if HIDE_AFTER_END then
        register(char, timing, duration, "moveChar")
        register(char, timing+duration, HIDE_TIMING, "hideChar")
    else
        if MOVE_UP_AFTER_SHOW_TRACK then
            register(char, timing, duration, "moveChar")
            register(char, timing+duration+HIDE_TIMING, BIG_AF_VALUE, "moveChar2")
            register(char, timing+duration, HIDE_TIMING, "moveupChar")
        else
            register(char, timing, BIG_AF_VALUE, "moveChar")
        end
    end
end
