require 'util'

local scale = 1
local priority = 1

local size = { width = 320*scale, height = 480*scale }
Util:window('H 0.3', size)
viewport = Util:viewport(size)
background = Util:character({ file = 'images/paper-background.jpg', scale = 0.5})
bg_layer = Util:layer(viewport, true)
bg_layer:insertProp(background)

-- Make a layer and partition for the balls
local balls_layer = Util:layer(viewport, true)
local partition = MOAIPartition.new()
balls_layer:setPartition(partition)

-- Making the ball
local balls = {}
local number_of_balls = 3
for i=1,number_of_balls do
  balls[i] = Util:character({ file = 'images/soccer-ball.png', scale = 0.1, name = "Football " .. i})
  partition:insertProp(balls[i])
end

mouse = {}

function onClick(down)
  if down then
    pick = partition:propForPoint ( mouseX, mouseY )
    if pick then
     pick:setPriority ( priority )
     priority = priority + 1
     pick:moveScl ( 0.01, 0.01, 0.125, MOAIEaseType.EASE_IN )
     print(pick.name)
    end
  else
    if pick then
      pick:moveScl ( -0.01, -0.01, 0.125, MOAIEaseType.EASE_IN )
      pick:moveLoc (-10, 0, 1, MOAIEaseType.EASE_IN )
      pick:moveRot (10, 1, MOAIEaseType.EASE_IN )
      pick = nil
    end
  end
end

function onMove(x,y)
  
  local oldX = mouseX
  local oldY = mouseY

  mouseX, mouseY = balls_layer:wndToWorld(x, y)

  if pick then
    pick:addLoc ( mouseX - oldX, mouseY - oldY )
  end
end

if MOAIInputMgr.device.pointer then
  MOAIInputMgr.device.pointer:setCallback(onMove)
  MOAIInputMgr.device.mouseLeft:setCallback(onClick)
end