shared.autofarm = not shared.autofarm or true

local plr = game.Players.LocalPlayer
while shared.autofarm do
    if not shared.autofarm then break end
    game:GetService("ReplicatedStorage").MissionEvent:FireServer("questpls", "SteakDelivery")
	plr.Backpack:WaitForChild("Plate").Parent = plr.Character
	for _, v in ipairs(workspace.WanderingNPCs:GetChildren()) do
	    if not plr.Character:FindFirstChild("Plate") then break end
	    if v.Name ~= "Citizen" then continue end
	    if not v:FindFirstChild("meathand") then continue end
	    if not v:FindFirstChild("toucharea") then continue end
		firetouchinterest(plr.Character.HumanoidRootPart,v.toucharea,1)
		wait()
		firetouchinterest(plr.Character.HumanoidRootPart,v.toucharea,0)
		wait(.1)
	end
	wait(7.5)
end
