-----------------------------------------------------------------------------------------
--
-- level010.lua/ bacckworld03
--
-------------------------------------------vars----------------------------------------------
 metadata = require ("metadata")
 metadata.score = 0
--local life = 3
 local count = 44
 metadata.timeLimit = 60;

metadata.Starcount010 = 0;  

 BalloonPopData = loadTable  ("BalloonPop.txt")
 BalloonLoader = BalloonPopData["BalloonTable"]  

 local balloonLoader = BalloonLoader


local tapfortap = require ("plugin.tapfortap")

sound = loadTable  ("Sounds.txt")
SoundData = sound  ["Sounds"] 

local status = SoundData

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

local soundEnmey02 = audio.loadSound ("music/warning.mp3")

local soundBeep = audio.loadSound ("music/beep.mp3")

local physicsData = require("physics data")

local balloonClass = require("balloon Class")
local balloonClass02 = require( "balloonClass02")
local badClass = require("badClass")
local EnemyClass = require("EnemyClass")
local helperClass = require("helperClass")
local starSaver = require("starSaver")  
local maxStars = 1 
local sheetInfo = require("explosion2")

local sheetInfo2  = require ("balloon2")

local sheetInfo3  = require ("Badman2")

--local  sheetInfo4 = require("star1")

local reverse = 1
local reverse01 = 1 
local xFacter = 0.10
local yFacter = 0.10

local widget = require ("widget")

local storyboard = require( "storyboard" )

local scene = storyboard.newScene()


storyboard.removeAll()



function scene:createScene( event )

local screenGroup = self.view
-- background 
 local background = display.newImageRect("bg/sky.png", 320, 570)
 background.x = display.contentWidth/2
 background.y = display.contentHeight/2 
 screenGroup:insert(background)
  
swirl = helperClass.new02 ()
swirl:scale( 0.6, 0.6 )
screenGroup:insert(swirl)


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
--sheet4 = graphics.newImageSheet("sheets/star1.png", sheetInfo4:getSheet())
--sheet4 = graphics.newImageSheet( "sheets/star1.png", sheetInfo4:getsheet()) 
-- 2nd image sheet
 --sheetData2 = { width=400, height=400, numFrames=7, sheetContentWidth=2800, sheetContentHeight=400 }
 --sheet2 = graphics.newImageSheet( "animations/explosion.png",{ name="seq1", sheet=sheet1, start=10, count=11, time=9000, loopCount=1}, sheetInfo2:getSheet())

