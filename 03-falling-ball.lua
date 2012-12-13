require 'util'

local scale = 1
local priority = 1

local size = { width = 640, height = 960 }
Util:window('Falling Ball', size)
viewport = Util:viewport(size)

-- Make a layer and partition for the balls
local balls_layer = Util:layer(viewport, true)
local partition = MOAIPartition.new()
-- balls_layer:setPartition(partition)

-- Making the ball
local ball = Util:character({ file = 'images/soccer-ball.png', width = 600, height = 600, scale = 0.1, name = "Football"})
partition:insertProp(ball)


-- Setup 2D World
local world = MOAIBox2DWorld.new ()
world:setGravity ( 0, -10)
world:setUnitsToMeters ( 0.1 )
world:start ()
balls_layer:setBox2DWorld ( world )


-- Setup Physics Box
body = world:addBody ( MOAIBox2DBody.DYNAMIC )
body:setAngularVelocity(2)

-- Box of the physics boundary
-- poly = {
--   0, -75,
--   75, 0,
--   0, 75,
--   -75, 0,
-- }

-- fixture = body:addPolygon ( poly )
fixture = body:addCircle( 260, 420, 60 )
fixture:setDensity ( 1 )
fixture:setFriction ( 0 )
fixture:setRestitution( 0.7 )
fixture:setFilter ( 0x01 )
fixture:setCollisionHandler ( onCollide, MOAIBox2DArbiter.BEGIN + MOAIBox2DArbiter.END, 0x02 )

body:resetMassData ()
body:applyAngularImpulse ( 2 )
-- ball:setParent ( body )

-- adding ground
-- local ground_layer = Util:layer(viewport, true)
-- local ground = Util:character({ name = "ground", scale = 0.7, file = "images/ground.png", width = 480, height = 86 })
-- ground_layer:insertProp(ground)
-- ground:setLoc(0,-420)
ground_body     = world:addBody(MOAIBox2DBody.STATIC)
ground_fixture  = ground_body:addRect(-size.width/2, -size.height/2,size.width/2+1,40-size.height/2)
ground_fixture:setFilter ( 0x02 )
ground_fixture:setLoc(0,-200)


-- ground:setParent(ground_body)






-- Input Manager

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