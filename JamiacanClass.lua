
module(..., package.seeall )


local sheetInfo5  = require ("rasta")

local sheetInfo6  = require ("yellowJamaica")

local sheetInfo7  = require ("greenJamaican")

local sheetInfo8  = require ("buleJamaican")

local sheetInfo9  = require ("darkJamaican")

local sheetInfo10  = require ("orengeJamaican")

local sheetInfo11  = require ("prinkjamaican")


sheet5 = graphics.newImageSheet("sheets/rasta.png", sheetInfo5:getSheet())
sheet6 = graphics.newImageSheet("sheets/yellowJamaica.png", sheetInfo6:getSheet())
sheet7 = graphics.newImageSheet("sheets/greenJamaican.png", sheetInfo7:getSheet())
sheet8 = graphics.newImageSheet("sheets/buleJamaican.png", sheetInfo8:getSheet())
sheet9 = graphics.newImageSheet("sheets/darkJamaican.png", sheetInfo9:getSheet())
sheet10 = graphics.newImageSheet("sheets/orengeJamaican.png", sheetInfo10:getSheet())
sheet11 = graphics.newImageSheet("sheets/prinkjamaican.png", sheetInfo11:getSheet())

sequenceData3 = {

{name ="seq2",  sheet=sheet5,  start=1, count=85, time=9000, loopCount=0 },
{name = "seq3", sheet= sheet6, start=1, count=63, time= 8000,loopCount=0},
{name = "seq4", sheet= sheet7, start=1, count=63, time= 8000,loopCount=0},
{name = "seq5", sheet= sheet8, start=1, count=63, time= 8000,loopCount=0},
{name = "seq6", sheet= sheet9, start=1, count=63, time= 8000,loopCount=0},
{name = "seq7", sheet= sheet10, start=1, count=63, time= 8000,loopCount=0},
{name = "seq10", sheet= sheet11, start=1, count=63, time= 8000,loopCount=0}
                 
}


function new (prams)

sheetTable  = {sheet5,sheet6,sheet7,sheet8,sheet9,sheet10,sheet11}

  rastaballoonIndex = math.random(#sheetTable)
  rastaballoonDisplay = display.newSprite( sheetTable[rastaballoonIndex], sequenceData3 )
  rastaballoonDisplay.x = display.contentCenterX
  rastaballoonDisplay.y = display.contentCenterY 
  rastaballoonDisplay.name = "balloon".. tostring(id)
  rastaballoonDisplay:addEventListener( "touch", balloonTouch )
 -- rastaballoonDisplay:addEventListener( "touch", starTouch)
  rastaballoonDisplay:play( )

return rastaballoonDisplay; 

end
