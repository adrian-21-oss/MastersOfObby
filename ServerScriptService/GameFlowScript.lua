
local countdown_remoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild("UpdateTimer")
local playTimer_remoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild("PlayTimer")
local sendPlayer_remoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild("SendPlayer")
local readyCountdown_remoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild("ReadyTimer")




local playersScript = require(game.Workspace.PlayersInGame)
local playersStatus = require(game.Workspace.PlayersInGame)

local timer_module = require(game.ServerScriptService.timer)



local finishedPlayers = require(game.Workspace.Maps.Map1.Structure.Parts.FinishPlatform.TransparentPart.FinishedPlayers)



local firstCheckpoint = require(game.Workspace.StartingPoint.Checkpoint1.FirstCheckpoint)
local secondCheckpoint = require(game.Workspace.Maps.Map1.Structure.Parts.Checkpoint2.Checkpoint2)
local thirdCheckpoint = require(game.Workspace.Maps.Map1.Structure.Parts.Checkpoint3.Checkpoint3)




local PlayersService = game:GetService("Players")


local players = game.Players:GetChildren()






local soundFolder = game.Workspace:FindFirstChild("BackgroundMusic")

local LobbySound = soundFolder:WaitForChild("LobbySound")
local GameSound = soundFolder:WaitForChild("Map1Sound")
local ClockTickSound = soundFolder.SoundEffects:WaitForChild("ClockTick")



function displayPlayers() do


		local Players = PlayersService:GetPlayers()

		GameSound:Stop()
		LobbySound:Play()
		
		task.wait(1)

		if #finishedPlayers.fixedFinishedPlayers == 0 then
			

			for _, player in Players do

				local playerGui = player:WaitForChild("PlayerGui")

				local gameEndAnalysis = playerGui.Lobby:WaitForChild("GameEndFrame")
				local MapChoice = playerGui.Lobby:WaitForChild("MapChoice")

				
				local ScrollingFrame = playerGui.Lobby.GameEndFrame:WaitForChild("ScrollingFrame")
				
				local noPlayerFinishedText = Instance.new("TextLabel")
				noPlayerFinishedText.Text = "No Players Finished"
				noPlayerFinishedText.Size = UDim2.new(0, 200, 0, 50)
				noPlayerFinishedText.Position = UDim2.new(0, 200, 0, 100)
				noPlayerFinishedText.BackgroundTransparency = 1
				noPlayerFinishedText.TextColor3 = Color3.new(0, 0, 0)
				noPlayerFinishedText.Font = Enum.Font.SourceSansBold
				noPlayerFinishedText.TextScaled = true
				noPlayerFinishedText.Visible = true
				
				noPlayerFinishedText.Parent = ScrollingFrame
				
			

				gameEndAnalysis.Visible = true



			end
			
		else


			for _, player in Players do

				local playerGui = player:WaitForChild("PlayerGui")

				local gameEndAnalysis = playerGui.Lobby:WaitForChild("GameEndFrame")
				local MapChoice = playerGui.Lobby:WaitForChild("MapChoice")


				

				
				gameEndAnalysis.Visible = true


				

			end
		end
		
		task.wait(5)



		for _, player in Players do
			local playerGui = player:WaitForChild("PlayerGui")

			local gameEndAnalysis = playerGui.Lobby:WaitForChild("GameEndFrame")
			local MapChoice = playerGui.Lobby:WaitForChild("MapChoice")



			gameEndAnalysis.Visible = false
			
			
			
			

		end
		

		task.wait(0.5)





		for _, player in Players do
			local playerGui = player:WaitForChild("PlayerGui")

			local gameEndAnalysis = playerGui.Lobby:WaitForChild("GameEndFrame")
			local MapChoice = playerGui.Lobby:WaitForChild("MapChoice")



			MapChoice.Visible = true


		end
		
		

			--Traverse to each finish players and destroy the frames that they used in the GameEndAnalysis in Starter UI
		
		
		local gameEndAnalysis = game.StarterGui.Lobby:WaitForChild("GameEndFrame")
		local ScrollingFrame = gameEndAnalysis:WaitForChild("ScrollingFrame")
		
		
		
		local sample = ScrollingFrame:GetChildren()
		
		for i, sam in sample do
			print(sam.Name .. " Destroyed")
			sam:Destroy()
		end
		
		
		--for i, player in finishedPlayers.fixedFinishedPlayers do
		--	print("Player")
			
		--	local frameToDestroy = ScrollingFrame:FindFirstChild("Frame" .. tostring(i))
			

 			
		--	frameToDestroy:Destroy()
			
		--end
		
		
		
		
		finishedPlayers.finishedPlayerCount = 0
		
		table.clear(finishedPlayers.FinishedPlayers)

		table.clear(finishedPlayers.fixedFinishedPlayers)

		
		
		
		task.wait(5)





		for _, player in Players do
			local playerGui = player:WaitForChild("PlayerGui")

			local gameEndAnalysis = playerGui.Lobby:WaitForChild("GameEndFrame")
			local MapChoice = playerGui.Lobby:WaitForChild("MapChoice")



			MapChoice.Visible = false


		end

		task.wait(3)

		timer(5)
		
	end
