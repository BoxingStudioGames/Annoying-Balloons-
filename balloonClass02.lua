
module(..., package.seeall )

local sheetInfo6  = require ("Badstar")

sheet6 = graphics.newImageSheet("sheets/Badstar.png", sheetInfo6:getSheet())


sequenceData4 = {
  
  { name="seq2", sheet=sheet2, start=1, count=85, time=math.random(4000,9000), loopCount=0 },
}

function new02 (prams)
print "star2"
sheetTable01  = {sheet6}

  badStarIndex = math.random(#sheetTable01)
  badStarDisplay = display.newSprite( sheetTable01[badStarIndex], sequenceData4 )
  badStarDisplay.x = display.contentCenterX
  badStarDisplay.y = display.contentCenterY 
  badStarDisplay.name = "badStar".. tostring(id)
 -- balloonDisplay:addEventListener( "touch", starTouch)
  badStarDisplay:play( )
return badStarDisplay; 
end
