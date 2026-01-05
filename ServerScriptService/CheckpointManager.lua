local Players = game:GetService("Players")

first = require(game.Workspace.StartingPoint.Checkpoint1.FirstCheckpoint)
second = require(game.Workspace.Maps.Map1.Structure.Parts.Checkpoint2.Checkpoint2)
third = require(game.Workspace.Maps.Map1.Structure.Parts.Checkpoint3.Checkpoint3)


local dead = require(game.Workspace.PlayersInGame)


-- When player respawns, move them to their checkpoint if set
local function onCharacterAdded(player, character)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if humanoidRootPart and dead.isDead == false then
		
		for i, p in third.checkedPlayers do
			if p == player then
				character:PivotTo(CFrame.new(game.Workspace.Maps.Map1.Structure.Parts.Checkpoint3.Position +  Vector3.new(0, 10, 0)) * CFrame.Angles(0, math.rad(90), 0))
			end
		end
		
		for i, p in second.checkedPlayers do
			if p == player then
				character:PivotTo(CFrame.new(game.Workspace.Maps.Map1.Structure.Parts.Checkpoint2.Position +  Vector3.new(0, 10, 0)) * CFrame.Angles(0, math.rad(90), 0))
			end
		end
		
		for i, p in first.checkedPlayers do
			if p == player then
				character:PivotTo(CFrame.new(game.Workspace.StartingPoint.Checkpoint1.Position) * CFrame.Angles(0, math.rad(270), 0))
				break
			end
		end
		
		
		
   
        
	end
	
	dead.isAllDead = false
	
end



Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
        onCharacterAdded(player, character)
    end)
end)


