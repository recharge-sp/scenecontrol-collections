function onAffCommand(timing, unknownfloat, hide)
    notes = getNoteGroup()
    register(notes, timing-1, 1, "initHide")
    register(notes, timing, 1, "hide")
end

function initHide(currentTiming, unknownfloat, hide)
    if hide < 1 then
        notes.setActive(false)
    else
        notes.setActive(true)
    end
end

function hide(currentTiming, unknownfloat, hide)
    if hide < 1 then
        notes.setActive(true)
    else
        notes.setActive(false)
    end
end
