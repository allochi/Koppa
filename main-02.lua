require 'util'

local size = { width = 320*2, height = 480*2 }
Util:window('H 0.3', size)
viewport = Util:viewport(size)
background = Util:character({ file = 'images/paper-background.jpg', width = 320*2, height = 480*2 })
bg_layer = Util:layer(viewport, true)
bg_layer:insertProp(background)

-- Making the ball
local ball = Util:character({ file = 'images/soccer-ball.png', width = 600, height = 600, scale = 0.3})
ball.name = "Football"
-- ball:setParent(background)
ball_layer = Util:layer(viewport, true)
local partition = MOAIPartition.new()
ball_layer:setPartition(partition)
partition:insertProp(ball)

mouse = {}

function onClick(down)
  if down then
    pick = partition:propForPoint ( mouseX, mouseY )
    if pick then
      -- pick:setPriority ( priority )
      -- priority = priority + 1
      pick:moveScl ( 0.25, 0.25, 0.125, MOAIEaseType.EASE_IN )
    end
  else
    if pick then
      pick:moveScl ( -0.25, -0.25, 0.125, MOAIEaseType.EASE_IN )
      pick:moveLoc (-10, 0, 1, MOAIEaseType.EASE_IN )
      pick:moveRot (10, 1, MOAIEaseType.EASE_IN )
      pick = nil
    end
  end
end

function onMove(x,y)
  
  local oldX = mouseX
  local oldY = mouseY

  mouseX, mouseY = ball_layer:wndToWorld(x, y)

  if pick then
    pick:addLoc ( mouseX - oldX, mouseY - oldY )
  end
end

if MOAIInputMgr.device.pointer then
  MOAIInputMgr.device.pointer:setCallback(onMove)
  MOAIInputMgr.device.mouseLeft:setCallback(onClick)
end