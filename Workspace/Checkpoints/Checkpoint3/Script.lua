

checkpoint = script.Parent

checkpoint3 = require(game.Workspace.Maps.Map1.Structure.Parts.Checkpoint3.Checkpoint3)
checkpoint2 = require(game.Workspace.Maps.Map1.Structure.Parts.Checkpoint2.Checkpoint2)
checkpoint1 = require(game.Workspace.StartingPoint.Checkpoint1.FirstCheckpoint)




checkpoint.Touched:Connect(function(hit)
	
	local playerChar = hit.Parent
	
	
	
	
	if playerChar then
		local playerFromChar = game.Players:GetPlayerFromCharacter(playerChar)
		local found = false

		-- avoid debounce purpose is to check if the player is already in the table
		for i, player in checkpoint3.checkedPlayers do
			
			if #checkpoint3.checkedPlayers == 0 then
				
				table.insert(checkpoint3.checkedPlayers, playerFromChar)
				print(checkpoint3.checkedPlayers)
				break
			elseif player == playerFromChar then
				found = true
				break
			end
			
		end
		
		if found == false then
			table.insert(checkpoint3.checkedPlayers, playerFromChar)
		end
	

		
		for i, player in checkpoint2.checkedPlayers do
			
			if player == playerFromChar then
				table.remove(checkpoint2.checkedPlayers, i)
			end
		end


		for i, player in checkpoint1.checkedPlayers do
	
			if player == playerFromChar then
				
				table.remove(checkpoint1.checkedPlayers, i)
				break
			end
	
		end
		
		
		print(checkpoint3.checkedPlayers)

		-- NEED TO DO NEXT: WHEN PLAYER DIED DURING CHECKPOINT 1 HE WILL RESPAWN AT CHECKPOINT 1
		
	end

	
	
end)
