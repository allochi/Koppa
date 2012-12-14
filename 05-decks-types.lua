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

-- MOAIGfxDevice
-- MOAIGfxQuad2D
-- MOAIGfxQuadDeck2D
-- MOAIGfxQuadListDeck2D
-- MOAIGfxResource
-- MOAIGfxState

-- Deck - MOAIGfxQuad2D
local quad2d = MOAIGfxQuad2D.new()
      quad2d:setTexture("images/paper_lakitu.png")
      quad2d:setRect(-60,-60,60,60)
local quad2d_prop = MOAIProp2D.new()
      quad2d_prop:setDeck(quad2d)
      quad2d_prop:setLoc ( -size.width/2+60, size.height/2-60)
      layer:insertProp(quad2d_prop)

-- Tile Deck - MOAITileDeck2D
local quad2d_tile = MOAITileDeck2D.new()
      quad2d_tile:setTexture("images/char.png")
      quad2d_tile:setSize(3,4)
      quad2d_tile:setRect(-64,-64,64,64)
local quad2d_tile_prop = MOAIProp2D.new()
      quad2d_tile_prop:setDeck(quad2d_tile)
      quad2d_tile_prop:setIndex(7)
      quad2d_tile_prop:setLoc (-size.width/2+70*2, size.height/2-60)
      quad2d_tile_prop:setScl(0.7)
      layer:insertProp(quad2d_tile_prop)





