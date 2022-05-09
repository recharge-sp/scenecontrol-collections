function onAffCommand(timing, durationInSeconds, alpha)
  arcahv_srt = Scene.getSprite("arcahv-srt")
  oldAlpha = arcahv_srt.getColorAt(timing).a
  duration = durationInSeconds * 1000
  register(arcahv_srt, timing, duration, "show")
end

function show(timing, durationInSeconds, alpha)
  local p = (timing - BaseTiming) / duration
  arcahv_srt.setColor(255, 255, 255, Ease.Linear(oldAlpha, alpha, p))
end