end






function play(seconds) do
		

		PlayersService.PlayerRemoving:Connect(function(player)
			
			local allPlayers = playersStatus.ingamePlayers
			local playerFound = false
			
			print("PlayerRemoving Activated Step 0 - Making sure the player doesn't exist now")

			for i, selectedPlayer in allPlayers do
				if player == selectedPlayer then
					playerFound = true
					break
				end
			end
			
			
			if playerFound == false then
				print("Player is not in the game, no need to remove")	
			else
			
				
				print("PlayerRemoving Activated Step 1")
				
				local checkpointTable = {firstCheckpoint, secondCheckpoint, thirdCheckpoint}
				
				
				for i, lists in checkpointTable do

					for j, content in lists do
						print("Table exists, players: " .. #content .. "Players Left")
						for k, con in content do


							local playerName = con

							if player.Name == tostring(playerName) then

								print("------------")							
								print(content)
								table.remove(content, k)
								print(content)
								print("------------")							

								break
							elseif #content == 0 and i == 3 then
								break
							end

						end
					end
				end
				
				print("----------------------")

				
				for i, p in playersStatus.ingamePlayers do
					
					if player == p then
						print("Step 2")
						for i2, p2 in finishedPlayers.FinishedPlayers do
							if p2 == p then
								print("Step 3")
								print("---------------------------------")
								
								print("Finished Players before removing:" .. #finishedPlayers.FinishedPlayers .. "Players Left")
								print(finishedPlayers.FinishedPlayers)
								
								table.remove(finishedPlayers.FinishedPlayers, i2)
								
								print("Finished Players after removing:" .. #finishedPlayers.FinishedPlayers  .. "Players Left")
								print(finishedPlayers.FinishedPlayers)
								
								finishedPlayers.finishedPlayerCount -= 1
								print("---------------------------------")

							end
						end
						
						print("---------------------------------")
						print("Ingame Players before removing: " .. #playersStatus.ingamePlayers .. " Players Left")
						print(playersStatus.ingamePlayers)
						print(#playersStatus.ingamePlayers)
						
						table.remove(playersStatus.ingamePlayers, i)
						
						print("Ingame Players after removing: " .. #playersStatus.ingamePlayers .. " Players Left")
						print(playersStatus.ingamePlayers)
						print(#playersStatus.ingamePlayers)
						print("---------------")
						
						for i3, p3 in playersStatus.playerStatus do
							
							if p3["playerName"] == player.Name then
								
								print("---------------------------------")
								print("Players Status before removing:" .. #playersStatus.playerStatus .. "Players Left")
								print(playersStatus.playerStatus)
								table.remove(playersStatus.playerStatus, i3)
								print("Players Status after removing:" .. #playersStatus.playerStatus .. "Players Left")
								print(playersStatus.playerStatus)
								print("---------------------------------")

							end
						end
						
						print(" >> A Player " .. player.Name .. " left the game")	

					end

				end	
				
				playerFound = false
			end
		end)
		
		
		while seconds > -1 do
			
			print(seconds .. " seconds")
			playTimer_remoteEvent:FireAllClients(seconds)
			timer_module.timerInSeconds = seconds
			
			wait(1)
			

			
			
			
			seconds -= 1
			
			if seconds == 0 then
				
				
				playTimer_remoteEvent:FireAllClients(seconds)
				
				
				
				local checkpointTable = {firstCheckpoint, secondCheckpoint, thirdCheckpoint}
				task.wait(1)
				
				for i, lists in checkpointTable do
					for j, content in lists do
						for k, con in content do
							
							local character = con.Character
							
							if character:FindFirstChild("Humanoid") then
								character.Humanoid.Health = 0
								playersStatus.isAllDead = true

							end
							 							
						end
					end
				end
				
				

				table.clear(firstCheckpoint.checkedPlayers)
				table.clear(secondCheckpoint.checkedPlayers)
				table.clear(thirdCheckpoint.checkedPlayers)
				

				
				task.wait(3)
				
				for i, player in playersScript.ingamePlayers do
					
					local character = player.Character
					
					character:PivotTo(CFrame.new(Vector3.new(0, 5, 9)) * CFrame.Angles(0, math.rad(270), 0))
					
					
				end
				
				local gate = game.Workspace.StartingPoint.Transparent:FindFirstChild("Gate")

				gate.CanCollide = true
				gate.Transparency = 0.4
				
				playersStatus.isAllDead = false
				
				table.clear(playersStatus.ingamePlayers)
				
				displayPlayers()
				
			

			
			 
			elseif #playersStatus.ingamePlayers == 0 then
				
				

				playTimer_remoteEvent:FireAllClients(0)

				task.wait(1)


				table.clear(firstCheckpoint.checkedPlayers)
				table.clear(secondCheckpoint.checkedPlayers)
				table.clear(thirdCheckpoint.checkedPlayers)



				task.wait(3)

				local gate = game.Workspace.StartingPoint.Transparent:FindFirstChild("Gate")

				gate.CanCollide = true
				gate.Transparency = 0.4


				displayPlayers()

				
			
			end
		

		
		end
		
		
		
		
		
	end
end


function ready(seconds) do
		
		
		print(playersStatus.playerStatus)

		while seconds > -1 do
			
			print(seconds)
			
			ClockTickSound:Play()
			
			
			
			wait(1)
			
			readyCountdown_remoteEvent:FireAllClients(seconds)
			
			
			if seconds == 0 then
				ClockTickSound:Play()

				
				readyCountdown_remoteEvent:FireAllClients("Go!")
				task.wait(0.0001)
				
				local gate = game.Workspace.StartingPoint.Transparent:FindFirstChild("Gate")

				gate.CanCollide = false
				gate.Transparency = 1
				
				task.wait(0.9999)

				
				play(5)

				
				
				
			end
			
			seconds -= 1
			
			
			
			
		end
		
		
	end
end




function teleport(players) do
		
		
		if players then
			
			local numberofPlayers = 0

			for i, player in players do
				
				-- print(player)
				
				sendPlayer_remoteEvent:FireAllClients(player, player.Name)
						

				local character = player.Character
				
				if character then
					--character:PivotTo(CFrame.new(Vector3.new(143, 5, 9)) * CFrame.Angles(0, math.rad(270), 0))					
					
					character:PivotTo(CFrame.new(Vector3.new(320, 416, 5.5)) * CFrame.Angles(0, math.rad(270), 0))					
					


					LobbySound:Stop()
					GameSound:Play()
					
					table.insert(playersScript.ingamePlayers, player)
					table.insert(firstCheckpoint.checkedPlayers, player)
					
					
					
					
					
					
					
					
					
					
					
					
					
					numberofPlayers += 1


					--hello
					local playerForStatus = {
						order = numberofPlayers,
						playerName = player.Name,
						isPlayerDeadnotCausedbySystem = false,
					}
					
					playersStatus.playerStatus[numberofPlayers] = playerForStatus
					
					
					
					
					
					
				end 
				
				
			end


			ready(5)

			
		end
		
	end
	

end





function timer(seconds) do
		
		
		while seconds > -1 do
			wait(1)
			
			
			players = game.Players:GetChildren()
			
			
			
			countdown_remoteEvent:FireAllClients("The game will start in \n" .. seconds .. " seconds")
			
			if seconds == 0 then
				countdown_remoteEvent:FireAllClients("Game Started")
				
				wait(1)
				print(#players .. "Number of Players in Server")
				teleport(players)
				
				
				
				
			end
			
			seconds = seconds - 1

		end
		
		
		
	end
end



if players then
	timer(5)
end








--[[

local Timer = {}
Timer._index = Timer

function Timer.new(seconds, onTick, onFinish)		-- INITIALIZE (Timer class)
	local self = setmetatable({}, Timer)
	
	self.Seconds = seconds
	self.OnTick = onTick
	self.OnFinish = onFinish
	
	
	return self
end

function Timer:Start()						--- METHOD
	while self.Seconds >= 0 do
		if self.OnTick then
			self.OnTick(self.Seconds)
			
		end
		
		task.wait(1)
		self.Seconds -= 1
	end
	
	if self.OnFinish then
		self.OnFinish()
	end
end

return Timer
]]