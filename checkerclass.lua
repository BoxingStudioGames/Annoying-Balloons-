
module(..., package.seeall )


local metadata  = require ("metadata")


function new ( passIn )  
print "hellow"
if (passIn)  then
print "okay pass"
if (passIn =="levelOne") then

	print "every thing is okay now&&&"


StarTableOne = loadTable  ("LevelOneStars.txt")
LevelOneStar =StarTableOne["LevelOneStars"]

if LevelOneStar == 1 then 

print ("show Level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )

else if LevelOneStar == 2 then 

print ("show two level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )


else if LevelOneStar == 3 then 

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars3, {time = 6000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
  print ("show three level one") 

else if LevelOneStar == 0 then
 
print ("player did not collect any stars")

end 
end 
end 
end 
end 
end 
end 
--------------------------------------level02 --------------------------------------------------



function new02 ( passIn02 )  
print "hellow 02 "
if (passIn02)  then
print "okay pass level02"

if (passIn02 =="levelTwo") then

	print "every thing is okay now&&&"


StarTableTwo = loadTable  ("LevelTwoStars.txt")
LevelTwoStar = StarTableTwo["LevelTwoStars"]

if LevelTwoStar == 1 then 

print ("show Level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )

else if LevelTwoStar == 2 then 

print ("show two level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )


else if LevelTwoStar == 3 then 

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars3, {time = 6000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
  print ("show three level one") 

else if LevelTwoStar == 0 then
 
print ("player did not collect any stars")

end 
end 
end 
end 
end 
end 
end 
-------------------------------------------------------------------------------------------


--------------------------------------level03 --------------------------------------------------

function new03 ( passIn03 )  
print "hellow 03 "
if (passIn03)  then
print "okay pass level03"

if (passIn03 =="levelThree") then

	print "every thing is okay now&&03"


StarTableThree = loadTable  ("LevelThreeStars.txt")
LevelThreeStar = StarTableThree["LevelThreeStars"]

if LevelThreeStar == 1 then 

print ("show Level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )

else if LevelThreeStar == 2 then 

print ("show two level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )


else if LevelThreeStar == 3 then 

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars3, {time = 6000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
  print ("show three level one") 

else if LevelThreeStar == 0 then
 
print ("player did not collect any stars")

end 
end 
end 
end 
end 
end 
end 
--------------------------------------------level04---------------------------------------------
function new04 ( passIn04 )  
print "hellow 04 "
if (passIn04)  then
print "okay pass level04"

if (passIn04 =="levelFour") then

	print "every thing is okay now&&04"


StarTableFour = loadTable  ("LevelFourStars.txt")
LevelFourStar = StarTableFour["LevelFourStars"]

if LevelFourStar == 1 then 

print ("show Level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )

else if LevelFourStar == 2 then 

print ("show two level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )


else if LevelFourStar == 3 then 

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars3, {time = 6000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
  print ("show three level one") 

else if LevelFourStar == 0 then
 
print ("player did not collect any stars")

end 
end 
end 
end 
end 
end 
end 
--------------------------------------level04------------------------------------------------------------


--------------------------------------------level05---------------------------------------------
function new05 ( passIn05 )  
print "hellow 05 "
if (passIn05)  then
print "okay pass level05"

if (passIn05 =="levelFive") then

	print "every thing is okay now&&05"


StarTableFive = loadTable  ("LevelFiveStars.txt")
LevelFiveStar = StarTableFive["LevelFiveStars"]

if LevelFiveStar == 1 then 

print ("show Level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )

else if LevelFiveStar == 2 then 

print ("show two level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )


else if LevelFiveStar == 3 then 

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars3, {time = 6000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
  print ("show three level one") 

else if LevelFiveStar == 0 then
 
print ("player did not collect any stars")

end 
end 
end 
end 
end 
end 
end 
--------------------------------------level05------------------------------------------------------------
--------------------------------------------level06---------------------------------------------
function new06 ( passIn06 )  
print "hellow 06 "
if (passIn06)  then
print "okay pass level06"

if (passIn06 =="levelSix") then

	print "every thing is okay now&&06"


StarTableSix = loadTable  ("LevelSixStars.txt")
LevelSixStar = StarTableSix["LevelSixStars"]

if LevelSixStar == 1 then 

print ("show Level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )

else if LevelSixStar == 2 then 

print ("show two level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )


else if LevelSixStar == 3 then 

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars3, {time = 6000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
  print ("show three level one") 

else if LevelSixStar == 0 then
 
print ("player did not collect any stars")

end 
end 
end 
end 
end 
end 
end 
--------------------------------------level06------------------------------------------------------------
--------------------------------------------level07---------------------------------------------
function new07 ( passIn07 )  
print "hellow 07 "
if (passIn07)  then
print "okay pass level07"

if (passIn07 =="levelSeven") then

	print "every thing is okay now&&07"


StarTableSeven = loadTable  ("LevelSevenStars.txt")
LevelSevenStar = StarTableSeven["LevelSevenStars"]

if LevelSevenStar == 1 then 

print ("show Level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )

else if LevelSevenStar == 2 then 

print ("show two level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )


else if LevelSevenStar == 3 then 

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars3, {time = 6000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
  print ("show three level one") 

else if LevelSevenStar == 0 then
 
print ("player did not collect any stars")

end 
end 
end 
end 
end 
end 
end 
--------------------------------------level07------------------------------------------------------------

--------------------------------------------level08---------------------------------------------
function new08 ( passIn08 )  
print "hellow 08 "
if (passIn08)  then
print "okay pass level08"

if (passIn08 =="levelEight") then

	print "every thing is okay now&&08"


StarTableEight = loadTable  ("LevelEightStars.txt")
LevelEightStar = StarTableEight["LevelEightStars"]

if LevelEightStar == 1 then 

print ("show Level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )

else if LevelEightStar == 2 then 

print ("show two level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )


else if LevelEightStar == 3 then 

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars3, {time = 6000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
  print ("show three level one") 

else if LevelEightStar == 0 then
 
print ("player did not collect any stars")

end 
end 
end 
end 
end 
end 
end 
--------------------------------------level08------------------------------------------------------------


--------------------------------------------level09---------------------------------------------
function new09 ( passIn09 )  
if (passIn09)  then
print "okay pass level09"

if (passIn09 =="levelNine") then

	print "every thing is okay now&&09"


StarTableNine = loadTable  ("LevelNineStars.txt")
LevelNineStar = StarTableNine["LevelNineStars"]

if LevelNineStar == 1 then 

print ("show Level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )

else if LevelNineStar == 2 then 

print ("show two level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )


else if LevelNineStar == 3 then 

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars3, {time = 6000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
  print ("show three level one") 

else if LevelNineStar == 0 then
 
print ("player did not collect any stars")

end 
end 
end 
end 
end 
end 
end
--------------------------------------level09------------------------------------------------------------

--------------------------------------------level010---------------------------------------------
function new010 ( passIn010 )  
if (passIn010)  then
print "okay pass level010"

if (passIn010 =="levelTen") then

	print "every thing is okay now&&010"


StarTableTen = loadTable  ("LevelTenStars.txt")
LevelTenStar = StarTableTen["LevelTenStars"]

if LevelTenStar == 1 then 

print ("show Level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )

else if LevelTenStar == 2 then 

print ("show two level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )


else if LevelTenStar == 3 then 

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars3, {time = 6000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
  print ("show three level one") 

else if LevelTenStar == 0 then
 
print ("player did not collect any stars")

end 
end 
end 
end 
end 
end 
end
--------------------------------------level010------------------------------------------------------------

--------------------------------------------level011---------------------------------------------
function new011 ( passIn011 )  
if (passIn011)  then
print "okay pass level011"

if (passIn011 =="levelEleven") then

	print "every thing is okay now&&011"


StarTableEleven = loadTable  ("LevelElevenStars.txt")
LevelElevenStar = StarTableEleven["LevelElevenStars"]

if LevelElevenStar == 1 then 

print ("show Level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )

else if LevelTenStar == 2 then 

print ("show two level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )


else if LevelElevenStar == 3 then 

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars3, {time = 6000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
  print ("show three level one") 

else if LevelElevenStar == 0 then
 
print ("player did not collect any stars")

end 
end 
end 
end 
end 
end 
end
--------------------------------------level011------------------------------------------------------------
--------------------------------------------level012---------------------------------------------
function new012 ( passIn012 )  
if (passIn012)  then
print "okay pass level012"

if (passIn012 =="levelTwelve") then

	print "every thing is okay now&&012"


StarTableTweleve = loadTable  ("LevelTwelveStars.txt")
LevelTwelveStar = StarTableTweleve["LevelTwelveStars"]

if LevelTwelveStar == 1 then 

print ("show Level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )

else if LevelTwelveStar == 2 then 

print ("show two level one ")

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )


else if LevelTwelveStar == 3 then 

transition.to( stars1, {time = 2000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars2, {time = 4000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
transition.to( stars3, {time = 6000, delay = 1000, rotation = 360, alpha = 1, onComplete = nil } )
  print ("show three level one") 

else if LevelTwelveStar == 0 then
 
print ("player did not collect any stars")

end 
end 
end 
end 
end 
end 
end
--------------------------------------level012------------------------------------------------------------
