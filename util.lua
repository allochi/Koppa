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
  local w,h = properties.width, properties.height
  gfxQuad:setRect(-w,-h,w,h)
  prop = MOAIProp2D.new()
  prop:setDeck(gfxQuad)
  -- prop:setScl(properties.scale, properties.scale)
  prop:setScl(properties.scale)


  prop.scale = properties.scale
  
  if properties.name then
    prop.name = properties.name
  else
    prop.name = "Unnamed"
  end

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