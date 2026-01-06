countdown_remoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild("UpdateTimer")

textLabelGUI = script.Parent

player =  game.Players.LocalPlayer


countdown_remoteEvent.OnClientEvent:Connect(function(seconds)
	
	textLabelGUI.Visible = true
	textLabelGUI.Text = seconds
	
	
	
	if seconds == "Game Started" then
		
		task.wait(1.5)
		
		textLabelGUI.Visible = false
		
		
	end
	
	
	
end)