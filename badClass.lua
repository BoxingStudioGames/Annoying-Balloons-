module(..., package.seeall )

--BAd Class 
local sheetInfo5  = require ("badman3")

local sheetInfo6  = require ("Badman2")

local sheetInfo7  = require ("buleBad")

--local sheetInfo8  = require ("redbad")
--[[
local sheetInfo9  = require ("darkBalloon")

local sheetInfo10  = require ("purpleBalloon")

local sheetInfo11  = require ("pinkBalloon")
--]]

sheet5 = graphics.newImageSheet("sheets/badman3.png", sheetInfo5:getSheet())
sheet6 = graphics.newImageSheet("sheets/Badman.png", sheetInfo6:getSheet())
sheet7 = graphics.newImageSheet("sheets/buleBad.png", sheetInfo7:getSheet())
--sheet8 = graphics.newImageSheet("sheets/redbad.png", sheetInfo8:getSheet())
--[[sheet9 = graphics.newImageSheet("sheets/darkBalloon.png", sheetInfo9:getSheet())
sheet10 = graphics.newImageSheet("sheets/purpleBalloon.png", sheetInfo10:getSheet())
sheet11 = graphics.newImageSheet("sheets/pinkBalloon.png", sheetInfo11:getSheet())
--]]
sequenceData3 = {

{name ="seq2",  sheet=sheet5,  start=1, count=85, time=math.random(4000,9000), loopCount=0 },
{name = "seq3", sheet= sheet6, start=1, count=63, time= 8000,loopCount=0},
{name = "seq4", sheet= sheet7, start=1, count=63, time= 8000,loopCount=0},
--{name = "seq5", sheet= sheet8, start=1, count=63, time= 8000,loopCount=0},
--[[{name = "seq6", sheet= sheet9, start=1, count=63, time= 8000,loopCount=0},
{name = "seq7", sheet= sheet10, start=1, count=63, time= 8000,loopCount=0},
{name = "seq10", sheet= sheet10, start=1, count=63, time= 8000,loopCount=0}
    --]]             
}



function new (prams)

sheetTable  = {sheet5,sheet6,sheet7--[[,sheet8,sheet9,sheet10,sheet11--]] }

  BadballoonIndex = math.random(#sheetTable)
  BadballoonDisplay = display.newSprite( sheetTable[BadballoonIndex], sequenceData3 )
  BadballoonDisplay.x = display.contentCenterX
  BadballoonDisplay.y = display.contentCenterY 
  BadballoonDisplay.name = "Badballoon".. tostring(id)
  BadballoonDisplay:addEventListener( "touch",ememyTouch )
  BadballoonDisplay:play( )
  
return BadballoonDisplay; 

end
