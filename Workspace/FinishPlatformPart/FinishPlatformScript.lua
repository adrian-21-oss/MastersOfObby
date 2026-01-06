

local part = script.Parent
local playersInGame = require(game.Workspace.PlayersInGame)

local playersInFinishLine = require(game.Workspace.Maps.Map1.Structure.Parts.FinishPlatform.TransparentPart.FinishedPlayers)


local frameGapsVertical = 100


-- FIXED ALREADY -- BUT WE NEED TO DO THIS IN EVERY MAP THE PROBLEM 1: WHEN THE PLAYER DIES AND TOUCHED THE FINISH LINE, IT IS NOT INCLUDED IN THE TABLE AS FINISHED PLAYERS, SAME AS THE CHECKPOINTS

-- FIXED ALREADY -- THE PROBLEM 2: WHEN THE ONE OR MORE PLAYERS ARE FINISHED BUT ONE OR MORE PERSON LEAVES THE GAME, THE GAME BUGS AND STUCK, some occurences is that PLAYER THAT LEFT WILL DIE BUT TELEPORTED TO THE FIRST CHECKPOINT (FIX IT)


-- WILL WORK ON NOW:

	-- THE PROBLEM (Minor Bugs): WHEN TWO PEOPLE GOES INTO THE FINISH AT ALMOST SAME TIME, IT WILL ONLY DISPLAY ONE OF THEM.. I TRIED IT AND WHEN THE ONE OF THE TWO LEAVE, ONE THAT PERSON WILL BE DISPLAYED.. IDK IT'S JUST PROB LAG
	-- Add Music
	-- Add Design to the UI
	-- Add more items/skills/characters
	-- Add more gamepasses



-- IMPROVEMENTS:
	-- Add Details and Design to the maps
	-- Add Sound Effects
	-- Add Animations
	-- Add more maps
	-- Add more difficulties/gamemodes

local PlayersService = game:GetService("Players")


local players = game.Players:GetChildren()



local timer = require(game.ServerScriptService.timer)

local timeInSeconds = 0



local function getTime() do
		timeInSeconds = timer.timerInSeconds
		
		return timeInSeconds
	end
end












local function getPlayerThumbnail(player, ThumbnailType, ThumbnailSize) do
		
		local isSuccess, thumbnailUrl = pcall(function()
			return PlayersService:GetUserThumbnailAsync(player.UserId, ThumbnailType, ThumbnailSize)
		end
		)
		
		if isSuccess then
			return thumbnailUrl
		else
			print("Error: ThumbnailURL for " .. player.Name .. " does Not Exists")
			return nil
		end
	end
end










