size = { width = 640, height = 640}
MOAISim.openWindow("Understand Coordinates", size.width, size.height)


local viewport = MOAIViewport.new()
viewport:setSize(size.width, size.height)
viewport:setScale(size.width, size.height)

local layer_bg = MOAILayer2D.new()
layer_bg:setViewport(viewport)
MOAISim.pushRenderPass(layer_bg)
local deck_bg = MOAIGfxQuad2D.new()
deck_bg:setTexture("images/gradient-wallpaper.jpg")
deck_bg:setRect(-1920/3,-1080/3,1920/3,1080/3)
local prop_bg = MOAIProp2D.new()
prop_bg:setDeck(deck_bg)
layer_bg:insertProp(prop_bg)

local layer = MOAILayer2D.new()
layer:setViewport(viewport)
MOAISim.pushRenderPass(layer)

local deck = MOAIGfxQuad2D.new()
deck:setTexture("images/ga3ga3.png")
deck:setRect(-255,-255,255,255)
local prop = MOAIProp2D.new()
prop:setDeck(deck)
-- prop:setLoc ( -size.width/2, size.height/2)
layer:insertProp(prop)

local layer2 = MOAILayer2D.new()
layer2:setViewport(viewport)
layer2:setLoc(-size.width,0)
MOAISim.pushRenderPass(layer2)

local deck2 = MOAIGfxQuad2D.new()
deck2:setTexture("images/ga3ga3-2.png")
deck2:setRect(-255,-255,255,255)
local prop2 = MOAIProp2D.new()
prop2:setDeck(deck2)
layer2:insertProp(prop2)

-- layer:moveLoc(size.width,0,3)
-- layer2:moveLoc(size.width,0,3)

function onKeyboardEvent(key, down)
  if down then
    print(key.." down")
    if key == 115 then
      layer:moveLoc(size.width,0,1)
      layer2:moveLoc(size.width,0,1)
    elseif key == 97 then
      layer:moveLoc(-size.width,0,1)
      layer2:moveLoc(-size.width,0,1)
    end
  else
    print(key.." up")
  end
end
MOAIInputMgr.device.keyboard:setCallback ( onKeyboardEvent )