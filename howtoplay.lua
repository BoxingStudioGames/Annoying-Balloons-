--
-- main.lua
-----------------------------------------------------------------------------------------





---local  titlebar = "no title bar"
 local storyboard = require("storyboard")
storyboard.purgeOnSceneChange = true
 local scene = storyboard.newScene()
 
 --local screenGroup = self.view
 
 
 
 
 
 
 function scene:createScene(event)
  local screenGroup = self.view
  -- background 
page1 = display.newImageRect( "page01.png", display.contentWidth, display.contentHeight )
page1:setReferencePoint( display.TopleftReferencePoint )
page1.x, page1.y = display.contentWidth*0.5, display.contentHeight*0.5   
    
 
page2 = display.newImageRect( "page2.jpg", display.contentWidth, display.contentHeight )
page2.x, page2.y = display.contentWidth*0.5, display.contentHeight*0.5
page2:toBack()	-- make sure 2nd page is underneath the first one

 
curlPage = display.newImageRect( "curlPage.png", display.contentWidth, display.contentHeight )
curlPage.x, curlPage.y = display.contentWidth*0.5, display.contentHeight*0.5
curlPage.isVisible = false

 end  -- end of create scene
 



 --display.setStatusBar( display.HiddenStatusBar )

-- create example pages





-- group to hold the page that will be turned (as well as the "curl" page)
local turnGroup = display.newGroup()

-- The following function will turn the page "back"
local function gotoPrevious( curlPage, time )
	local time = time or 500
	
	curlPage.isVisible = true
	local hideCurl = function()
		curlPage.isVisible = false
		turnGroup:setMask( nil )
	end
	transition.to( turnGroup, {maskX=display.contentWidth*0.5+100, time=time } )
	transition.to( curlPage, { rotation=45, x=display.contentWidth+(display.contentWidth*0.10), y=display.contentHeight + (display.contentHeight*0.25), time=time, onComplete=hideCurl })
end

-- The following function will turn the page "forward"
local function gotoNext( currentPage, curlPage, time )
	-- add "pages" to page turning group
--	turnGroup:insert( currentPage )
--	turnGroup:insert( curlPage )
	
	-- mask should match dimensions of content (e.g. content width/height)
     curlMask = graphics.newMask( "mask_320x480.png" )	-- iPhone portrait
	--local curlMask = graphics.newMask( "mask_768x1024.png" )	-- iPad portrait
--	turnGroup:setMask( curlMask )
	
	-- set initial mask position
	turnGroup.maskX = display.contentWidth * 0.5+100
	turnGroup.maskY = display.contentHeight * 0.5

	-- prepare the page-to-be-turned and the curl image
    currentPage:setReferencePoint( display.BottomLeftReferencePoint )
	curlPage:setReferencePoint( display.BottomRightReferencePoint )
	curlPage.rotation = 45
	curlPage.x = display.contentWidth+(display.contentWidth*0.10)
	curlPage.y = display.contentHeight + (display.contentHeight*0.25)
	curlPage.isVisible = true
	
	-- show pagecurl animation and transition away (next page should already be in position)
	 time = time or 500
	transition.to( turnGroup, { maskX=-display.contentWidth*0.75, time=time } )
	transition.to( curlPage, { rotation=0, x=0, y=display.contentHeight+20, time=time} )
	curlPage.yScale = curlPage.y * 0.2
end

-- initiate page turn after 2 seconds, turn page back after 5 seconds (3 seconds after first turn)
--timer.performWithDelay( 2000, function() gotoNext( page1, curlPage, 500 ); end )
--timer.performWithDelay( 5000, function() gotoPrevious( curlPage, 500 ); end )
 
 
  local function scrollListener( event )
	local phase = event.phase
	local direction = event.direction
	
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
		elseif "right" == direction then
			print( "Reached Right Limit" )
		end
	end
			
	return true
end

-- Create a ScrollView
local scrollView = widget.newScrollView
{
	left = 0,
	top = 0,
	width = display.contentWidth,
	height = display.contentHeight,
	bottomPadding = 50,
	id = "onBottom",
	horizontalScrollDisabled = false ,
	verticalScrollDisabled = true ,
	hideBackground = true, 
	listener = scrollListener,
	hideScrollBar = true,
}
 
  function scene:enterScene(event)
  	


   
  end 
 
 
 
 
  function scene:exitScene(event)
 
 
 
   	
  end
  
   function scene:destroyScene(event)
   
   end
 

  
 
scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene) 
scene:addEventListener("exitScene",scene) 
scene:addEventListener("destroyScene",scene) 

return scene