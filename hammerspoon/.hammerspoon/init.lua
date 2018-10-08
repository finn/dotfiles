local alert_duration = 0.75
local win_move_increment = 64

-- move window up
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - win_move_increment
  win:setFrame(f)
end)

-- move window left
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - win_move_increment
  win:setFrame(f)
end)

-- move window right
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + win_move_increment
  win:setFrame(f)
end)

-- move window down
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + win_move_increment
  win:setFrame(f)
end)

-- window to left half of screen
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)

  hs.alert.show("window: left", alert_duration)
end)

-- window to right half of screen
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)

  hs.alert.show("window: right", alert_duration)
end)

-- center window on screen
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "'", function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()

  win:centerOnScreen(screen, true, 0)

  hs.alert.show("window: center", alert_duration)
end)

-- maximize window on screen
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "return", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = max.w
  f.h = max.h
  win:setFrameInScreenBounds(f, 0)

  hs.alert.show("window: max", alert_duration)
end)


-- reload hs config
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
--   hs.reload()
--   hs.alert.show("hs config reloaded", alert_duration)
-- end)
