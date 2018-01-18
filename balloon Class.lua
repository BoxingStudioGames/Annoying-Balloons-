

module(..., package.seeall )


local sheetInfo5  = require ("balloon2")

local sheetInfo6  = require ("greenBalloon")

local sheetInfo7  = require ("yellowBalloon")

local sheetInfo8  = require ("buleBalloon")

local sheetInfo9  = require ("darkBalloon")

local sheetInfo10  = require ("purpleBalloon")

local sheetInfo11  = require ("pinkBalloon")

local sheetInfo12  = require ("star1")

local sheetInfo13 = require("smoke")

sheet5 = graphics.newImageSheet("sheets/level1balloons.png", sheetInfo5:getSheet())
sheet6 = graphics.newImageSheet("sheets/greenBalloon.png", sheetInfo6:getSheet())
sheet7 = graphics.newImageSheet("sheets/yellowBalloon.png", sheetInfo7:getSheet())
sheet8 = graphics.newImageSheet("sheets/buleBalloon.png", sheetInfo8:getSheet())
sheet9 = graphics.newImageSheet("sheets/darkBalloon.png", sheetInfo9:getSheet())
sheet10 = graphics.newImageSheet("sheets/purpleBalloon.png", sheetInfo10:getSheet())
sheet11 = graphics.newImageSheet("sheets/pinkBalloon.png", sheetInfo11:getSheet())
sheet12 = graphics.newImageSheet("sheets/star1.png", sheetInfo12:getSheet())
sheet13 = graphics.newImageSheet("sheets/smoke.png", sheetInfo13:getSheet())

sequenceData3 = {

{name ="seq2",  sheet=sheet5,  start=1, count=85, time=math.random(4000,9000), loopCount=0 },
{name = "seq3", sheet= sheet6, start=1, count=63, time= 8000,loopCount=0},
{name = "seq4", sheet= sheet7, start=1, count=63, time= 8000,loopCount=0},
{name = "seq5", sheet= sheet8, start=1, count=63, time= 8000,loopCount=0},
{name = "seq6", sheet= sheet9, start=1, count=63, time= 8000,loopCount=0},
{name = "seq7", sheet= sheet10, start=1, count=63, time= 8000,loopCount=0},
{name = "seq10", sheet= sheet10, start=1, count=63, time= 8000,loopCount=0},
{name = "seq11", sheet= sheet11, start=1, count=63, time= 8000,loopCount=0},
{name = "seq12", sheet= sheet12, start=1, count=63, time= 8000,loopCount=0},                 
}


function new (prams)

sheetTable  = {sheet5,sheet6,sheet7,sheet8,sheet9,sheet10,sheet11}

  balloonIndex = math.random(#sheetTable)
  balloonDisplay = display.newSprite( sheetTable[balloonIndex], sequenceData3 )
  balloonDisplay.x = display.contentCenterX
  balloonDisplay.y = display.contentCenterY 
  balloonDisplay.name = "balloon".. tostring(id)
  balloonDisplay:addEventListener( "touch", balloonTouch )
 -- balloonDisplay:addEventListener( "touch", starTouch)
  balloonDisplay:play( )

return balloonDisplay; 

end


function new02 (prams)

starsheetTable  = {sheet12}

  starIndex = math.random(#starsheetTable)
  starDisplay = display.newSprite( starsheetTable[starIndex], sequenceData3 )
  starDisplay.x = display.contentCenterX
  starDisplay.y = display.contentCenterY 
  starDisplay.name = "balloon".. tostring(id)
  starDisplay:addEventListener( "touch", starTouch )
 -- balloonDisplay:addEventListener( "touch", starTouch)
  starDisplay:play( )

return starDisplay; 

end

function new03 (prams)

SmokesheetTable  = {sheet13}

  SmokeIndex = math.random(#SmokesheetTable)
  SmokeDisplay = display.newSprite( SmokesheetTable[SmokeIndex], sequenceData3 )
  SmokeDisplay.x = display.contentCenterX
  SmokeDisplay.y = display.contentCenterY+200
  SmokeDisplay.name = "smoke".. tostring(id)
  --SmokeDisplay:addEventListener( "touch", starTouch )
 -- balloonDisplay:addEventListener( "touch", starTouch)
  SmokeDisplay:play( )

return SmokeDisplay; 

end


function  new04 ( prams )

HeroTable  = {

"images/notHero01.png",
"images/notHero02.png",
"images/notHero03.png",
"images/notHero04.png",
"images/notHero05.png",
"images/notHero06.png",
"images/notHero07.png",
"images/notHero08.png",

}
HeroIndex = math.random (#HeroTable)
Hero = display.newImageRect( HeroTable[HeroIndex],84,84)
Hero.x = display.contentCenterX
Hero.y = display.contentCenterY
Hero:addEventListener( "touch", ememyTouch)

return Hero

end

function  new05 ( prams )

HeroTable01  = {

"images/bad01.png",
--[["images/notHero02.png",
"images/notHero03.png",
"images/notHero04.png",
"images/notHero05.png",
"images/notHero06.png",
"images/notHero07.png",
"images/notHero08.png",
--]]
}

HeroIndex01 = math.random (#HeroTable01)
Hero01 = display.newImageRect( HeroTable01[HeroIndex01],84,84)
Hero01.x = display.contentCenterX
Hero01.y = display.contentCenterY
Hero01:addEventListener( "touch", addTouch)

return Hero01

end