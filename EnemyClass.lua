module(..., package.seeall )

--BAd Class 
--local sheetInfo5  = require ("badman3")

local sheetInfo6  = require ("brownDarkBalloon")

local sheetInfo7  = require ("buleDarkBalloon")

local sheetInfo8  = require ("redbad")
--[[
local sheetInfo9  = require ("darkBalloon")

local sheetInfo10  = require ("purpleBalloon")

local sheetInfo11  = require ("pinkBalloon")
--]]

sheet8 = graphics.newImageSheet("sheets/redbad.png", sheetInfo8:getSheet())
sheet7 = graphics.newImageSheet("sheets/buleDarkBalloon.png", sheetInfo7:getSheet())
sheet6 = graphics.newImageSheet("sheets/brownDarkBalloon.png", sheetInfo6:getSheet())

sequenceData4 = {

{name = "seq5", sheet= sheet8, start=1, count=150, time= 8000,loopCount=0},
{name = "seq6", sheet= sheet7, start=1, count=150, time= 8000,loopCount=0},
{name = "seq7", sheet= sheet6, start=1, count=150, time= 8000,loopCount=0},
       
}

function new (prams)
print "create"
sheetTable02  = {sheet8,sheet7,sheet6--[[,sheet10,sheet11--]] }

  Badballoon2Index = math.random(#sheetTable02)
  Badballoon2Display = display.newSprite( sheetTable02[Badballoon2Index], sequenceData4 )
  Badballoon2Display.x = display.contentWidth + 600
  Badballoon2Display.y = display.contentCenterY 
  Badballoon2Display.name = "Badballoon02".. tostring(id)
  Badballoon2Display:addEventListener( "touch",ememyTouch )
  Badballoon2Display:play( )
  
return Badballoon2Display; 

end