-- In your sequences, add the parameter 'sheet=' referencing which image sheet the sequence should use
 sequenceData = {

                { name="seq2", sheet=sheet2, start=1, count=85, time=math.random(4000,9000), loopCount=0 },
                {name= "seq3", sheet= sheet3, start=1, count=63, time= 8000,loopCount=0},
              --  {name= "seq4", sheet= sheet4, start=1, count= 45, time= 4000,loopCount=0}

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



balloon05 = balloonClass.new ()
 screenGroup:insert(balloon05)

balloon06 = balloonClass.new ()
screenGroup:insert(balloon06)

balloon07 = balloonClass.new ()
 screenGroup:insert(balloon07)

  NotHero = balloonClass.new04 ()
screenGroup:insert(NotHero)

NotHero2 = balloonClass.new04 ()
screenGroup:insert(NotHero2)

NotHero3 = balloonClass.new04 ()
screenGroup:insert(NotHero3)


balloon08 = balloonClass.new ()
 screenGroup:insert(balloon08)

balloon09 = balloonClass.new ()
 screenGroup:insert(balloon09)

balloon010 = balloonClass.new ()
 screenGroup:insert(balloon010)

  balloon011 = balloonClass.new ()
 screenGroup:insert(balloon011)

balloon012 = balloonClass.new ()
 screenGroup:insert(balloon012)

-- star system set up 

badStar04 = balloonClass02.new02()
screenGroup:insert(badStar04)

badStar05 = balloonClass02.new02()
screenGroup:insert(badStar05)

badStar06 = balloonClass02.new02()
screenGroup:insert(badStar06)


helper01 = helperClass.new()
screenGroup:insert (helper01) 

helper02 = helperClass.new()
screenGroup:insert (helper02) 

helper03 = helperClass.new()
screenGroup:insert (helper03) 


helper04 = helperClass.new03()
screenGroup:insert (helper04) 

helper05 = helperClass.new03()
screenGroup:insert (helper05) 

helper06 = helperClass.new03()
screenGroup:insert (helper06) 

subTable = {"images/sub.png"}

subIndex = math.random (#subTable) 
sub = display.newImageRect( subTable [subIndex] , 64, 64)
sub.x = display.contentCenterX; 
sub.y = display.contentCenterY*4; 
transH07 = transition.to( sub, {time = 5000, delay = 2000, x = math.random(100,500), y = display.contentHeight-700, onComplete = nil} )
screenGroup:insert (sub)
sub:addEventListener( "touch", pointsTaker )

subpIndex = math.random (#subTable) 
subp = display.newImageRect( subTable [subpIndex] , 64, 64)
subp.x = display.contentCenterX; 
subp.y = display.contentCenterY*4; 
transH08 = transition.to( subp, {time = 17000, delay = 2000, x = math.random(100,500), y = display.contentHeight-700, onComplete = nil} )
screenGroup:insert (subp)
subp:addEventListener( "touch", pointsTaker )

subpsIndex = math.random (#subTable) 
subps = display.newImageRect( subTable [subpsIndex] , 64, 64)
subps.x = display.contentCenterX; 
subps.y = display.contentCenterY*4; 
transH09 = transition.to( subps, {time = 10000, delay = 2000, x = math.random(100,500), y = display.contentHeight-700, onComplete = nil} )
screenGroup:insert (subps)
subps:addEventListener( "touch", pointsTaker )

---------------- star table

enemy = display.newSprite( sheet3, sequenceData )
enemy.x = display.contentCenterX
enemy.y = display.contentCenterY
enemy:play( )
screenGroup:insert(enemy)

enemy01 = badClass.new ()
enemy01:scale( 0.80, 0.80 )
screenGroup:insert(enemy01)

enemy02 = badClass.new ()
enemy02:scale( 0.80, 0.80 )
screenGroup:insert(enemy02)

enemy03 = badClass.new ()
enemy03:scale( 0.80, 0.80 )
screenGroup:insert(enemy03)

enemy04 = badClass.new ()
enemy04:scale( 0.80, 0.80 )
screenGroup:insert(enemy04)

enemy05 = badClass.new ()
enemy05:scale( 0.80, 0.80 )
screenGroup:insert(enemy05)

enemy06 = badClass.new ()
enemy06:scale( 0.80, 0.80 )
screenGroup:insert(enemy06)

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

audio.play( soundFile1, {channel = 1} );
cleanUp();
storyboard.gotoScene( "menu2", "fade", 700 );

    end
end

function handleButtonEvent02( event )
     phase = event.phase 

   if "ended" == phase then
        print( "You pressed and released a button! & rest" )

audio.play( soundFile1, {channel = 2} );
cleanUp();
storyboard.gotoScene( "reset","zoomOutInFade", 200 );

    end
end

function handleButtonEvent03( event )
     phase = event.phase 

   if "ended" == phase then
        print( "You pressed and released a button! & Levels" )

audio.play( soundFile1, {channel = 3} );
cleanUp();
storyboard.gotoScene( "levels", "fade", 700 );

    end
end


function handleButtonEvent04( event )
     phase = event.phase 

   if "ended" == phase then
        print( "You pressed and released a button! & Levels" )

audio.play( soundFile1, {channel = 4} );

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


function growSwirl ( )
    
    transition.to( swirl, { xScale = xFacter+1, yScale = yFacter+1 } )

end

function moveballoons ()

trans1 = transition.to( balloon01, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = moveballoons} )

trans2 = transition.to( balloon02, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans3 = transition.to( balloon03, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans4 = transition.to( balloon04, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans5 = transition.to(  badStar04 , { time =1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans6 = transition.to(  badStar05, { time =1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans7 = transition.to(  badStar06 , { time =1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans8 = transition.to( balloon05, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil} )

trans9 = transition.to( balloon06, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans10 = transition.to( balloon07, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans11 = transition.to( balloon08, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans12 = transition.to( balloon09, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil} )

trans13 = transition.to( balloon010, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans14 = transition.to( balloon011, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )

trans15 = transition.to( balloon012, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70,display.contentHeight), onComplete = nil } )


end

--moveballoons()

killerGang=timer.performWithDelay( 100, moveballoons, 1 )



function moveEnemy ()

trans01 = transition.to( enemy, { time = 1000, x = math.random (70, display.contentWidth), y = math.random (70,display.contentHeight), onComplete = moveEnemy} )

trans02 = transition.to( enemy01, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70, display.contentHeight), onComplete = nil } )

trans03 = transition.to( enemy02, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70, display.contentHeight), onComplete = nil } )

trans04 = transition.to( enemy03, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70, display.contentHeight), onComplete = nil } )

trans05 = transition.to( enemy04, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70, display.contentHeight), onComplete = nil } )

trans06 = transition.to( enemy05, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70, display.contentHeight), onComplete = nil } )

trans07 = transition.to( enemy06, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70, display.contentHeight), onComplete = nil } )

