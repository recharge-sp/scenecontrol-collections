function onAffCommand(timing, durationInSeconds, alpha)
  arcahv_debris = Scene.getSprite("arcahv-debris")
  oldAlpha = arcahv_debris.getColorAt(timing).a
  duration = durationInSeconds * 1000
  register(Scene.getSprite("antilock"), 0, 600000, "movedebris")
  register(arcahv_debris, timing, duration, "showfadedebris")
end

function movedebris(timing, durationInSeconds, alpha)
  local x = ((timing%60)/10) - 3
  arcahv_debris.setTranslation(x,150,0)
end

function showfadedebris(timing, durationInSeconds, alpha)
  local p = (timing-BaseTiming) / duration
  arcahv_debris.setColor(255, 255, 255, Ease.Linear(oldAlpha, alpha, p))
end
