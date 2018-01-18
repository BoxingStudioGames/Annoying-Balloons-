-----------------------------------------------------------------------------------------
--
-- leve01.lua
--
-------------------------------------------vars----------------------------------------------
 metadata = require ("metadata")
 metadata.score = 0
--local life = 3
local count = 4
 metadata.timeLimit = 60

metadata.Starcount = 0;  

 BalloonPopData = loadTable  ("BalloonPop.txt")
 BalloonLoader = BalloonPopData["BalloonTable"]  

 local balloonLoader = BalloonLoader

 StarPopData = loadTable  ("StarPop.txt")
 StarLoading = StarPopData["StarTable"]  

 local StarPoped = StarLoading 

sound = loadTable  ("Sounds.txt")
SoundData = sound  ["Sounds"] 

local status = SoundData

local tapfortap = require ("plugin.tapfortap")
--------------------vars ----------------------------------------------

-- include Corona's "physics" library
local physics = require "physics"
physics.start() 

--physics.setDrawMode( "hybrid" )
--physics.setGravity(0,9.8)
---physics.setGravity( 0,0 )  physics.setPositionIterations( 16) ; physics.setVelocityIterations( 10 )



local  gameNetwork = require( "gameNetwork" ) 
local levelstorage = require("levelstorage") ----------loading levels 

local redCollisionFilter = { categoryBits = 2, maskBits = 3 } -- collides with (2 & 1) only
local blueCollisionFilter = { categoryBits = 4, maskBits = 5 } -- collides with (4 & 1) only
local blackCollisionFilter = { categoryBits = 8, maskBits = 2 }

local soundFile = audio.loadSound ("music/tap.mp3")

local  soundFile1 = audio.loadSound("music/tap.mp3")

local soundClock = audio.loadSound ("music/ClockTicking.mp3")

local soundEnmey = audio.loadSound ("music/Evil Laugh.mp3")

local physicsData = require("physics data")

local maxStars = 1 

local sheetInfo = require("explosion2")

local sheetInfo2  = require ("balloon2")

local sheetInfo3  = require ("Badman2")

local  sheetInfo4 = require("star1")

local widget = require ("widget")

local storyboard = require( "storyboard" )

local scene = storyboard.newScene()


storyboard.removeAll()



function scene:createScene( event )

local screenGroup = self.view
-- background 
 local background = display.newImageRect("bg/level01.png", 320, 570)
 background.x = display.contentWidth/2
 background.y = display.contentHeight/2 
 screenGroup:insert(background)
  
wall = display.newImage("wall01.png")
wall.x =-20
 physics.addBody(wall,"static",{density=.1,bounce= 0.2})
wall:setLinearVelocity(10,20)
wall.alpha = 0 
screenGroup:insert(wall)

wall02 = display.newImage("wall02.png")
wall02.y = display.contentHeight-600
physics.addBody(wall02,"static",{density=.1,bounce= 1})
wall02:setLinearVelocity(10,20)
wall02.alpha = 0 
screenGroup:insert(wall02)

wall03 = display.newImage("wall02.png")
wall03.y = display.contentHeight+500
 physics.addBody(wall03,"static",{density=.1,bounce=1})
wall03:setLinearVelocity(10,20)
wall03.alpha = 0 
screenGroup:insert(wall03)

wall04 = display.newImage("wall01.png")
wall04.x = 340
physics.addBody(wall04,"static",{density=.1,bounce=0.2})
wall04:setLinearVelocity(10,20)
wall04.alpha = 0 
screenGroup:insert(wall04)



 -- 1st image sheet
 --sheetData1 = { width=50, height=17, numFrames=4, sheetContentWidth=200, sheetContentHeight=17}
sheet1 = graphics.newImageSheet("sheets/expolsion2.png", sheetInfo:getSheet())
sheet2 = graphics.newImageSheet("sheets/level1balloons.png",sheetInfo2:getSheet())
sheet3 = graphics.newImageSheet("sheets/Badman.png", sheetInfo3:getSheet())
sheet4 = graphics.newImageSheet("sheets/star1.png", sheetInfo4:getSheet())
--sheet4 = graphics.newImageSheet( "sheets/star1.png", sheetInfo4:getsheet()) 
-- 2nd image sheet
 --sheetData2 = { width=400, height=400, numFrames=7, sheetContentWidth=2800, sheetContentHeight=400 }
 --sheet2 = graphics.newImageSheet( "animations/explosion.png",{ name="seq1", sheet=sheet1, start=10, count=11, time=9000, loopCount=1}, sheetInfo2:getSheet())

