-----------------------------------------------------------------------------------------
--
-- main.lua
-----------------------------------------------------------------------------------------


---local  titlebar = "no title bar"
 local storyboard = require("storyboard")
 storyboard.purgeOnSceneChange = true
 
 local scene = storyboard.newScene()
 
 local widget = require "widget" 

 local runtime = 0

local tapfortap = require ("plugin.tapfortap")

local Top = 1
local Center = 2

local ads = require("ads" )

local  sheetInfo7 = require ("tv1")

local  sheetInfo8 = require ("tv2")

 local sheetInfo50 = require ("arrow2")


 local soundFile2 = audio.loadSound("music/tap.mp3")

  storyboard.removeAll()

 function scene:createScene(event)
  local screenGroup = self.view
  
   background = display.newImageRect("bg/background1.png",320,570)
   background.x = display.contentWidth/2
   background.y = display.contentHeight/2
   screenGroup:insert(background)
------===============================================================


------------------------------------------------------------------

 function scrollListener( event )
   phase = event.phase
   direction = event.direction
  
  if "began" == phase then
    --print( "Began" )
  elseif "moved" == phase then
    --print( "Moved" )
  elseif "ended" == phase then
    --print( "Ended" )
  end
  
  -- If the scrollView has reached it's scroll limit
  if event.limitReached then
    if "up" == direction then
     print( "Reached Top Limit" )
    elseif "down" == direction then
      print( "Reached Bottom Limit" )
    elseif "left" == direction then
      print( "Reached Left Limit" )
     storyboard.gotoScene( "worlds6" )
    elseif "right" == direction then
      print( "Reached Right Limit" )
    end
  end
      
  return true
end

-- Create a ScrollView
scrollView = widget.newScrollView
{
  x = display.contentCenterX,
  y = display.contentCenterY,
  width = display.contentWidth,
  height = display.contentHeight,
  bottomPadding = 50,
  id = "onBottom",
  horizontalScrollDisabled = false ,
  verticalScrollDisabled = true ,
  hideBackground = true, 
  listener = scrollListener,


}
   screenGroup:insert( scrollView)

----------------------------------------------
innerLeft = display.newImageRect("images/left.png",50,270)
innerLeft.x = display.contentCenterX+100
innerLeft.y = display.contentCenterY-15
screenGroup:insert(innerLeft)

innerLeft02 = display.newImageRect("images/left02.png",50,270)
innerLeft02.x = display.contentCenterX-100
innerLeft02.y = display.contentCenterY-15
screenGroup:insert(innerLeft02)

function scrollListener01( event )
   phase = event.phase
   direction01 = event.direction
  
  if "began" == phase then
    --print( "Began" )
  elseif "moved" == phase then
    --print( "Moved" )
  elseif "ended" == phase then
    --print( "Ended" )
  end
  
  -- If the scrollView has reached it's scroll limit
  
  if event.limitReached then
    if "up" == direction01 then
     print( "Reached Top Limit" )
    elseif "down" == direction01 then
      print( "Reached Bottom Limit" )
    elseif "left" == direction01 then
      print( "Reached Left Limit" )
    elseif "right" == direction01 then
      print( "Reached Right Limit" )
    end
  end
   return true
end

-- Create a ScrollView
scrollView01 = widget.newScrollView
{
  x = display.contentCenterX,
  y = display.contentCenterY,
  width = 200,
  height = 250,
  bottomPadding = 10,
  id = "onBottom",
  horizontalScrollDisabled = false,
  verticalScrollDisabled = true ,
  hideBackground = true, 
  listener = scrollListener01,


}
   screenGroup:insert( scrollView01)

holder = display.newRect (0,0,100,200)
holder:setFillColor( 0,0,0 )
holder.x = display.contentCenterX+300
holder.y = display.contentCenterY
holder.alpha = 0
scrollView01:insert(holder)

ad01 = display.newImageRect("images/ad01.png",200,200)
ad01.x = display.contentCenterX-60
ad01.y = display.contentCenterY-156
scrollView01:insert(ad01)

ad02 = display.newImageRect("images/ad02.png",200,200)
ad02.x = display.contentCenterX+140
ad02.y = display.contentCenterY-156
scrollView01:insert(ad02)

ad03 = display.newImageRect("images/ad03.png",200,200)
ad03.x = display.contentCenterX+336
ad03.y = display.contentCenterY-156
scrollView01:insert(ad03)


