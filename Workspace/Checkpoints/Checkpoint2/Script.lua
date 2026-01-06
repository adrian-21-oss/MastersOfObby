

checkpoint = script.Parent

checkpoint2 = require(game.Workspace.Maps.Map1.Structure.Parts.Checkpoint2.Checkpoint2)
checkpoint1 = require(game.Workspace.StartingPoint.Checkpoint1.FirstCheckpoint)




checkpoint.Touched:Connect(function(hit)
	
	local playerChar = hit.Parent
	
	
	
	
	if playerChar then
		local playerFromChar = game.Players:GetPlayerFromCharacter(playerChar)
		local found = false

		-- avoid debounce
		for i, player in checkpoint2.checkedPlayers do
			
			if #checkpoint2.checkedPlayers == 0 then
				
				table.insert(checkpoint2.checkedPlayers, playerFromChar)
				print(checkpoint2.checkedPlayers)
				break
			elseif player == playerFromChar then
				found = true
				break
			end
			
		end
		
		if found == false then
			table.insert(checkpoint2.checkedPlayers, playerFromChar)
		end
	

		



		for i, player in checkpoint1.checkedPlayers do
	
			if player == playerFromChar then
				
				table.remove(checkpoint1.checkedPlayers, i)
				break
			end
	
		end
		
		
		print(checkpoint2.checkedPlayers)


		-- NEED TO DO NEXT: WHEN PLAYER DIED DURING CHECKPOINT 1 HE WILL RESPAWN AT CHECKPOINT 1
		
		
	end

	
	
end)
