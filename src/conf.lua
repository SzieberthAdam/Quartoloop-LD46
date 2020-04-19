local M = {}

M.tilew = 2
M.worldcols = (4-M.tilew)*142
M.worldrows = (4-M.tilew)*89

M.cardrows = 64
M.cardcols = 64
M.ncards = 4

M.screen_width = 640
M.screen_height = 360

M.refresh_rate = 60
M.max_update_frames = 10
M.loop_relax = 0.005

function love.conf(t)
  t.console = true
  -- The window title (string)
  t.window.title = "GOLKIA LD46"
  -- Filepath to an image to use as the window's icon (string)
  t.window.icon = nil
  -- The window width (number)
  t.window.width = M.screen_width
  -- Enable fullscreen (boolean)
  t.window.fullscreen = false
  -- The window height (number)       -- Remove all border visuals from the window (boolean)
  t.window.height = M.screen_height
  -- Let the window be user-resizable (boolean)
  t.window.resizable = true
  -- Minimum window width if the window is resizable (number)
  t.window.minwidth = M.screen_width
  -- Minimum window height if the window is resizable (number)
  t.window.minheight = M.screen_height
end


return M
