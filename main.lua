require 'util'

local size = { width = 320*2, height = 480*2 }
Util:window('H 0.3', size)
viewport = Util:viewport(size)
bg_character = Util:character({ file = 'images/paper-background.jpg', scale = 0.5 })
bg_layer = Util:layer(viewport,true)
bg_layer:insertProp(bg_character)

function onClick()
  MOAISim.removeRenderPass(bg_layer)  
end

MOAIInputMgr.device.mouseLeft:setCallback(onClick)