module(..., package.seeall )


local sheetInfo5  = require ("plusFive")
local sheetInfo6  = require ("20ps")
--------------------------------------------
local sheetInfo06  = require ("swirl")
--------------------------------------------
sheet5 = graphics.newImageSheet("sheets/plusFive.png", sheetInfo5:getSheet())
sheet6 = graphics.newImageSheet("sheets/20ps.png", sheetInfo6:getSheet())

sequenceData3 = {

{name ="seq2",  sheet=sheet5,  start=1, count=85, time=math.random(4000,9000), loopCount=0 },
 {name ="seq3",  sheet=sheet6,  start=1, count=85, time=math.random(4000,9000), loopCount=0 },
                 
}



function new (prams)

sheetTable  = {sheet5}

  HballoonIndex = math.random(#sheetTable)
  HballoonDisplay = display.newSprite( sheetTable[HballoonIndex], sequenceData3 )
  HballoonDisplay.x = display.contentCenterX
  HballoonDisplay.y = display.contentCenterY+600
  HballoonDisplay.name = "balloon".. tostring(id)
  HballoonDisplay:addEventListener( "touch", helperTouch )
  HballoonDisplay:play( )
 --TransID01=transition.to( HballoonDisplay, {time = math.random (3000,6000),x = math.random(100,500), y=-570,onComplete = recycle});

return HballoonDisplay; 

end
---------------------------------------------------
sheet06 = graphics.newImageSheet("sheets/swirl.png", sheetInfo06:getSheet())

sequenceData4 = {

{name ="seq1",  sheet=sheet06,  start=1, count=85, time=math.random(4000,9000), loopCount=0 },
                
}

function new02 (prams)

SwirlsheetTable  = {sheet06}

  SballoonIndex = math.random(#SwirlsheetTable)
  SballoonDisplay = display.newSprite( SwirlsheetTable[SballoonIndex], sequenceData4 )
  SballoonDisplay.x = display.contentCenterX+30
  SballoonDisplay.y = display.contentCenterY-80
  SballoonDisplay.name = "Sballoon".. tostring(id)
  SballoonDisplay:addEventListener( "touch", swirlTouch )
  SballoonDisplay:play( )
 
return SballoonDisplay; 

end


function new03 (time )
  sheetTable01  = {sheet6}
  HpballoonIndex = math.random(#sheetTable01)
  HpballoonDisplay = display.newSprite(sheetTable01[HpballoonIndex], sequenceData3 )
  HpballoonDisplay.x = display.contentCenterX
  HpballoonDisplay.y = display.contentCenterY+600
  HpballoonDisplay.name = "balloon02".. tostring(id)
  HpballoonDisplay:addEventListener( "touch", pointsGiver )
  HpballoonDisplay:play( )
-- TransID02=transition.to( HpballoonDisplay, {time = math.random(3000,6000 ) ,x = math.random(100,500), y=-570,onComplete = recycle});
return HpballoonDisplay; 
end

--[[
function new04 (params,time)

--local object = display.newImage(params.image)
sheet7 = graphics.newImageSheet(params.image, sheetInfo6:getSheet())
object = display.newSprite(sheet7, sequenceData3 )
object.x = display.contentCenterX
object.y =  display.contentCenterY
transition.to( object, {time = time, delay = 1000, y = display.contentCenterY-600, onComplete = nil } )


object.objTable = params.objTable

object.index = #object.objTable + 1


object.myName = "Object : " .. object.index


object.group = params.group or nil

object.group:insert(object)

object.objTable[object.index] = object

return object
end

]]