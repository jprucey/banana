
display.setStatusBar(display.HiddenStatusBar)

centerX = display.contentCenterX
centerY = display.contentCenterY
screenLeft = display.screenOriginX
screenWidth = display.contentWidth - screenLeft * 2
screenRight = screenLeft + screenWidth
screenTop = display.screenOriginY
screenHeight = display.contentHeight - screenTop * 2
screenBottom = screenTop + screenHeight



GameLoop = {}
 function GameLoop()
	

local dict = nil
local theWord

local charList =nil
local theRoll = nil
local gridGroup=nil
local submitBtn
local score =nil
local score =nil

local score3=nil





local dict = {}
local theWord

local charList = {{0,false,false,true},{0,false,false,true},{0,false,false,true},{0,false,false,true},{0,false,false,true},{0,false,false,true}} 
local theRoll = {0,0,0,0,0,0}
local gridGroup
local submitBtn
local score =0
local score =0
local tile={}
local score3=0


-- add another character onto the word being built
local function addToTheWord(idx,letter)
	theWord.text = theWord.text .. letter
	theWord.x = centerX
	submitBtn.isVisible = true --dict[theWord.text]
end


-- -------------------------------------tile TAPED, (and dim it out)
local function tileTapped(event)
	print ("tapped")
	if (charList[event.target.idx][4]) ==true  then  --is hitable
	 
	if event.target.alpha == 1 then
		event.target.alpha = .70
	
		
	charList[event.target.idx][3]  = true 
	charList[event.target.idx][1] = event.target.letter
	charList[event.target.idx][2] = true
	
	else 
		
		event.target.alpha = 1
	
	charList[event.target.idx][1] = 0
	charList[event.target.idx][2] = false
	charList[event.target.idx][3] = false
	
	event.target.isScoreable = false 
		print (event.target.isScoreable)
		print (event.target.idx)
		print (event.target.letter)
	end
	print ("list "..event.target.idx.." "..charList[event.target.idx][1])
	
for x = 1, #charList do
--
--	---------------------------add scoring functions

	if charList[x][3]  == true then
	

if  (charList[x][1])==1 then 
	      score=score+100
	charList[x][3] = false
		print("score +100")
end
	     if 
			 (charList[x][1])==5 then
			 score=score+50
		 charList[x][3] = false
		 	print("score +50")
		end
 end
--		
print (charList[x][1])
print (charList[x][2])
end	
	
	
theScore.text= score

score3=score3+score
print ("score3 "..score3 )
score=0
	end
end



	local ok =0
                                        -------------------------------------------------------Check for Score 
	local function checkForScore( r)	
		
		print ("Check For score")
	local one =0
		local five =0
	
		
if r== 1 then
	one = one +1
end 
if r== 5 then
	five = five +1
end		
		
	if one>0 then 
		ok=ok+1
		print("ok")	
		else print("no 1")
		
	end	
				
	if five>0 then 
		ok=ok+1
		print("ok")	
		else print("no 5")
		
	end	
		
		if ok<1 then
			print("farkle")
			
			else
			print("pass")
		end	
	print("ok   "..ok)
	end







------------------------------------------------- create the grid of letters
local function createGrid()
	gridGroup = display.newGroup ( )
	--gridGroup.alpha=.5
	
	local tileWidth = 67
	local tileHeight = 67
	local colSpace = 5
	local rowSpace = 50
	local numCols = 6
	local numRows = 1
	
	local xPos = centerX - (numCols * tileWidth + numCols * colSpace) / 2
	local yPos = screenTop +10
	
	local idx = 1
	
	
	for col = 1, numCols do
		for row = 1, numRows do
			
			if (tile[col]==nil)  then -- if the image was destroyed in the  score/roll function , otherwise skip
				
			local r = math.random(6)
		
				
			 tile[col]= display.newImage("images/" .. r .. ".png")   -- Randon R is used for image and letter/number
		
			tile[col]:scale ( .5, .5 )
			tile[col].x = xPos + col * (tileWidth + colSpace) - tileWidth/2 - colSpace
			tile[col].y = yPos + row * (tileHeight + rowSpace) - tileHeight/2 - rowSpace
			tile[col].gridPos = {x=col, y=row}
			tile[col].letter = r                                                --changed letter to represent a NUMBER now instead
			tile[col].idx = idx                                                 --Dice identifier IDX
			tile[col] .isScoreable=false
			tile[col]:addEventListener("tap", tileTapped)
			print ("idx"..idx.. "Number".. tile[col].letter)
			gridGroup:insert(tile[col])
			 checkForScore(r) 
			                                     
			end
			
		idx = idx + 1 -- increment the image weather skipped or not 
		end
	end
if ok<1 then
	farkle.text= "Farkle"
	end
end
  







--	---------------------------SUBMIT HIT add scoring functions
local function submitWord()
	submitBtn.isVisible = true
	theWord.text = ""
	score2="0"
	score="0"
	print ("button")
	 ok =0
	
for x = 1, 6 do
--		
if charList[x][2] == true then --if selected
	--checkForScore()	
	--if(charList[x][4])==true then
	
         if  	(charList[x][1]) ==1 then 
		          score2=score2+100
		  charList[x][4] = false  
			tile[x].alpha=.15
	
		elseif
				 (charList[x][1]) ==5 then
				 score2=score2+50
			 charList[x][4] =false  
				  tile[x].alpha=.15
				  	
         end
end  
   
if
			 	 (charList[x][1])==0 then
			tile[x]:removeSelf()
			tile[x]=nil
end		  
		 
	
--		
print ("ONE.."..  charList[x][1])
print ("TWO  " , charList[x][2])

end	

	theScore2.text= score2

	theScore.text= "0"
	firstTime = false
	createGrid()
--end
end


function newGame()
	
	GameLoop()
end




local function setUpDisplay()
	local bg = display.newRect(screenLeft, screenTop, screenWidth, screenHeight)
	bg:setFillColor(123, 96, 255)

	theWord = display.newText( "", 0, 0, "Helvetica", 44 )
	theWord:setTextColor ( 2, 0, 122 )
	theWord.x = centerX
	theWord.y = screenBottom - 27
	--theWord:addEventListener("tap", eraseCharacter)

	submitBtn = display.newImage("images/submit.png")
	submitBtn:scale ( .7, .7 )
	submitBtn.x = screenRight - 47
	submitBtn.y = screenBottom - 22
	submitBtn.isVisible = true
	submitBtn:addEventListener("tap", submitWord)
	
	theScore = display.newText( "0", 0, 0, "Helvetica", 44 )
	theScore:setTextColor ( 2, 0, 122 )
	theScore.x = screenLeft +50
	theScore.y = screenBottom - 27
	--theScore:addEventListener("tap", eraseCharacter)

	theScore2 = display.newText( "2", 0, 0, "Helvetica", 44 )
	theScore2:setTextColor ( 2, 0, 122 )
	theScore2.x = screenLeft +50
	theScore2.y = screenBottom - 77
	
	farkle = display.newText( "", 0, 0, "Helvetica", 60 )
	farkle:setTextColor ( 2, 0, 122 )
	farkle.x = centerX
	farkle.y = centerY
	--farkle:addEventListener("tap", newGame)
	
	
	
	

	createGrid()
end

setUpDisplay()
end
--
GameLoop()