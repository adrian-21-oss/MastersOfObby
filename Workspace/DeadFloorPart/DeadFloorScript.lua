
local deadFloor = script.Parent

local players




deadFloor.Touched:Connect(function(hit)

	for i, player in players do
		
		local character = player.Character -- back then it was game.Workspace:FindFirstChild(string(player)
		if character then
			if hit.Parent == character then

				character.Humanoid.Health = 0
				

			end
	
			
		end
		
		
	end

end)



while true do

	players = game.Players:GetChildren()
	-- print(players)
	task.wait(3)
	
end
