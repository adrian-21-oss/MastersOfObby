

readyCountdown_remoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild("ReadyTimer")

players = game.Players.LocalPlayer

text = script.Parent



readyCountdown_remoteEvent.OnClientEvent:Connect(function(seconds)
	
	
	text.Visible = true
	
	
	text.Text = seconds
	
	
	if seconds == "Go!" then
		
		task.wait(1)
		
		text.Visible = false
		
	end
	
	
end)