-- In your sequences, add the parameter 'sheet=' referencing which image sheet the sequence should use
 sequenceData = {

                { name="seq2", sheet=sheet2, start=1, count=85, time=math.random(4000,9000), loopCount=0 },
                {name= "seq3", sheet= sheet3, start=1, count=63, time= 8000,loopCount=0},
                {name= "seq4", sheet= sheet4, start=1, count= 45, time= 4000,loopCount=0}
             --   {name= "seq5", sheet= sheet5, start=1, count= 45, time= 4000,loopCount=0},
               -- {name= "seq6", sheet= sheet6, start=1, count= 45, time= 4000,loopCount=0}
                }

sequenceData2 = {
  
  { name="seq1", sheet=sheet1, start=1, count=26, time=1200, loopCount= 1}

}
                

    explosion = display.newSprite( sheet1, sequenceData2 )
    explosion.x = 100
    explosion.y = 100
    explosion:play( )
   explosion.alpha = 0 
   screenGroup:insert(explosion)


balloon01 = display.newSprite( sheet2, sequenceData )
balloon01.x = 100
balloon01.y = 100
balloon01:play( )
balloon01.name = "hero"
physics.addBody( balloon01, "static", {density=1, friction=0, bounce=1, radius = 30  } )
screenGroup:insert(balloon01)


 
--balloon02 = display.newImage("heros/balloon01.png")
balloon02 = display.newSprite( sheet2, sequenceData )
balloon02.x = display.contentCenterX
balloon02.y = display.contentCenterY
--balloon02.name = "hero"
balloon02:play( )
physics.addBody( balloon02, "static", {density=1, friction=0, bounce=1,radius = 30 } )
screenGroup:insert(balloon02)
 
balloon03 = display.newSprite( sheet2, sequenceData )
--balloon03 = display.newImage("heros/balloon01.png")
balloon03.x = display.contentCenterX
balloon03.y = display.contentCenterY
balloon03.name = "hero"
balloon03:play( )
physics.addBody( balloon03, "static", {density=1, friction=0, bounce=1,radius = 30 } )
screenGroup:insert(balloon03)
 
--balloon04 = display.newImage("heros/balloon01.png")
balloon04 = display.newSprite( sheet2, sequenceData )
balloon04.x = display.contentCenterX
balloon04.y = display.contentCenterY
balloon04.name = "hero"
balloon04:play( )
physics.addBody( balloon04, "static", {density=1, friction=0, bounce=1,radius = 30  } )
screenGroup:insert(balloon04)

-- star system set up 
--[[
function starTap (event)
  print (event.target.name)
end
--]]
sheetTable  = {sheet4}
starDisplay = {}

