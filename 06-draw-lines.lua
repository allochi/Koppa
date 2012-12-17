MOAISim.openWindow ( "drawtest", 320, 480 )

viewport = MOAIViewport.new ()
viewport:setSize ( 320, 480 )
viewport:setScale ( 320, 480 )

layer = MOAILayer2D.new ()
layer:setViewport ( viewport )
MOAISim.pushRenderPass ( layer )

points = { 0, 0 }
function onDraw ( index, xOff, yOff, xFlip, yFlip )
    MOAIDraw.drawLine ( unpack ( points ) )
    lastX = mouseX
    lastY = mouseY
end

mouseX = 0
mouseY = 0
lastX = 0
lastY = 0

function pointerCallback ( x, y )
    mouseX, mouseY = layer:wndToWorld ( x, y )
end

MOAIInputMgr.device.pointer:setCallback ( pointerCallback )

function clickCallback( down )
    if down then
        table.insert ( points, mouseX )
        table.insert ( points, mouseY )
        print("mouseX:", mouseX, " mouseY:", mouseY)
    end
end

MOAIInputMgr.device.mouseLeft:setCallback ( clickCallback )

scriptDeck = MOAIScriptDeck.new ()
scriptDeck:setRect ( -64, -64, 64, 64 )
scriptDeck:setDrawCallback ( onDraw )

prop = MOAIProp2D.new ()
prop:setDeck ( scriptDeck )
layer:insertProp ( prop )