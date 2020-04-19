local conf = require 'conf'

M = {}

M.init = function()
  M.world = {}
  M.turnframes = 60
  M.setrandom()
  M.relaxframes = M.turnframes
  M.update_canvas()

  M.golcanvas = love.graphics.newCanvas(
    conf.worldcols, conf.worldrows
    --conf.screen_width, conf.screen_height
  )

  local pixelcode = [[
    vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords )
    {
        vec4 texcolor = Texel(tex, texture_coords);
        return texcolor * color;
    }
  ]]
  M.golshader = love.graphics.newShader(pixelcode, vertexcode)

end

M.draw = function()
  if M.golcanvas
  then
    love.graphics.clear(0, 0, 0, 0)
    love.graphics.draw(M.golcanvas, 0, 0, 0, conf.tilew, conf.tilew)
  end
  love.graphics.print("hello",10,10)
end

M.update = function()
  M.relaxframes = M.relaxframes - 1
  if M.relaxframes == 0
  then
    M.setrandom()
    M.relaxframes = M.turnframes
    M.update_canvas()
  end
end

M.update_canvas = function()
  love.graphics.setCanvas(M.golcanvas)
  love.graphics.setShader(shader)
  love.graphics.clear(0, 0, 0, 0)
  for r, worldrow in ipairs(M.world)
  do
    for c, v in ipairs(worldrow)
    do
      love.graphics.setColor(0.3*v, 0.6*v, v, 1)  -- important to reset
      love.graphics.rectangle(
        "fill",
        --(c-1)*conf.tilew,
        --(r-1)*conf.tilew,
        --conf.tilew,
        --conf.tilew
        (c-1),
        (r-1),
        1,
        1
      )
    end
  end
  love.graphics.setColor(1,1,1,1) -- important reset
  love.graphics.setShader()
  love.graphics.setCanvas()
end

M.setrandom = function()
  for r = 1, conf.worldrows, 1
  do
    M.world[r]={}
    for c = 1, conf.worldcols, 1
    do
      M.world[r][c] = love.math.random(0, 1)
    end
  end
end

M.turn = function()
end

return M
