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

function Util:character(properties)
  
  if not properties.file then
    return nil -- TODO: Make a box
  end

  if not properties.scale then
    properties.scale = 1
  end

  local gfxQuad = MOAIGfxQuad2D.new()
  gfxQuad:setTexture(properties.file)
  local w,h = properties.width*properties.scale/2, properties.height*properties.scale/2
  gfxQuad:setRect(-w,-h,w,h)
  prop = MOAIProp2D.new()
  prop:setDeck(gfxQuad)
  return prop
end

function Util:layer(viewport,on)
  local layer = MOAILayer2D.new()
  layer:setViewport(viewport)
  if on then
    MOAISim.pushRenderPass(layer)
  end
  return layer
end