function makeAstar (id)
  starIndex = math.random(#sheetTable)
  starDisplay[#starDisplay] = display.newSprite( sheetTable[starIndex], sequenceData )
  starDisplay[#starDisplay].x = display.contentCenterX
  starDisplay[#starDisplay].y = display.contentCenterY
  starDisplay[#starDisplay].name = "star".. tostring(id)
  starDisplay[#starDisplay]:addEventListener( "touch", starTouch)
  starDisplay[#starDisplay]:play( )
   screenGroup:insert(starDisplay[#starDisplay])

end

for i=1,maxStars do
makeAstar(i)  
print(i)
end

sheetTable2  = {sheet4}
starDisplay2 = {}

function makeAstar2 (id)
  starIndex2 = math.random(#sheetTable2)
  starDisplay2[#starDisplay2] = display.newSprite( sheetTable2[starIndex2], sequenceData )
  starDisplay2[#starDisplay2].x = display.contentCenterX
  starDisplay2[#starDisplay2].y = display.contentCenterY
  starDisplay2[#starDisplay2].name = "star".. tostring(id)
  starDisplay2[#starDisplay2]:addEventListener( "touch", starTouch)
  starDisplay2[#starDisplay2]:play( )
  screenGroup:insert(starDisplay2[#starDisplay2])

end

for i=1,maxStars do
makeAstar2(i)  
print(i)
end

sheetTable3  = {sheet4}
starDisplay3 = {}

function makeAstar3 (id)
  starIndex3 = math.random(#sheetTable3)
  starDisplay3[#starDisplay3] = display.newSprite( sheetTable2[starIndex3], sequenceData )
  starDisplay3[#starDisplay3].x = display.contentCenterX
  starDisplay3[#starDisplay3].y = display.contentCenterY
  starDisplay3[#starDisplay3].name = "star".. tostring(id)
  starDisplay3[#starDisplay3]:addEventListener( "touch", starTouch)
  starDisplay3[#starDisplay3]:play( )
  screenGroup:insert(starDisplay3[#starDisplay3])

end

for i=1,maxStars do
makeAstar3(i)  
print(i)
end

---------------- star table

--enemy = display.newImage ("enemy/enemy2.png")
enemy = display.newSprite( sheet3, sequenceData )
enemy.x = display.contentCenterX
enemy.y = display.contentCenterY
--physics.addBody( enemy, "static", physicsData:get("Badman"))
---setSequence( "looking" );
enemy:play( )
screenGroup:insert(enemy)


scoreboard =display.newImage("images/score  board01.png")
scoreboard.x = 150
scoreboard.y = 40
physics.addBody(scoreboard,"static",{density=.1,bounce=0.2,radius = 10 })
screenGroup:insert(scoreboard)
--[[
life01 = display.newImage ("life01.png")
life01.x = 50
life01.y = 150
screenGroup:insert( life01 )
--]]
--[[
lifeText = display.newText("" .. life, 0, 0, "Showcard Gothic", 40)
lifeText:setTextColor(250,250,0)
lifeText.x = 50
lifeText.y = 150
screenGroup:insert(lifeText)
--]]

pause = display.newImage("taps/pausebutton.png")
pause.y = 660
pause.x = display.contentWidth-280
physics.addBody(pause,"static",{density=.1,bounce=0.2,radius = 15 })
pauseIntro = transition.to(pause,{time=1000, y=40, onComplete=resumeReady})
screenGroup:insert(pause)





clock = display.newImageRect("images/clock.png",48,48)
clock.x = 270
clock.y = 40
physics.addBody(clock,"static",{density=.1,bounce=0.2,radius = 20 })
screenGroup:insert( clock )




timeLeft = display.newText(metadata.timeLimit, 160, 20,"Showcard Gothic", 30)
timeLeft:setTextColor(250,0,0)
timeLeft.x = 270
timeLeft.y = 40
screenGroup:insert(timeLeft)


scoreText = display.newText("" .. metadata.score, 0, 0, "Showcard Gothic", 40)
scoreText:setTextColor(250,250,0)
scoreText.x = 150
scoreText.y = 40
screenGroup:insert(scoreText)



countDisply = display.newImageRect ("images/cover.png", 90,90)
countDisply.x = 270
countDisply.y = 150
screenGroup:insert(countDisply)

countText = display.newText("" .. count, 0, 0, "Showcard Gothic", 40)
countText:setTextColor(250,250,0)
countText.x = 270
countText.y = 150
screenGroup:insert(countText)


cover1 = display.newImageRect("bg/cover.png",display.contentWidth*2,display.contentHeight*2)
cover1.x = display.contentCenterX*7
cover1.y = display.contentCenterY
screenGroup:insert(cover1)

slider = display.newImage("taps/menu101.png")
slider.x = display.contentCenterX-600
slider.y = display.contentCenterY 
screenGroup:insert(slider)
--[[
pasue1 = display.newImage("pause 03.png")
pasue1.x = -85
pasue1.y = 280
screenGroup:insert(pasue1)
--]]

   pasue1 = widget.newButton
{
     x= -85,
     y = 280,
    width = 48,
    height = 48,
    defaultFile = "taps/pause01.png",
    overFile = "taps/pause02.png",
    id = "button_1",
    onEvent = handleButtonEvent04,
  
}
screenGroup:insert( pasue1 )


  menu101 = widget.newButton
{
     x= -60,
     y = 160,
    width = 64,
    height = 64,
    defaultFile = "taps/menu03.png",
    overFile = "taps/menu04.png",
    id = "button_1",
    onEvent = handleButtonEvent01,
  
}
screenGroup:insert( menu101 )



  reset = widget.newButton
{
     x= -60,
     y = 275,
    width = 64,
    height = 64,
    defaultFile = "taps/rest01.png",
    overFile = "taps/rest02.png",
    id = "button_2",
    onEvent = handleButtonEvent02,
  
}
screenGroup:insert( reset )


--[[
sound = display.newImage("sound 01.png")
sound.x = -60
sound.y = 370
screenGroup:insert(sound)

--]]


  sound = widget.newButton
{
     x= -60,
     y = 370,
    width = 64,
    height = 64,
    defaultFile = "taps/sound01.png",
    overFile = "taps/sound02.png",
    id = "button_2",
    onEvent = handleButtonEvent05,
  
}
screenGroup:insert( sound )



  level = widget.newButton
{
     x= -60,
     y = 480,
    width = 70,
    height = 70,
    defaultFile = "taps/level001.png",
    overFile = "taps/level002.png",
    id = "button_2",
    onEvent = handleButtonEvent03,
  
}
screenGroup:insert( level )


text = display.newImage("images/pause.png")
text.x = 260
text.y = 100
text.alpha = 0 
screenGroup:insert(text)

end -- end of create scene


function  showAds ( event )

tapfortap.prepareInterstitial()
tapfortap.initialize("40b0d46a5904bab11c6926c8c398ca26")

--tapfortap.showInterstitial()
if tapfortap.interstitialIsReady() then
    tapfortap.showInterstitial()

  else 

    storyboard.showOverlay( "selfVeiw" ,{effect = "slideUp",  params ={levelNuame = count}, isModal = true} )

end
 end 

function handleButtonEvent01( event )
     phase = event.phase 

   if "ended" == phase then
        print( "You pressed and released a button!" )

audio.play( soundFile1, {channel = 2} );
cleanUp ();
storyboard.gotoScene( "menu2", "fade", 700 );

    end
end

function handleButtonEvent02( event )
     phase = event.phase 

   if "ended" == phase then
        print( "You pressed and released a button! & rest" )

audio.play( soundFile1, {channel = 2} );
cleanUp ();
storyboard.gotoScene( "reset","zoomOutInFade", 200 );

    end
end

function handleButtonEvent03( event )
     phase = event.phase 

   if "ended" == phase then
        print( "You pressed and released a button! & Levels" )

audio.play( soundFile1, {channel = 2} );
cleanUp ();
storyboard.gotoScene( "levels", "fade", 700 );

    end
end


function handleButtonEvent04( event )
     phase = event.phase 

   if "ended" == phase then
        print( "You pressed and released a button! & Levels" )

audio.play( soundFile1, {channel = 2} );

--storyboard.gotoScene( "levels", "fade", 700 );

slider02()
 
    end
end

 function  Settings02 ( event )
  
sounds = {}

  print ("sounds& save");
  print  (status)
sounds["Sounds"] = status

 saveTable (sounds,"Sounds.txt")


end


function handleButtonEvent05( event )
     phase = event.phase 

if "ended" == phase and  status == 0  then

status = 1
print (status)
print "on"


audio.setMaxVolume( status ,{channel = 1})
audio.setMaxVolume( status ,{channel = 2})
audio.setMaxVolume( status ,{channel = 3})
audio.setMaxVolume( status ,{channel = 4})
audio.setMaxVolume( status ,{channel = 5})
audio.setMaxVolume( status ,{channel = 6})
audio.setMaxVolume( status ,{channel = 7})
audio.setMaxVolume( status ,{channel = 8})
audio.setMaxVolume( status ,{channel = 9})
--audio.setMaxVolume( status ,{channel = 10})
audio.setMaxVolume( status ,{channel = 11})
audio.setMaxVolume( status ,{channel = 12})
audio.setMaxVolume( status ,{channel = 13})
audio.setMaxVolume( status ,{channel = 14})
audio.setMaxVolume( status ,{channel = 15})
audio.setMaxVolume( status ,{channel = 16})
audio.setMaxVolume( status ,{channel = 17})
audio.setMaxVolume( status ,{channel = 18})
audio.setMaxVolume( status ,{channel = 19})
audio.setMaxVolume( status ,{channel = 20})
audio.setMaxVolume( status ,{channel = 21})
audio.setMaxVolume( status ,{channel = 22})
audio.setMaxVolume( status ,{channel = 23})
audio.setMaxVolume( status ,{channel = 24})
audio.setMaxVolume( status ,{channel = 25})
audio.setMaxVolume( status ,{channel = 26})
audio.setMaxVolume( status ,{channel = 27})
audio.setMaxVolume( status ,{channel = 28})
audio.setMaxVolume( status ,{channel = 29})
audio.setMaxVolume( status ,{channel = 30})
audio.setMaxVolume( status ,{channel = 31})
audio.setMaxVolume( status ,{channel = 32})

 --swich02 = images[1]
audio.play( soundFile1, {channel = 2} );

Settings02(); 


else if  "ended" == phase and status == 1 then 

status = 0
print "off"

-- swich02 = images[2]

audio.play( soundFile1, {channel = 2} );
print (status)

audio.setMaxVolume( status ,{channel = 1})
audio.setMaxVolume( status ,{channel = 2})
audio.setMaxVolume( status ,{channel = 3})
audio.setMaxVolume( status ,{channel = 4})
audio.setMaxVolume( status ,{channel = 5})
audio.setMaxVolume( status ,{channel = 6})
audio.setMaxVolume( status ,{channel = 7})
audio.setMaxVolume( status ,{channel = 8})
audio.setMaxVolume( status ,{channel = 9})
--audio.setMaxVolume( status ,{channel = 10})
audio.setMaxVolume( status ,{channel = 11})
audio.setMaxVolume( status ,{channel = 12})
audio.setMaxVolume( status ,{channel = 13})
audio.setMaxVolume( status ,{channel = 14})
audio.setMaxVolume( status ,{channel = 15})
audio.setMaxVolume( status ,{channel = 16})
audio.setMaxVolume( status ,{channel = 17})
audio.setMaxVolume( status ,{channel = 18})
audio.setMaxVolume( status ,{channel = 19})
audio.setMaxVolume( status ,{channel = 20})
audio.setMaxVolume( status ,{channel = 21})
audio.setMaxVolume( status ,{channel = 22})
audio.setMaxVolume( status ,{channel = 23})
audio.setMaxVolume( status ,{channel = 24})
audio.setMaxVolume( status ,{channel = 25})
audio.setMaxVolume( status ,{channel = 26})
audio.setMaxVolume( status ,{channel = 27})
audio.setMaxVolume( status ,{channel = 28})
audio.setMaxVolume( status ,{channel = 29})
audio.setMaxVolume( status ,{channel = 30})
audio.setMaxVolume( status ,{channel = 31})
audio.setMaxVolume( status ,{channel = 32})


Settings02(); 

end 
end
return true
end

function moveballoons ()

trans1 = transition.to( balloon01, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = moveballoons} )

trans2 = transition.to( balloon02, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans3 = transition.to( balloon03, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans4 = transition.to( balloon04, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans5 = transition.to(  starDisplay[#starDisplay] , { time =1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans6 = transition.to(  starDisplay2[#starDisplay2] , { time =1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans7 = transition.to(  starDisplay3[#starDisplay3] , { time =1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )


end
 
--moveballoons()

killerGang=timer.performWithDelay( 100, moveballoons, 1 )



function moveEnemy ()

trans01 = transition.to( enemy, { time = 1000, x = math.random (70, display.contentWidth), y = math.random (70,display.contentHeight), onComplete = moveEnemy} )
--[[
trans02 = transition.to( balloon02, { time = 1000, x = math.random (70,320), y = math.random (70,570), onComplete = nil } )

trans03 = transition.to( balloon03, { time = 1000, x = math.random (70,320), y = math.random (70,570), onComplete = nil } )

trans04 = transition.to( balloon04, { time = 1000, x = math.random (70,320), y = math.random (70,570), onComplete = nil } )

--]]
end
 
--moveEnemy()

killer=timer.performWithDelay( 100, moveEnemy, 1 )



function  balloonTouch ( event )

if event. phase == "began" then 
	--event.target
	 print "touch"

transition.to( explosion , { time = 100, alpha = 1, x = event.x,  y= event.y,  onComplete =  setback } )
	
explosion:play()

scoreUpdate ()

transition.to( event.target, { time = 10, alpha = 0, onComplete = nil} ); 
--display.remove( event.target )


event.target:removeEventListener( "touch", balloonTouch )

Audio04=audio.play( soundFile,{channel = 1, onComplete = nil} )

counter()


	end 
	return true 
end

function  starTouch ( event )

if event. phase == "began" then 
  --event.target
   print "touch star"

transition.to( explosion , { time = 100, alpha = 1, x = event.x,  y= event.y,  onComplete =  setback } )
  
explosion:play()

metadata.score =   metadata.score +40 
scoreText.text =  metadata.score

transition.to( event.target, { time = 10, alpha = 0, onComplete = nil} ); 
--display.remove( event.target )


event.target:removeEventListener( "touch", starTouch )

starcount ()

Audio03=audio.play( soundFile,{channel = 1, onComplete = nil} )

end 
  return true 
end

function ememyTouch (event)
if event.phase == "began" then 
print "touch enemy"

scoreMinus()

Audio02=audio.play(soundEnmey, {channel = 1})
--audio.fadeOut(soundEnmey, {time= 3000 } );
--audio.setMaxVolume( 1, {channel=5} )
--audio.setVolume( 0.30, {channel=1} )

end 
return true 
end


function  setback ( event )

 transition.to( explosion , { time = 1000, delay = 1000, alpha = 0, onComplete = nil} )
	
end


function  scoreUpdate(event)
 metadata.score =   metadata.score +10 
scoreText.text =  metadata.score

end 

function  scoreMinus( event )

gameOver()

end


function  counter ( event )

count = count - 1 
countText.text = count 

balloonLoader = balloonLoader +1 

end

function  starcount( event )
  print (Hit)
  print( metadata.Starcount )
  metadata.Starcount = metadata.Starcount +1 
  StarPoped = StarPoped +1 
end

 
function timerDown()
   metadata.timeLimit = metadata.timeLimit-1
   timeLeft.text = metadata.timeLimit
     
     if(metadata.timeLimit==5)then
     
     print "5 seconds left"
     

Audio01=audio.play( soundClock,{channel = 1, onComplete = nil} )

     
 
     else

     if(metadata.timeLimit==0)then
      timer.cancel( timer01  )
      audio.stop( Audio01  )
     gameOver()
        print("Time Out and game over ") -- or do your code for time out -- this will activate game over 
     end
  end
  end
timer01 = timer.performWithDelay(1000,timerDown,60)







  function slider01 (event)
 if event.phase == "began" then 
  pause010()
 print"work"
siderIntro = transition.to(slider,{time=1000, x=80, onComplete=resumeReady})
pause1Intro = transition.to(pasue1,{time=2000, x=105, onComplete=resumeReady})
menu101Intro = transition.to(menu101,{time=1000, x=50, onComplete=resumeReady})
resetIntro = transition.to(reset,{time=1000, x=40, onComplete=resumeReady})
soundIntro = transition.to(sound,{time=1000, x=60, onComplete=resumeReady})
levelIntro = transition.to(level,{time=1000, x=80, onComplete=resumeReady})
coverIntro = transition.to(cover1,{time=10, x=display.contentCenterX, onComplete=showAds})
textInto = transition.to( text, {time = 1000, alpha = 1, onComplete = nil } )


 end  
 end
 

function slider02 ()
-- if event.phase == "began" then 
  pause11()
 print"work"
sliderIntro = transition.to(slider,{time=1000, x= -100, onComplete=resumeReady})
pause1Intro = transition.to(pasue1,{time=1000, x= -100, onComplete=resumeReady})
menu101Intro = transition.to(menu101,{time=1000, x= -100, onComplete=resumeReady})
resetIntro = transition.to(reset,{time=1000, x=-100, onComplete=resumeReady})
soundIntro = transition.to(sound,{time=1000, x=-100, onComplete=resumeReady})
levelIntro = transition.to(level,{time=1000, x=-100, onComplete=resumeReady})
coverIntro = transition.to(cover1,{time=10, x=display.contentCenterX*7, onComplete=resumeReady})
textInto = transition.to( text, {time = 1000, alpha = 0, onComplete = nil } )


 --end  
 end


function pause010 ( event )

transition.pause( trans1)
transition.pause( trans2)
transition.pause( trans3)
transition.pause( trans4)
transition.pause( trans5)
transition.pause( trans6)
transition.pause( trans7)
transition.pause( trans01)
audio.pause(Audio01)
timer.pause( timer01  )
balloon01:pause( )
balloon02:pause( )
balloon03:pause( )
balloon04:pause( )
explosion:pause( )
enemy:pause()
starDisplay[#starDisplay]:pause( )
starDisplay2[#starDisplay2]:pause( )
starDisplay3[#starDisplay3]:pause( )

transition.pause( )

end

function  pause11 ( event )
 audio.resume( Audio01 )
 transition.resume( trans1)

 transition.resume( trans2)

 transition.resume( trans3)

 transition.resume( trans4)

 transition.resume( trans5)

 transition.resume( trans6)

 transition.resume( trans7)

 transition.resume( trans01)

 transition.resume( )

balloon01:play( )
balloon02:play( )
balloon03:play( )
balloon04:play( )
starDisplay[#starDisplay]:play( )
starDisplay2[#starDisplay2]:play( )
starDisplay3[#starDisplay3]:play( )

enemy:play()
explosion:play( )
 timer.resume( timer01  )

tapfortap.removeAdView();

end


function coverTouch (event)
	if event.phase == "began" then 

 print "can't pass "

	end
return true 
end

function cleanUp ( )


print "i have clean the game"

 timer.cancel( timer01  )
--pause:removeEventListener("touch",slider01)
--pasue1:removeEventListener("touch",slider02
transition.cancel(trans1 )
transition.cancel(trans2 )
transition.cancel(trans3 )
transition.cancel(trans4 )
transition.cancel(trans5) 
transition.cancel(trans01 ) 
transition.cancel( )

timer.cancel( killerGang )
 timer.cancel( killer )
timer.cancel( checker )

end


function gameOver ( event )
SaveData(); 
-- prevent back touch 
--storyboard.gotoScene("levels","fade",400)
cleanUp();
storyboard.gotoScene("lost",slideRight,900)



end 

function  nextLevel (event) 

if (count == 0 ) then 

levels[1] = 3
--levels[2] = 1
saveLevels()
timer.cancel( timer01  )
win()
if (count == 0 and levels[2] == 2 ) then 

print "you have unlocked level 2"

levels[2] = 1
saveLevels()

end 
end 
end 



checker=timer.performWithDelay( 1000 , nextLevel, 0 )


function  win ( event )
  
SaveData(); 
cleanUp();
storyboard.gotoScene("win",slideRight,900)
--[[
--pause:removeEventListener("touch",slider01)
--pasue1:removeEventListener("touch",slider02)

transition.cancel(trans1 )
transition.cancel(trans2 )
transition.cancel(trans3 )
transition.cancel(trans4 ) 
transition.cancel(trans01 ) 
transition.cancel(trans5)
 --timer.cancel( timer01  )
timer.cancel( killerGang )
 timer.cancel( killer )
timer.cancel( checker )
audio.stop( Audio01 )

transition.cancel( )
--]]

end

function  SaveData ( event )
  
  StarTableOne = {}

  print ("Every Is okay");

StarTableOne["LevelOneStars"] = metadata.Starcount

 saveTable (StarTableOne,"LevelOneStars.txt")


end


function  SaveBalloons ( event )
  

BalloonPopData["BalloonTable"] = balloonLoader

saveTable (BalloonPopData,"BalloonPop.txt")


end

function  Save_Star02_Data ( event )
  

StarPopData["StarTable"] = StarPoped

saveTable (StarPopData,"StarPop.txt")


end


function scene:enterScene( event )
screenGroup = self.view

saveLevels()

pause:addEventListener("touch",slider01)
--pasue1:addEventListener("touch",slider02)

storyboard.removeScene( "levels" )

balloon01:addEventListener( "touch", balloonTouch )

balloon02:addEventListener( "touch", balloonTouch )

balloon03:addEventListener( "touch", balloonTouch )

balloon04:addEventListener( "touch", balloonTouch )

enemy:addEventListener( "touch", ememyTouch )

cover1:addEventListener( "touch", coverTouch )



end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
screenGroup = self.view
SaveBalloons()
Save_Star02_Data()
display.remove(balloon01);
display.remove(balloon02);
display.remove(balloon03);
display.remove(balloon04);
display.remove( enemy ); 
 display.remove(starDisplay); 
audio.stop( Audio01 )
audio.stop( Audio03 )
audio.stop( Audio04 )
audio.resume() 
end

function  scene:didExitScene ( event )
  
  print ("not longer active");


storyboard.removeAll(); 

end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
screenGroup = self.view
end
-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )
	--	Runtime:addEventListener('enterFrame', update)
   
scene:addEventListener( "didExitScene", scene )
				
-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene







