Util ={}

function Util:window(title, size)
  MOAISim.openWindow(title, size.width,size.height)
end

function Util:viewport(size)
  local viewport = MOAIViewport.new(size.width,size.height)
  viewport:setSize(size.width,size.height)
  viewport:setScale(size.width,size.height)
  return viewport
end

function Util:image(file, size)
  local gfxQuad = MOAIGfxQuad2D.new ()
  gfxQuad:setTexture(file)
  local w,h = size.width/2, size.height/2
  gfxQuad:setRect(-w,-h,w,h)
  prop = MOAIProp2D.new ()
  prop:setDeck(gfxQuad)
  return {image = gfxQuad, prop = prop}
end

function Util:layer(viewport,on)
  local layer = MOAILayer2D.new()
  layer:setViewport(viewport)
  if on then
    MOAISim.pushRenderPass(layer)
  end
  return layer
end

local size = { width = 320*2, height = 480*2 }
Util:window('H 0.3', size)
viewport = Util:viewport(size)
bg_image = Util:image('paper-background.jpg',size)
bg_layer = Util:layer(viewport,true)
bg_layer:insertProp(bg_image.prop)

function onClick()
  MOAISim.removeRenderPass(bg_layer)  
end

MOAIInputMgr.device.mouseLeft:setCallback(onClick)