function displayPlayers(player, seconds) do


	local Players = PlayersService:GetPlayers()





		local playerGui = player:WaitForChild("PlayerGui")

		print("Display Player for GUI: " .. player.Name)
		

		if playerGui then
			

				--local resultScrollingFrame = playerGui.Lobby.GameEndFrame:WaitForChild("ScrollingFrame")

			
			local ScrollingPane = game.StarterGui.Lobby.GameEndFrame:WaitForChild("ScrollingFrame")
			


		
			--Frame for every player who finished
			local playerResultFrame = Instance.new("Frame")
			
			playerResultFrame.Name = "Frame" .. playersInFinishLine.finishedPlayerCount+1
			
			print(playerResultFrame.Name)
			
			playerResultFrame.BackgroundColor3 = Color3.new(0.619608, 0.619608, 0.619608)
			playerResultFrame.Position = UDim2.new(0, 0, 0, 0+(playersInFinishLine.finishedPlayerCount* frameGapsVertical))
			playerResultFrame.Size = UDim2.new(0, 810, 0, 80)
			playerResultFrame.Visible = true

			playerResultFrame.Parent = ScrollingPane


		
			--For Corners
			local playerResultFrameCorner = Instance.new("UICorner")
			playerResultFrameCorner.CornerRadius = UDim.new(0, 15)	
			playerResultFrameCorner.Parent = playerResultFrame

			
			
			
			
			
			-- Player End Game Rankings
			
			local playerFinishedOrder = Instance.new("TextLabel")
			playerFinishedOrder.Text = playersInFinishLine.finishedPlayerCount+ 1
			
			playerFinishedOrder.Size = UDim2.new(0, 40, 0, 40)
			playerFinishedOrder.Position = UDim2.new(0, 20, 0, 20)
			playerFinishedOrder.BackgroundTransparency = 1
			playerFinishedOrder.TextScaled = true
			playerFinishedOrder.Visible = true
			
			if playerFinishedOrder.Text == "1" then
				playerFinishedOrder.TextColor3 = Color3.new(1, 0.87451, 0.133333)
			elseif playerFinishedOrder.Text == "2" then
				playerFinishedOrder.TextColor3 = Color3.new(0.901961, 0.815686, 0.870588)
			elseif playerFinishedOrder.Text == "3" then
				playerFinishedOrder.TextColor3 = Color3.new(0.815686, 0.454902, 0.313725)
			else
				playerFinishedOrder.TextColor3 = Color3.new(1, 1, 1)
			end
			
			playerFinishedOrder.Parent = playerResultFrame
		
			
			
			

			
			
			--Image Frame
			local playerResultImageFrame = Instance.new("Frame")
			
			playerResultImageFrame.BackgroundColor3 = Color3.new(1, 1, 1)
			playerResultImageFrame.Size = UDim2.new(0, 55, 0, 55)
			playerResultImageFrame.Position = UDim2.new(0, 75, 0, 12.5)
			
			playerResultImageFrame.Parent = playerResultFrame
			
			local playerResultImageFrameCorner = Instance.new("UICorner")
			playerResultImageFrameCorner.CornerRadius = UDim.new(0, 70)
			playerResultImageFrameCorner.Parent = playerResultImageFrame

			
			
			--Image itself
			local playerResultImage = Instance.new("ImageLabel")
			playerResultImage.Parent = playerResultImageFrame
			
			
			local playerHeadShotURL = getPlayerThumbnail(
				player, 
				Enum.ThumbnailType.HeadShot, 
				Enum.ThumbnailSize.Size420x420
			)
			
			playerResultImage.Image = playerHeadShotURL
			playerResultImage.Size = UDim2.new(0, 50, 0, 50)
			playerResultImage.Position = UDim2.new(0, 3.5, 0, -5)
			playerResultImage.BackgroundTransparency = 1
			playerResultImage.Visible = true

			
			






			--Player Name
			local playerResultName = Instance.new("TextLabel")
			playerResultName.Parent = playerResultFrame

			playerResultName.Text = player.Name
			playerResultName.TextSize = 20
			
			playerResultName.Size = UDim2.new(0.5, 0, 0.5, 0)
			playerResultName.Position = UDim2.new(0, 15, 0, 20)
			playerResultName.BackgroundTransparency = 1
			playerResultName.TextColor3 = Color3.new(1, 1, 1)


			playerResultName.Visible = true
			
			
			
			
			
			--Player Time
			local playerResultTime = Instance.new("TextLabel")
			
			local minutes = seconds/60
			local extra_Seconds = seconds % 60
			
			
			playerResultTime.Text = string.format("%02d:%02d", minutes, extra_Seconds)
			playerResultTime.TextSize = 16
			playerResultTime.Size = UDim2.new(0.5, 0, 0.5, 0)
			playerResultTime.Position = UDim2.new(0, 500, 0, 20)
			playerResultTime.BackgroundTransparency = 1
			playerResultTime.TextColor3 = Color3.new(1, 1, 1)
			playerResultTime.Visible = true
			

			playerResultTime.Parent = playerResultFrame
			 
			
			playersInFinishLine.finishedPlayerCount += 1



		end
	end
	
end








part.Touched:Connect(function(hit)
	local character = hit.Parent

	local player = game.Players:GetPlayerFromCharacter(character)
	

	if playersInGame.isAllDead == false then
			
		for index, p in playersInGame.ingamePlayers do
		
			if p == player and player then
				local isFound = false

				
				for index2, p2 in playersInFinishLine.FinishedPlayers do
					
					if p2 == player then
						isFound = true
						break
					end
					
					
				end 
				
				


				if isFound == false then
					table.insert(playersInFinishLine.FinishedPlayers, p)
					table.insert(playersInFinishLine.fixedFinishedPlayers, p)
					
					local timeInSeconds = getTime()
					displayPlayers(p, timeInSeconds)
					
					print("===>>> PLAYER" .. player.Name .. " INSERTED")
					print(playersInFinishLine.FinishedPlayers)
					print("Player finished")
					return
				end
			end
			
		
		end
	end
	
	
	
end)