-------=======================================
sheet60 = graphics.newImageSheet("sheets/arrow2.png",sheetInfo50:getSheet())


 sequenceData = {
                
                { name="seq5", sheet=sheet60,  start= 1,   count=119, time=3000,  loopCount=1},
                }


sequenceData02 = {
                
                {name= "seq7", sheet= sheet7, start=1, count= 5, time= 1000,loopCount=0},
                {name= "seq8", sheet= sheet8, start=1, count= 5, time= 1000,loopCount=0}
                
                }

    back = display.newImage("taps/back.png")  
    back.x = 40
    back.y = 500
 screenGroup:insert(back)


next2 = display.newSprite( sheet60, sequenceData )
--next1 = display.newImageRect("images/next.png",48,80)
next2.x = display.contentCenterX-123
next2.y = display.contentCenterY
next2.alpha = 0.5
next2:play( )
screenGroup:insert(next2)


counter = display.newImage ("images/count7.png")
counter.x = display.contentCenterX+30
counter.y = 500
screenGroup:insert(counter)



function  lightUp2()

 next2:play( )

end
timer2 = timer.performWithDelay( 8000, lightUp2,0 )


 moreGames = widget.newButton
{
     x= display.contentCenterX+190,
     y = display.contentCenterY+120,
    width = 100,
    height = 50,
    defaultFile = "taps/more games.png",
    overFile = "taps/more games02.png",
    id = "button_5",
    onEvent = More,
  
} 

screenGroup:insert( moreGames ) 

bubbleTable5 = { "sheets/tv1"}
bubble5 = {} 

