-- reload config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)

local MOVE_SIZE = 50

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - MOVE_SIZE
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + MOVE_SIZE
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - MOVE_SIZE
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + MOVE_SIZE
  win:setFrame(f)
end)

local hotkey = require 'hs.hotkey'
local window = require 'hs.window'

hotkey.bind({"cmd", "alt", "ctrl"}, "A", function()
  local win = window.focusedWindow()
  if win ~= nil then
    win:setFullScreen(not win:isFullScreen())
  end
end)

-- https://github.com/tstirrat/hammerspoon-config/blob/master/modules/fullscreen.lua

hs.alert.show("Config loaded")