trans08 = transition.to( NotHero, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70, display.contentHeight), onComplete = nil } )

trans09 = transition.to( NotHero2, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70, display.contentHeight), onComplete = nil } )

trans010 = transition.to( NotHero3, { time = 1000, x = math.random (70,display.contentWidth), y = math.random (70, display.contentHeight), onComplete = nil } )


end
--moveEnemy()
killer=timer.performWithDelay( 100, moveEnemy, 1 )



function  balloonTouch ( event )

if event.phase == "began" then 
	--event.target
	 print "touch"

transition.to( explosion , { time = 100, alpha = 1, x = event.x,  y= event.y,  onComplete =  setback } )
	
explosion:play()

scoreUpdate ()

transition.to( event.target, { time = 2, alpha = 0, onComplete = nil} ); 
--display.remove( event.target )
--event.target:removeEventListener( "touch", balloonTouch )

audio.play( soundFile,{channel = 1, onComplete = nil} )

counter()
growSwirl ()

	end 
	return true 
end
--[[
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

starcount ()

audio.play( soundFile,{channel = 1, onComplete = nil} )

  end 
  return true 
end
--]]
function BadstarTouch01(event)
  
  if event.phase == "began" then 

--transition.to( badStar01, { time = 10, alpha = 0, onComplete = nil} );
gameOver();
--transition.to( starDisplay[#starDisplay], { time = 10, alpha = 0, onComplete = nil} );
transition.to( explosion , { time = 100, alpha = 1, x = event.x,  y= event.y,  onComplete =  setback } )
  
metadata.score =metadata.score-40

end 
return true
end

function BadstarTouch02(event)
  
  if event.phase == "began" then 
  
--transition.to( badStar02, { time = 10, alpha = 0, onComplete = nil} );
--transition.to( starDisplay2[#starDisplay2], { time = 10, alpha = 0, onComplete = nil} );
transition.to( explosion , { time = 100, alpha = 1, x = event.x,  y= event.y,  onComplete =  setback } )
metadata.score =metadata.score-40
gameOver();
end 
return true
end

function BadstarTouch03(event)
  
  if event.phase == "began" then 
  
--transition.to( badStar03, { time = 10, alpha = 0, onComplete = nil} );
--transition.to( starDisplay3[#starDisplay3], { time = 10, alpha = 0, onComplete = nil} );
transition.to( explosion , { time = 100, alpha = 1, x = event.x,  y= event.y,  onComplete =  setback } )
gameOver();
metadata.score =metadata.score-40

end 
return true
end

function ememyTouch (event)
if event.phase == "began" then 
print "touch enemy"

scoreMinus()
audio.stop( Tick )

audio.play(soundEnmey, {channel = 5})
--audio.fadeOut(soundEnmey, {time= 3000 } );
--audio.setMaxVolume( 1, {channel=5} )
audio.setVolume( 0.30, {channel=5} )

end 
return true 
end



 function rotate ()
    if ( reverse == 0 ) then
      print "front"
        reverse = 1

        transition.to( enemy01, { rotation=-360, time=500,  alpha = 0.10, transition=easing.inOutCubic } )
        transition.to( enemy02, { rotation=-360, time=500,  alpha = 1, delay = 3000, transition=easing.inOutCubic } )
        transition.to( enemy03, { rotation=-360, time=500,  alpha =0.10,  delay = 6000, transition=easing.inOutCubic } )
        transition.to( enemy, { rotation=-360, time=500,    alpha =1,  delay = 6000, transition=easing.inOutCubic } )
        transition.to( enemy04, { rotation=-360, time=500,  alpha = 1, delay = 6000, transition=easing.inOutCubic } )
        transition.to( enemy05, { rotation=-360, time=500,  alpha = 1, delay = 6000, transition=easing.inOutCubic } )
        transition.to( enemy06, { rotation=-360, time=500, xScale = 0.80, yScale = 0.80, alpha = 1, delay = 6000, transition=easing.inOutCubic } )
        
        transition.to( badStar04, { rotation=-360, time=500,  alpha  = 0.10, transition=easing.inOutCubic } )
        transition.to( badStar05, { rotation=-360, time=500,  alpha  = 0.10, delay = 3000, transition=easing.inOutCubic } )
        transition.to( badStar06, { rotation=-360, time=500,  alpha = 1,  delay = 6000, transition=easing.inOutCubic } )
    else
      print "back"
        reverse = 0
         transition.to(badStar04, { rotation=360, time=500,  alpha = 1, transition=easing.inOutCubic } )
        transition.to( badStar05, { rotation=360, time=500,  alpha =1,   delay = 3000, transition=easing.inOutCubic } )
        transition.to( badStar06, { rotation=360, time=500,  alpha = 0.10,  delay = 6000, transition=easing.inOutCubic } )
        
        transition.to( enemy01, { rotation=360, time=500, alpha = 1, transition=easing.inOutCubic } ) 
        transition.to( enemy02, { rotation=360, time=500, alpha = 0.10,  delay = 3000, transition=easing.inOutCubic } )
        transition.to( enemy03, { rotation=360, time=500, alpha = 1,   delay = 6000, transition=easing.inOutCubic } )
        transition.to( enemy,   { rotation=360, time=500, alpha = 0.10,  delay = 6000, transition=easing.inOutCubic } )
        transition.to( enemy04,{ rotation=360, time=500, alpha =  0.10, delay = 6000, transition=easing.inOutCubic } )
        transition.to( enemy05,{ rotation=360, time=500, alpha =  0.10, delay = 6000, transition=easing.inOutCubic } )
        transition.to( enemy06,{ rotation=360, time=500, xScale= 1.8, yScale = 1.8,  alpha =  0.10, delay = 6000, transition=easing.inOutCubic } )
    
    end
end

moveBack=timer.performWithDelay( math.random(3000,5000), rotate, 0 )  -- Repeat forever

function rotate02 ()
  
        transition.to( balloon01, { rotation=-360, time=500,  alpha = 1, transition=easing.inOutCubic } )
        transition.to( balloon02, { rotation=-360, time=500,  alpha = 1, delay = 3000, transition=easing.inOutCubic } )
        transition.to( balloon03, { rotation=-360, time=500,  alpha = 1,  delay = 6000, transition=easing.inOutCubic } )
        transition.to( balloon04, { rotation=-360, time=500,    alpha =1,  delay = 6000, transition=easing.inOutCubic } )
        transition.to( balloon05, { rotation=-360, time=500,  alpha = 1, delay = 6000, transition=easing.inOutCubic } )
        transition.to( balloon06, { rotation=-360, time=500,  alpha = 1, delay = 6000, transition=easing.inOutCubic } )
        transition.to( balloon07, { rotation=-360, time=500, alpha = 1, delay = 6000, transition=easing.inOutCubic } )
        transition.to( balloon08, { rotation=-360, time=500, alpha = 1, delay = 6000, transition=easing.inOutCubic } )
        transition.to( balloon09, { rotation=-360, time=500, alpha = 1, delay = 6000, transition=easing.inOutCubic } )
        transition.to( balloon010, { rotation=-360, time=500, alpha = 1, delay = 6000, transition=easing.inOutCubic } )
        transition.to( balloon011, { rotation=-360, time=500, alpha = 1, delay = 6000, transition=easing.inOutCubic } )
        transition.to( balloon012, { rotation=-360, time=500, alpha = 1, delay = 6000, transition=easing.inOutCubic } )
        

 
end


function KeepWatch (  )
  if count == 32 then
    rotate02 () 
 -- Repeat forever untill  = 32
 end  
end
moveBack02=timer.performWithDelay( 1000, KeepWatch , 0 ) 



---function Move01 ( )

--TransMove01=transition.to(  enemy03 , { onStart = PlaySound , x = display.contentWidth+600 , time = 10000, delay = 2000, onComplete = Move02 } )

--end

--function Move02 ( )

--TransMove02=transition.to(  enemy03 , { onStart =  PlaySound , x = display.contentWidth-600, time = 10000, delay = 2000,  onComplete = Move01 } )
 
--end


--MoveAcross=timer.performWithDelay( 5000, Move01, 1 ) 
--[[
function  PlaySound ()
  

audio.play(soundEnmey02, {channel = 6})
--audio.fadeOut(soundEnmey, {time= 3000 } );
--audio.setMaxVolume( 1, {channel=5} )
audio.setVolume( 0.70, {channel=6} )

end
--]]
function helperTouch (event)
if event.phase == "began" then 
print "touch Helper"

transition.to( event.target, { time = 10, alpha = 0, onComplete = nil} ); 

metadata.timeLimit = metadata.timeLimit+5
timeLeft.text = metadata.timeLimit
audio.play(soundBeep, {channel = 5})
audio.stop( Tick )
--audio.fadeOut(soundEnmey, {time= 3000 } );
--audio.setMaxVolume( 1, {channel=5} )
audio.setVolume( 0.30, {channel=5} )

end 
return true 
end

function  pointsGiver (event)
 if (event.phase == "began") then  
 
print "touch Helper"

transition.to( event.target, { time = 10, alpha = 0, onComplete = nil} ); 
 metadata.score  = metadata.score + 20 
 scoreText.text = metadata.score

audio.play(soundBeep, {channel = 5})
audio.stop( Tick )
--audio.fadeOut(soundEnmey, {time= 3000 } );
--audio.setMaxVolume( 1, {channel=5} )
audio.setVolume( 0.30, {channel=5} )

 end 
 return true 
end
function  pointsTaker (event)
 if (event.phase == "began") then  
 
print "touch Helper"

transition.to( event.target, { time = 10, alpha = 0, onComplete = nil} ); 
 metadata.score  = metadata.score - 20 
 scoreText.text = metadata.score

audio.play(soundBeep, {channel = 5})
audio.stop( Tick )
--audio.fadeOut(soundEnmey, {time= 3000 } );
--audio.setMaxVolume( 1, {channel=5} )
audio.setVolume( 0.30, {channel=5} )

 end 
 return true 
end

function swirlTouch (event)
if event.phase == "began"  and count == 20 then 
print "touch swirl"
cleanUp();
audio.play(soundBeep, {channel = 5})
audio.stop( Tick )
audio.setVolume( 0.30, {channel=5} )
--storyboard.removeScene( level06 )
storyboard.gotoScene( "backworld0104", zoomOutIn,400)

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
--[[
function  starcount( event )

  print( metadata.Starcount07 )
  metadata.Starcount07 = metadata.Starcount07 +1 

end
--]]

 
function timerDown()
   metadata.timeLimit = metadata.timeLimit-1
   timeLeft.text = metadata.timeLimit
     metadata.SameTime=timeLeft.text
     if(metadata.timeLimit==5)then
     
     print "5 seconds left"

Tick = audio.play( soundClock,{channel = 15, onComplete = nil} )

   -- clockSound()
     
     else

     if(metadata.timeLimit==0)then
      audio.dispose( soundClock )
     gameOver()
        print("Time Out and game over ") -- or do your code for time out -- this will activate game over 
     end
  end
  end

timer01 = timer.performWithDelay(1000,timerDown,75)







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
 return true
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
audio.pause(Tick)
transition.pause( trans1)
transition.pause( trans2)
transition.pause( trans3)
transition.pause( trans4)
transition.pause( trans5)
transition.pause( trans6)
transition.pause( trans7)
transition.pause( trans8)
transition.pause( trans9)
transition.pause( trans10)
transition.pause( trans11)
transition.pause( trans12)
transition.pause( trans13)
transition.pause( trans14)
transition.pause( trans15)

transition.pause( transH01 )
transition.pause( transH02 )
transition.pause( transH03 )
transition.pause( transH04 )
transition.pause( transH05 )
transition.pause( transH06 )

transition.pause( transH07)
transition.pause( transH08)
transition.pause( transH09)

transition.pause( trans01)
transition.pause( trans02)
transition.pause( trans03)
transition.pause( trans04)
transition.pause( trans05)
transition.pause( trans06)
transition.pause( trans07)

transition.pause( trans08)
transition.pause( trans09)
transition.pause( trans010)

transition.pause( TransMove01)
transition.pause( TransMove02)
timer.pause( timer01  )
timer.pause( moveBack )
timer.pause( moveBack02 )
--timer.pause( MoveAcross )
timer.pause( ID1 )
timer.pause( ID2 )
timer.pause( ID3 )
timer.pause( ID4 )
timer.pause( ID5 )
timer.pause( ID6 )
balloon01:pause( )
balloon02:pause( )
balloon03:pause( )
balloon04:pause( )
balloon05:pause( )
balloon06:pause( )
balloon07:pause( )
balloon08:pause( )
balloon09:pause( )
balloon010:pause( )
balloon011:pause( )
balloon012:pause( )
helper01:pause( )
explosion:pause( )
enemy:pause()
enemy01:pause()
enemy02:pause()
enemy03:pause()
enemy04:pause()
enemy05:pause( )
enemy06:pause( )
badStar04:pause( )
badStar05:pause( )
badStar06:pause( )
swirl:pause(); 
end

function  pause11 ( event )
 audio.resume(Tick)
 transition.resume( trans1)

 transition.resume( trans2)

 transition.resume( trans3)

 transition.resume( trans4)

 transition.resume( trans5)

 transition.resume( trans6)

 transition.resume( trans7)


 transition.resume( trans8)

 transition.resume( trans9)

 transition.resume( trans10)

 transition.resume( trans11)

 transition.resume( trans12)

 transition.resume( trans13)
 
transition.resume( trans14)

transition.resume( trans15)

transition.resume(transH01)
transition.resume(transH02)
transition.resume(transH03)
transition.resume(transH04)
transition.resume(transH05)
transition.resume(transH06)
transition.resume( transH07)
transition.resume( transH08)
transition.resume( transH09)

 transition.resume( trans01)
 transition.resume( trans02)
 transition.resume( trans03)
 transition.resume( trans04)
 transition.resume( trans05)
  transition.resume( trans06)
  transition.resume( trans07)

  transition.resume( trans08)
  transition.resume( trans09)
  transition.resume( trans010)

transition.resume( TransMove01)
transition.resume( TransMove02)
--timer.resume(  MoveAcross )
timer.resume( ID1 )
timer.resume( ID2 )
timer.resume( ID3 )
timer.resume( ID4 )
timer.resume( ID5 )
timer.resume( ID6 )
balloon01:play( )
balloon02:play( )
balloon03:play( )
balloon04:play( )
helper01:play( )
balloon05:play( )
balloon06:play( )
balloon07:play( )
balloon08:play( )
swirl:play( )
balloon09:play( )
balloon010:play( )
balloon011:play( )
balloon012:play( )
badStar04:play( )
badStar05:play( )
badStar06:play( )

enemy:play()
enemy01:play()
enemy02:play()
enemy03:play()
enemy04:play()
enemy05:play()
enemy06:play()
explosion:play( )
 timer.resume( timer01  )
timer.resume( moveBack )
timer.resume( moveBack02 )  

tapfortap.removeAdView();
end


function coverTouch (event)
	if event.phase == "began" then 

 print "can't pass "

	end
return true 
end

function  cleanUp ()
print "i have clean up the Game"
transition.cancel(trans1 )
transition.cancel(trans2 )
transition.cancel(trans3 )
transition.cancel(trans4 )
transition.cancel(trans5)
transition.cancel(trans6 )
transition.cancel(trans7 )
transition.cancel(trans8 )
transition.cancel(trans9 )
transition.cancel(trans10) 
transition.cancel(trans11 )
transition.cancel(trans12 )
transition.cancel(trans13 )
transition.cancel(trans14) 
transition.cancel(trans15) 
transition.cancel(trans01 ) 
transition.cancel(trans02 )
transition.cancel(trans03 )
transition.cancel(trans04 )
transition.cancel(trans05 )
transition.cancel(trans06 )
transition.cancel(trans07 )
transition.cancel(transH01)
transition.cancel(transH02)
transition.cancel(transH03)
transition.cancel(transH04)
transition.cancel(transH05)
transition.cancel(transH06)
transition.cancel(transH07)
transition.cancel(transH08)
transition.cancel(transH09)

transition.cancel(trans08 )
transition.cancel(trans09 )
transition.cancel(trans010 )

 timer.cancel( timer01  )
timer.cancel( killerGang )
 timer.cancel( killer )
 timer.cancel( moveBack )
timer.cancel( moveBack02 )

--timer.cancel( MoveAcross )
audio.stop( Tick )
timer.cancel( ID1 )
timer.cancel( ID2 )
timer.cancel( ID3 )
timer.cancel( ID4 )
timer.cancel( ID5 )
timer.cancel( ID6 )
transition.cancel( )
transition.cancel(TransMove01)
transition.cancel( TransMove02)
transition.cancel( ) 
end

function gameOver ( event )
--SaveData07(); 
-- prevent back touch 
--storyboard.gotoScene("levels","fade",400)
cleanUp(); 
storyboard.gotoScene("lost",slideRight,900)

end 
--[[
function  nextLevel (event) 

if (count == 0 ) then 

levels[5] = 3
levels[6] = 1
saveLevels()
win()

end 
end 



checker=timer.performWithDelay( 1000 , nextLevel, 0 )


function  win ( event )
  
SaveData05(); 
storyboard.gotoScene("win",slideRight,900)

cleanUp(); 

end
--]]

--[[
function  SaveData07 ( event )
  
  StarTableSeven = {}

  print ("Every Is okay on level 7 ");

StarTableSeven["LevelSevenStars"] = metadata.Starcount07

 saveTable (StarTableSeven,"LevelSevenStars.txt")


end
---]]
-----------------------------------------------

function helpers()

transH01 = transition.to( helper01, {time = 5000, delay = 2000, x = math.random(100,500), y = display.contentHeight-700, onComplete = nil} )


end
ID1=timer.performWithDelay( math.random(2000,5000), helpers, 1)

function helpers02()

transH02 = transition.to( helper02, {time = 5000, delay = 2000,  x = math.random(100,500), y = display.contentHeight-700, onComplete = nil} )


end
ID2=timer.performWithDelay( math.random(5000,20000), helpers02, 1)

function helpers03()

transH03 = transition.to( helper03, {time = 5000, delay = 2000, x = math.random(100,500), y = display.contentHeight-700, onComplete = nil} )


end
ID3=timer.performWithDelay( math.random(5000,15000), helpers03, 1)
------------------------------------------------------------------------

function helpers04()

transH04 = transition.to( helper04, {time = 5000, delay = 2000, x = math.random(100,500), y = display.contentHeight-700, onComplete = nil} )


end
ID4=timer.performWithDelay( math.random(2000,5000), helpers04, 1)

function helpers05()

transH05 = transition.to( helper05, {time = 5000, delay = 2000,  x = math.random(100,500), y = display.contentHeight-700, onComplete = nil} )


end
ID5=timer.performWithDelay( math.random(5000,20000), helpers05, 1)

function helpers06()

transH06 = transition.to( helper06, {time = 5000, delay = 2000, x = math.random(100,500), y = display.contentHeight-700, onComplete = nil} )


end
ID6=timer.performWithDelay( math.random(5000,15000), helpers06, 1)


-------------------------------------------------------------------------
function  SaveBalloons ( event )
  

BalloonPopData["BalloonTable"] = balloonLoader

saveTable (BalloonPopData,"BalloonPop.txt")


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

badStar04:addEventListener( "touch", BadstarTouch01)
badStar05:addEventListener( "touch", BadstarTouch02)
badStar06:addEventListener( "touch", BadstarTouch03)

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
screenGroup = self.view
SaveBalloons()
audio.resume( )
display.remove(balloon01);
display.remove(balloon02);
display.remove(balloon03);
display.remove(balloon04);
display.remove(balloon05);
display.remove(balloon06);
display.remove(balloon07);
display.remove(balloon08);
display.remove(balloon09);
display.remove(balloon010);
display.remove( enemy );
display.remove( enemy01 );
display.remove( enemy02 );   
display.remove( badStar01 );
display.remove( badStar02 );
display.remove( badStar03 );
display.remove( helper01 )
display.remove( helper02 )
display.remove( helper03 )
display.remove( helper04 )
display.remove( helper05 )
display.remove( helper06 )
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







