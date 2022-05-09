function onAffCommand(timing, duration, _unused)
  redline = Scene.createSprite("redline"..EventID, "redline.png")
  redline.setLayerName("Background")
  redline.setScale(2000, 0.5, 1)
  math.random(); math.random(); math.random()
  redline.setTranslation(0, math.random(-420, 420) + math.random(), 0)
  redline.setLayerOrder(3)
  register(redline, 0, 1, "hideredline")
  register(redline, timing, 1, "showredline")
  register(redline, timing+(duration*1000), 1, "hideredline")
end

function hideredline(timing, duration, _unused)
  redline.setActive(false)
end

function showredline(timing, duration, _unused)
  redline.setActive(true)
end