function spawnbubble5()
ranNum = math.random(#bubbleTable5) 
sheet7 = graphics.newImageSheet( bubbleTable5[ranNum]..".png", sheetInfo7:getSheet())
bubble5[#bubble5 + 1] = display.newSprite( sheet7, sequenceData02 )            
bubble5[#bubble5].x = display.contentCenterX
bubble5[#bubble5].y =  display.contentCenterY*2
bubble5[#bubble5]:play( )
bubble5[#bubble5].id = bubble5Num
--physics.addBody( bubble4[#bubble4], "static" , {density=0.1, friction=01., bounce=0.1 } ); 
transition.to( bubble5[#bubble5], {time = math.random (2000,6000),x = math.random(100,500), y=-570,onComplete = recycle6});
screenGroup:insert(bubble5[#bubble5]) 
bubble5[#bubble5]:addEventListener( "touch", pop6 )
return true 
end
totalbubble5 = 0
timer6= timer.performWithDelay( 12000, spawnbubble5, totalbubble5 ) 



bubbleTable6 = { "sheets/tv2"}
bubble6 = {} 

function spawnbubble6()
ranNum = math.random(#bubbleTable6) 
sheet8 = graphics.newImageSheet( bubbleTable6[ranNum]..".png", sheetInfo8:getSheet())
bubble6[#bubble6 + 1] = display.newSprite( sheet8, sequenceData02 )            
bubble6[#bubble6].x = display.contentCenterX
bubble6[#bubble6].y =  display.contentCenterY*2
bubble6[#bubble6]:play( )
bubble6[#bubble6].id = bubble6Num
--physics.addBody( bubble4[#bubble4], "static" , {density=0.1, friction=01., bounce=0.1 } ); 
transition.to( bubble6[#bubble6], {time = math.random (3000,7000),x = math.random(100,500), y=-570,onComplete = recycle7});
screenGroup:insert(bubble6[#bubble6]) 
bubble6[#bubble6]:addEventListener( "touch", pop7 )
return true 
end
totalbubble6 = 0
timer7 = timer.performWithDelay( 10000, spawnbubble6, totalbubble6 ) 


 end  -- end of create scene

 function pop6 ( event )
if event.phase == "began" then 
  local bubble  = event.target
  print "pop"
  audio.play(soundFile2,{channel=1})
  recycle6()
  vungleRequest();
   end 
   return true 
 end


 function pop7 ( event )
if event.phase == "began" then 
  local bubble  = event.target
  print "pop"
  audio.play(soundFile2,{channel=1})
  recycle7()
  vungleRequest();
   end 
   return true 
 end

 ads.init( "vungle", "53cea1d84f0c122c26000166", vungleCallbackListenter )

local params = {
   isAnimated = false,
   isAutoRotation = true,
}



 function  vungleRequest (  )
   
ads:setCurrentProvider( "vungle" )
ads.show( "interstitial", params )


 end


function vungleCallbackListenter ( event)
  
   -- Video ad not yet downloaded and available
   if ( event.type == "adStart" and event.isError ) then
      if ( system.getInfo("platformName") == "Android" ) then
        --- ads:setCurrentProvider( "tapfortap" 

        print "vungle have faild us"
      else
         --ads:setCurrentProvider( "iAds" )
         print "no ads are available"
      end
      
      ads.show( "interstitial" )
   elseif ( event.type == "adEnd" ) then
      -- Ad was successfully shown and ended; hide the overlay so the app can resume.
      storyboard.hideOverlay()

   else
      print( "Received event", event.type )
   end
   return true
end


 function  recycle6(event)

 display.remove( bubble5[#bubble5])
 end



 function  recycle7(event)

 display.remove( bubble6[#bubble6])
 end

tapfortap.initialize("40b0d46a5904bab11c6926c8c398ca26")

tapfortap.createAdView(Top, Center)


tapfortap.prepareAppWall()


function More ( event)

 phase = event.phase 

if "ended" == phase  and tapfortap.appWallIsReady() then

 audio.play( soundFile2,{channel=1} ) 

tapfortap.showAppWall()

else 
audio.play( soundFile2,{channel=1} ) 

storyboard.showOverlay( "selfVeiw" ,{effect = "slideUp",  params ={levelNuame = count}, isModal = true} )
 
print "show Jamaican Course world ads"
-- show my more games ads  

end
return true
end 




function  More001 (event )
  transition.to( moreGames, {x= display.contentCenterX+113, delay=100, time = 100, onComplete = nil} )
end

timerID01=timer.performWithDelay( 1000, More001, 1 )

 function backHome(event) 
 
 if event.phase == "began" then 
 
 print "back home"
 
 audio.play( soundFile2,{channel=1} )
 storyboard.gotoScene("menu2","fade",400)
 
 end 

 end 
 

function moveback( event )

 if event.phase == "began" then 
 
 print "back home"
 
 audio.play( soundFile2,{channel=1} )
 storyboard.gotoScene("worlds6")
 
  end
end




function Ad_01 (event )


   system.openURL("https://chrome.google.com/webstore/category/apps")

  
end
 
 function Ad_02 (event )


   system.openURL("https://play.google.com/store/apps/details?id=com.boxingstudiogames.jamaica_curse_words&hl=en")

   
end

 function Ad_03 (event )


   system.openURL("https://play.google.com/store/apps/details?id=com.boxingstudiogames.jetfighter&hl=en")

 
end

function getDeltaTime()
   local temp = system.getTimer()  --Get current game time in ms
   local dt = (temp-runtime) / (1000/60)  --60fps or 30fps as base
   runtime = temp  --Store game time
  -- print ("fps "..display.fps)
   return dt
end


function scene:enterScene(event)

local screenGroup = self.view

storyboard.removeScene( "worlds6" )

storyboard.removeAll( )

back:addEventListener("touch",backHome)
next2:addEventListener( "touch", moveback)

Runtime:addEventListener( "enterFrame",getDeltaTime )

ad01:addEventListener( "tap", Ad_01 )

ad02:addEventListener( "tap", Ad_02 )

ad03:addEventListener( "tap", Ad_03 )

end 
 
 
 
 
  function scene:exitScene(event)
 

local screenGroup = self.view

storyboard.removeAll()
   
tapfortap.removeAdView()

back:removeEventListener("touch",backHome)

next2:removeEventListener( "tap", moveback)

ad01:removeEventListener( "tap", Ad_01 )

ad02:removeEventListener( "tap", Ad_02 )

ad03:removeEventListener( "tap", Ad_03 )
 Runtime:removeEventListener( "enterFrame",getDeltaTime )
timer.cancel(timerID01)
timer.cancel( timer7 )
timer.cancel( timer6 )
timer.cancel( timer2  )

 display.remove( scrollView )
 scrollView = nil

 display.remove( scrollView01 )
 scrollView01 = nil

   end
 

  
 
scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene) 
scene:addEventListener("exitScene",scene) 
scene:addEventListener("destroyScene",scene) 

return scene