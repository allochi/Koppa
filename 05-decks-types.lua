require 'util'

local size = { width = 720, height = 720 }

-- Window
Util:window( "Fun with Decks" , size )

-- Viewport
local viewport = Util:viewport ( size )

-- Get a layer
local layer = Util:layer ( viewport , true )

-- MOAIGfxQuad2D – A single textured quad.
-- MOAIGfxQuadDeck2D – An array of textured quads (from one texture). Use this for basic sprite sheets and texture atlases.
-- MOAIGfxQuadListDeck2D – An array of lists of textured quads (from one texture). Use this for advanced sprite sheets.
-- MOAIMesh – Can render a custom vertex buffer object.
-- MOAIStretchPatch2D – A single ‘patch’ that may contain stretchable rows and columns.
-- MOAISurfaceDeck2D – A remnant of Moai’s original physics system. Unused at this time; left in at this time for my own convenience.
-- MOAITileDeck2D – Subdivides a texture into N x M tiles that may then be indexed. Suitable for tile maps and sprite sheets where every sprite is the same size.

-- ******************
-- There are more Decks check documentation
-- ******************

-- MOAIGfxDevice
-- MOAIGfxQuad2D
-- MOAIGfxQuadDeck2D
-- MOAIGfxQuadListDeck2D
-- MOAIGfxResource
-- MOAIGfxState

-- Deck - MOAIGfxQuad2D
local deck = MOAIGfxQuad2D.new()
      deck:setTexture("images/kaw-logo.png")
      deck:setRect(-64,-64,64,64)
local deck_prop = MOAIProp2D.new()
      deck_prop:setDeck(deck)
      deck_prop:setLoc ( -size.width/2+128, size.height/2-64)
      layer:insertProp(deck_prop)

-- Tile Deck - MOAITileDeck2D
local tile = MOAITileDeck2D.new()
      tile:setTexture("images/char.png")
      tile:setSize(3,4)
      tile:setRect(-64,-64,64,64)
local tile_prop = MOAIProp2D.new()
      tile_prop:setDeck(tile)
      tile_prop:setIndex(7)
      tile_prop:setLoc (-size.width/2+128*2, size.height/2-64)
      tile_prop:setScl(0.7)
      layer:insertProp(tile_prop)

-- Script Deck - MOAIScriptDeck
function onDraw( index, xOff, yOff, xFlip, yFlip )
  MOAIDraw.drawCircle (0,0,64,20)
end
local scriptDeck = MOAIScriptDeck.new()
      scriptDeck:setRect ( -64, -64, 64, 64 )
      scriptDeck:setDrawCallback ( onDraw )
local script_prop = MOAIProp2D.new()
      script_prop:setDeck(scriptDeck)
      script_prop:setLoc (-size.width/2+128*3, size.height/2-64)
      -- script_prop:setScl(0.7)
      layer:insertProp(script_prop)





