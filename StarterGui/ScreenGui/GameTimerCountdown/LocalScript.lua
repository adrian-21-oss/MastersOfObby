
timerCountdown_remoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild("PlayTimer")

timerCountdownUI = script.Parent

player = game.Players.LocalPlayer


timerCountdown_remoteEvent.OnClientEvent:Connect(function(seconds)
	
	timerCountdownUI.Visible = true
	
	if seconds == 0 then
		
		timerCountdownUI.Text = "Game Over!"
		timerCountdownUI.TextColor3 = Color3.new(0, 0, 0)
		
		task.wait(3)
		
		timerCountdownUI.Text = " "
		timerCountdownUI.Visible = false
		
	else
		
		local minutes = math.floor(seconds/60)
		local extra_Seconds = seconds % 60
		
		if seconds < 61 then
			
			timerCountdownUI.TextColor3 = Color3.new(0.737255, 0, 0)
			
		end
		
		timerCountdownUI.Text = string.format("%02d:%02d", minutes, extra_Seconds)	


	end
	
	
	--print(minutes .. ":" .. extra_Seconds)
	
	
	
end)
