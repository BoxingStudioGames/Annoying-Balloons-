---local  titlebar = "no title bar"
 local storyboard = require("storyboard")
 local widget  =  require  ("widget")

 --Saving/Loading Stuff
 local ego = require "ego"
 --local saveFile = ego.saveFile
 local loadFile = ego.loadFile

 highscore = 0
 score = 0 
--Load highscore value from file. (It will initally be a string.)
highscore = loadFile ("gameScores.txt")

local centerX = display.contentWidth / 2
local centerY = display.contentHeight / 2

 -----------------------------------------------------------------------imports 
-- storyboard.purgeOnSceneChange = true

 local scene = storyboard.newScene()
 
 
 
 
 function scene:createScene(event)
  local screenGroup = self.view
  -- background 
   background = display.newImage("bg/bglost.png",true)
   background:scale(2,2)
   screenGroup:insert(background)
    

highscoreText = display.newText("" .. highscore, 0, 0, "Arial", 40)
highscoreText:setTextColor(255, 250, 0 )
highscoreText.x = centerX;
highscoreText.y = 330;
screenGroup:insert(highscoreText)--]]


scoreText = display.newText("" .. score, 0, 0, "Arial", 40)
scoreText:setTextColor(250,250,0)
scoreText.x = centerX
scoreText.y = 230
screenGroup:insert(scoreText)


 
level01 = display.newImage("images/lost.png")
level01:setReferencePoint(display.BottomLeftReferencePoint)
level01 .x = -20;
level01 .y = 80;
playIntro = transition.to(level01,{time=3000, x= 60, onComplete=resumeReady})
screenGroup:insert(level01);
 
 
displayscore = display.newImage("images/score.png")
displayscore.x = centerX
displayscore.y = 170
screenGroup:insert(displayscore)


highdisplayscore = display.newImage("images/high.png")
highdisplayscore.x = centerX
highdisplayscore.y = 290
screenGroup:insert(highdisplayscore)



  myButton03 = widget.newButton
{
     left  = -105,
     top =  390,
    width = 100,
    height = 50,
    defaultFile = "levels.png",
    overFile = "taps/level02.png",
    id = "button_3",
    onEvent = handleButtonEvent03,

}


  playIntro = transition.to(myButton03,{time=3000, x=150, onComplete=resumeReady})

screenGroup:insert( myButton03 )




  myButton4 = widget.newButton
{
   left=  -218,
     top = 507,
    width = 100,
    height = 50,
    defaultFile = "store.png",
    overFile = "taps/store02.png",
    id = "button_4",
    onEvent = handleButtonEvent4,
  
}

playIntro = transition.to(myButton4,{time=4000, x=250, onComplete=resumeReady}) 
screenGroup:insert( myButton4 )



  myButton5 = widget.newButton
{
   left=   -115,
     top = 450,
    width = 100,
    height = 50,
    defaultFile = "leader borad.png",
    overFile = "taps/leader02.png",
    id = "button_5",
    onEvent = handleButtonEvent5,
  
}


playIntro = transition.to(myButton5,{time=5000, x=150, onComplete=resumeReady})

screenGroup:insert( myButton5 )





 myButton6 = widget.newButton
{
   left=  -110,
     top = 507,
    width = 100,
    height = 50,
    defaultFile = "taps/menu01.png",
    overFile = "taps/menu02.png",
    id = "button_6",
    onEvent = handleButtonEvent06,
  
}

playIntro = transition.to(myButton6,{time=1000, x= 60, onComplete=resumeReady})    

screenGroup:insert( myButton6)





newhighscore = display.newImage("images/newhigh score.png")
newhighscore.x = -1000;
newhighscore.y = -1000;
newhighscore.alpha = 1; 
screenGroup:insert(newhighscore)



 end  -- end of create scene
 
   
   function handleButtonEvent06( event )
     phase = event.phase 

    if "ended" == phase then
        print( "You pressed and released a button!" )

storyboard.gotoScene("menu2","slideRight",700)   


    end
end





  function handleButtonEvent03( event )
     phase = event.phase 

    if "ended" == phase then
        print( "You pressed and released a button!" )

storyboard.gotoScene("levels","slideRight",700)   


    end
end




--[[function levelUp (event)

if event.phase == "began" then 

print "levels"

storyboard.gotoScene("levels","fade",400)

    end 
end--]]

function mainUp (event)

if event.phase == "began" then 

 print "menu"

storyboard.gotoScene("menu2","fade",400)


end
end 


--[[function nextUp (event)

if event.phase == "began" then 

print "next level "

storyboard.gotoScene("level2","fade",400)


end 
end --]]
 
 
 
 -----------------------------------------------------------------------------------------------------------------------------------------------------store 
 function handleButtonEvent4( event )
     phase = event.phase 


local function onComplete( event )
  print( "index => ".. event.index .. "    action => " .. event.action )

  local action = event.action
if "clicked" == event.action then 
    if 2 == event.index then         

system.openURL( "http://boxingstudioapps.comule.com/" )

end 
end

    local action = event.action
  if "clicked" == event.action then
    if 1 == event.index then
      -- Open url if "Learn More" was clicked by the user
      system.openURL( "https://play.google.com" )
    end
  elseif "cancelled" == event.action then
    -- our cancelAlert timer function dismissed the alert so do nothing
  end
end


    if "ended" == phase then
        print( "You pressed and released a button!" )


local alert = native.showAlert( "Boxing Studio Games", " Sorry the store is not  available yet to learn more go to our site ", { "OK", "Site","Later" }, onComplete )

-- Dismisses alert after 5 seconds
local function cancelAlert()
  native.cancelAlert( alert )
end

timer.performWithDelay( 7000, cancelAlert )



    end
end



-----------------------------------------------------------leader board ------------------------------------------------------------
 function handleButtonEvent5( event )
     phase = event.phase 


local function onComplete( event )
  print( "index => ".. event.index .. "    action => " .. event.action )

  local action = event.action
if "clicked" == event.action then 
    if 2 == event.index then         

system.openURL( "http://boxingstudioapps.comule.com/" )

end 
end

    local action = event.action
  if "clicked" == event.action then
    if 1 == event.index then
      -- Open url if "Learn More" was clicked by the user
      system.openURL( "https://play.google.com" )
    end
  elseif "cancelled" == event.action then
    -- our cancelAlert timer function dismissed the alert so do nothing
  end
end


    if "ended" == phase then
        print( "You pressed and released a button!" )


local alert = native.showAlert( "Boxing Studio Games", " Sorry  the Leader Board  is not available yet, soon you will  be able to compete with your friends and family, to learn more go to our site. ", { "OK", "Site","Later" }, onComplete )

-- Dismisses alert after 5 seconds
local function cancelAlert()
  native.cancelAlert( alert )
end

timer.performWithDelay( 10000, cancelAlert )



    end
end


---------------------leader board --------------------------------------------------------------




 
  function scene:enterScene(event)
  	  local screenGroup = self.view

   
--next:addEventListener ("touch", nextUp)

--main:addEventListener ("touch", mainUp)

--levels:addEventListener ("touch", levelUp)

  end 
 
 
 
 
  function scene:exitScene(event)
 
  local screenGroup = self.view
--main:removeEventListener ("touch", mainUp)

--levels:removeEventListener ("touch", levelUp)

   
 
   	
  end
  
   function scene:destroyScene(event)
     local screenGroup = self.view
   end
 

  
 
scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene) 
scene:addEventListener("exitScene",scene) 
scene:addEventListener("destroyScene",scene) 

return scene